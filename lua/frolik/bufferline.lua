lvim.builtin.bufferline.options.diagnostics = 'nvim_lsp'

local colors = require("frolik.colors")
vim.cmd("autocmd ColorScheme * highlight BufferLineFill guibg=" .. colors.nord1)
