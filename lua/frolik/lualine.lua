local colors = require("frolik.colors")

local nordic = {
    normal = {
        a = { fg = colors.nord1, bg = colors.nord8, gui = 'bold' },
        b = { fg = colors.nord5, bg = colors.nord1 },
        c = { fg = colors.nord5, bg = colors.nord14 }
    },
    insert = { a = { fg = colors.nord1, bg = colors.nord6, gui = 'bold' } },
    visual = { a = { fg = colors.nord1, bg = colors.nord7, gui = 'bold' } },
    replace = { a = { fg = colors.nord1, bg = colors.nord13, gui = 'bold' } },
    inactive = {
        a = { fg = colors.nord1, bg = colors.nord8, gui = 'bold' },
        b = { fg = colors.nord5, bg = colors.nord1 },
        c = { fg = colors.nord5, bg = colors.nord1 },
    },
}

lvim.builtin.lualine.options = {
    theme = nordic,
    component_separators = '|',
    section_separators = { left = '', right = '' },
}

lvim.builtin.lualine.sections = {
    lualine_a = {
        { 'mode', separator = { left = '' } },
    },
    lualine_b = { 'filename', 'branch' },
    lualine_c = { --[[ { 'fileformat', symbols = { unix = '' } } ]] },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' --[[ , 'location' ]] },
    lualine_z = { { 'datetime', style = '%H:%M', separator = { right = '' } } },
}

lvim.builtin.lualine.inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location', { 'datetime', style = '%H:%M' } },
}

lvim.builtin.lualine.tabline = {
    -- lualine_a = { --[[ 'buffers' ]] },
    -- lualine_b = {},
    -- lualine_c = {},
    -- lualine_x = {},
    -- lualine_y = {},
    -- lualine_z = { { 'datetime', style = '%H:%M' } },
}
lvim.builtin.lualine.extensions = {}

return colors
