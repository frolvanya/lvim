local colors = require("frolik.colors")
vim.cmd("autocmd ColorScheme * highlight NormalFloat guifg=" .. colors.nord5 .. " guibg=NONE")
vim.cmd("autocmd ColorScheme * highlight FloatBorder guifg=" .. colors.nord5 .. " guibg=NONE")
vim.cmd("autocmd ColorScheme * highlight LspInfoBorder guifg=" .. colors.nord5 .. " guibg=NONE")
vim.cmd("autocmd ColorScheme * highlight link LspInlayHint Comment")
vim.cmd("autocmd ColorScheme * highlight WinBarNC guifg=NONE guibg=NONE")

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    { command = "black", filetypes = { "python" } },
    {
        command = "prettier",
        extra_args = { "--print-with", "100", "--tab-width", "4" },
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "css" },
    },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
    { command = "eslint_d", filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" } },
}

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd", "rust_analyzer" })

local clangd_opts = {
    cmd = { "clangd", "--all-scopes-completion", "--background-index", "--pch-storage=disk", "--log=info",
        "--completion-style=detailed", "--enable-config", "--clang-tidy", "--offset-encoding=utf-16" },
    filetypes = { "c", "cpp" },
    root_dir = lvim.root_dir,
}

require("lvim.lsp.manager").setup("clangd", clangd_opts)
