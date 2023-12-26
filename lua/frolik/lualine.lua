local colors = {
    nord1  = '#3B4252',
    nord3  = '#4C566A',
    nord5  = '#E5E9F0',
    nord6  = '#ECEFF4',
    nord7  = '#8FBCBB',
    nord8  = '#88C0D0',
    nord13 = '#EBCB8B',
    nord14 = '#2E3440',
}

vim.cmd("autocmd ColorScheme * highlight LeapLabelPrimary guifg=" .. colors.nord1 .. " guibg=" .. colors.nord8)
vim.cmd("autocmd ColorScheme * highlight StatusLine ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE")
vim.cmd("autocmd ColorScheme * highlight NormalFloat guifg=" .. colors.nord5 .. " guibg=NONE")
vim.cmd("autocmd ColorScheme * highlight FloatBorder guifg=" .. colors.nord5 .. " guibg=NONE")
vim.cmd("autocmd ColorScheme * highlight LspInfoBorder guifg=" .. colors.nord5 .. " guibg=NONE")
vim.cmd("autocmd ColorScheme * highlight BufferLineFill guibg=NONE")

-- Hover Markdown Fix
vim.cmd("autocmd ColorScheme * highlight link markdownError NONE")
vim.cmd("autocmd ColorScheme * highlight markdownError guifg=NONE guibg=NONE")
vim.cmd("autocmd ColorScheme * highlight link luaError NONE")
vim.cmd("autocmd ColorScheme * highlight luaError guifg=NONE guibg=NONE")
vim.cmd("autocmd ColorScheme * highlight link luaParenError NONE")
vim.cmd("autocmd ColorScheme * highlight luaParenError guifg=NONE guibg=NONE")

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
