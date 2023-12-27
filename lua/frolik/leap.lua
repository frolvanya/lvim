require('leap').add_default_mappings()

vim.keymap.set('n', 's', function()
    local current_window = vim.fn.win_getid()
    require('leap').leap { target_windows = { current_window } }
end)

local colors = require("frolik.colors")
vim.cmd("autocmd ColorScheme * highlight LeapLabelPrimary guifg=" .. colors.nord1 .. " guibg=" .. colors.nord8)
