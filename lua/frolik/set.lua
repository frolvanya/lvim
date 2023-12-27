vim.opt.shiftwidth     = 4
vim.opt.tabstop        = 4
vim.opt.hlsearch       = false
vim.opt.updatetime     = 50
vim.opt.timeoutlen     = 50
vim.opt.indentexpr     = ""
vim.opt.smartindent    = true

vim.opt.relativenumber = true

vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

vim.cmd("autocmd ColorScheme * highlight StatusLine ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE")
vim.cmd("autocmd ColorScheme * highlight TabLineFill ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE")

lvim.colorscheme = "nord"
lvim.log.level = "warn"
lvim.format_on_save = true

lvim.autocommands = {
    {
        "BufEnter",
        {
            pattern = { "*.txt", "*.tex", "*.md" },
            command = "setlocal wrap",
        }
    },
    {
        "BufWritePre",
        {
            pattern = "*.json",
            command = ":%!jq ."
        },
    },
}

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
