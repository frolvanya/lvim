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

lvim.builtin.lualine.sections = {
    lualine_a = {
        { "mode", separator = { left = "", right = "" } },
    },
    lualine_b = { "filename" },
    lualine_c = {
        { "branch", icon = lvim.icons.git.Branch },
        {
            "diff",
            symbols = {
                added = lvim.icons.git.LineAdded .. " ",
                modified = lvim.icons.git.LineModified .. " ",
                removed = lvim.icons.git.LineRemoved .. " "
            },
            padding = { left = 2, right = 1 }
        },
    },
    lualine_x = {},
    lualine_y = { "filetype" },
    lualine_z = { { "progress", separator = { left = "", right = "" } } },
}

lvim.builtin.lualine.inactive_sections = {
    lualine_a = { "filename" },
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
            },
            buffers_color = {
                active = "lualine_a_normal",
                inactive = "lualine_b_normal",
            },
        },
    },
    lualine_x = {
        {
            "diagnostics",
            sources = { "nvim_lsp" },
            sections = { "error", "warn", "info", "hint" },
            diagnostics_color = {
                error = "DiagnosticError",
                warn  = "DiagnosticWarn",
                info  = "DiagnosticInfo",
                hint  = "DiagnosticHint",
            },
            symbols = {
                error = lvim.icons.diagnostics.BoldError .. " ",
                warn = lvim.icons.diagnostics.BoldWarning .. " ",
                info = lvim.icons.diagnostics.BoldInformation .. " ",
                hint = lvim.icons.diagnostics.BoldHint .. " ",
            },
            separator = { left = "", right = "" },
            colored = true,
            update_in_insert = false,
            always_visible = false,
        }
    },
    lualine_z = { { "datetime", style = "%H:%M", separator = { left = "", right = "" } } },
}

lvim.builtin.lualine.extensions = {
    require("frolik.lualine-extensions.dap"),
    require("frolik.lualine-extensions.fugitive"),
    require("frolik.lualine-extensions.harpoon-ext"),
    require("frolik.lualine-extensions.lazy"),
    require("frolik.lualine-extensions.oil"),
    require("frolik.lualine-extensions.toggleterm"),
    require("frolik.lualine-extensions.telescope"),
    require("frolik.lualine-extensions.quickfix")
}
