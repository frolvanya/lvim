local colors = require("frolik.colors")

local nordic = {
    normal = {
        a = { fg = colors.nord1, bg = colors.nord8, gui = "bold" },
        b = { fg = colors.nord5, bg = colors.nord1 },
        c = { fg = colors.nord5, bg = colors.nord14 }
    },
    insert = { a = { fg = colors.nord1, bg = colors.nord6, gui = "bold" } },
    visual = { a = { fg = colors.nord1, bg = colors.nord7, gui = "bold" } },
    replace = { a = { fg = colors.nord1, bg = colors.nord13, gui = "bold" } },
    inactive = {
        a = { fg = colors.nord1, bg = colors.nord8, gui = "bold" },
        b = { fg = colors.nord5, bg = colors.nord1 },
        c = { fg = colors.nord5, bg = colors.nord1 },
    },
}

lvim.builtin.lualine.options = {
    theme = nordic,
    component_separators = "",
    section_separators = { left = "", right = "" },
}

local Harpoonline = require("harpoonline")
-- Harpoonline.setup()
Harpoonline.setup({
    custom_formatter = function(data, opts)
        local letters = { "h", "j", "k", "l" }
        local idx = data.active_idx
        local slot = 0
        local slots = vim.tbl_map(function(letter)
            slot = slot + 1
            return idx and idx == slot and string.format("[%s]", letter) or string.format(" %s ", letter)
        end, vim.list_slice(letters, 1, math.min(#letters, #data.items)))

        local name = data.list_name and data.list_name or opts.default_list_name
        local header = string.format("%s%s%s", opts.icon, name == "" and "" or " ", name)
        return header .. " " .. table.concat(slots)
    end,
})

lvim.builtin.lualine.sections = {
    lualine_a = {
        { "mode", separator = { left = "", right = "" } },
    },
    lualine_b = {
        { "filename", separator = { right = "" } },
        {
            "branch",
            icon = lvim.icons.git.Branch,
            color = { bg = colors.nord15, fg = colors.nord1 },
            separator = { right = "" }
        },
        {
            "diff",
            symbols = {
                added = lvim.icons.git.LineAdded .. " ",
                modified = lvim.icons.git.LineModified .. " ",
                removed = lvim.icons.git.LineRemoved .. " "
            },
        },
    },
    lualine_c = {},
    lualine_x = {
        {
            Harpoonline.format,
            "filename",
            color = { bg = colors.nord15, fg = colors.nord1, gui = "bold" },
            separator = { left = "" }
        }
    },
    lualine_y = { "filetype" },
    lualine_z = { { "progress", separator = { left = "", right = "" }, color = { bg = colors.nord8, fg = colors.nord1, gui = "bold" } } },
}

lvim.builtin.lualine.inactive_sections = {
    lualine_a = {
        { "mode", separator = { left = "", right = "" } },
    },
    lualine_b = {
        { "filename", separator = { right = "" } },
        {
            "branch",
            icon = lvim.icons.git.Branch,
            color = { bg = colors.nord15, fg = colors.nord1 },
            separator = { right = "" }
        },
        {
            "diff",
            symbols = {
                added = lvim.icons.git.LineAdded .. " ",
                modified = lvim.icons.git.LineModified .. " ",
                removed = lvim.icons.git.LineRemoved .. " "
            },
        },
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { "filetype" },
    lualine_z = { { "progress", separator = { left = "", right = "" }, color = { bg = colors.nord8, fg = colors.nord1, gui = "bold" } } },
}

lvim.builtin.lualine.tabline = {
    lualine_a = {
        {
            "buffers",
            separator = { left = "", right = "" },
            right_padding = 2,
            symbols = { alternate_file = "" },
            max_length = vim.o.columns * 0.75,
            filetype_names = {
                TelescopePrompt = lvim.icons.ui.Telescope .. " Telescope",
                dashboard = " Dashboard",
                packer = " Packer",
                fzf = "FZF",
                alpha = " Alpha",
                oil = "󰏇  Oil",
                checkhealth = "󰥱 Checkhealth",
                harpoon = "󰈺 Harpoon",
                fugitive = "Fugitive",
                git = lvim.icons.git.Octoface .. " Git",
                gitcommit = lvim.icons.git.Octoface .. " Git Commit",
                chat = lvim.icons.git.Octoface .. " Copilot Chat",
            },
            buffers_color = {
                active = "lualine_a_normal",
                inactive = "lualine_b_normal",
            },
        },
    },
    lualine_x = {},
    lualine_z = {
        {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn", "info", "hint" },
            diagnostics_color = {
                error = { fg = colors.nord16 },
                warn = { fg = colors.nord17 },
                info = { fg = colors.nord18 },
                hint = { fg = colors.nord19 },
            },
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
            separator = { left = "" },
            color = {
                bg = colors.nord1,
            },
        },
        {
            "datetime",
            style = "%H:%M",
            separator = { left = "", right = "" },
            color = {
                bg = colors.nord8,
                fg = colors.nord1,
                gui = "bold",
            },
        }
    },
}

lvim.builtin.lualine.extensions = {
    require("frolik.lualine-extensions.dap"),
    require("frolik.lualine-extensions.copilot-chat"),
    require("frolik.lualine-extensions.fugitive"),
    require("frolik.lualine-extensions.harpoon-ext"),
    require("frolik.lualine-extensions.lazy"),
    require("frolik.lualine-extensions.oil"),
    require("frolik.lualine-extensions.toggleterm"),
    require("frolik.lualine-extensions.telescope"),
    require("frolik.lualine-extensions.quickfix")
}
