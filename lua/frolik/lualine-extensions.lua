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
    lualine_b = { "filename", "branch" },
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
                error = lvim.icons.diagnostics.Error .. " ",
                warn = lvim.icons.diagnostics.Warning .. " ",
                info = lvim.icons.diagnostics.Information .. " ",
                hint = lvim.icons.diagnostics.Hint .. " ",
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
    require("frolik.lualine.dap"),
    require("frolik.lualine.fugitive"),
    require("frolik.lualine.lazy"),
    require("frolik.lualine.oil"),
    require("frolik.lualine.toggleterm"),
    require("frolik.lualine.quickfix")
}