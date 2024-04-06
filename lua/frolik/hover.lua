vim.cmd("autocmd ColorScheme * highlight link markdownError NONE")
vim.cmd("autocmd ColorScheme * highlight markdownError guifg=NONE guibg=NONE")
vim.cmd("autocmd ColorScheme * highlight link luaError NONE")
vim.cmd("autocmd ColorScheme * highlight luaError guifg=NONE guibg=NONE")
vim.cmd("autocmd ColorScheme * highlight link luaParenError NONE")
vim.cmd("autocmd ColorScheme * highlight luaParenError guifg=NONE guibg=NONE")

local function show_documentation()
    local filetype = vim.bo.filetype
    if vim.tbl_contains({ "vim", "help" }, filetype) then
        vim.cmd("h " .. vim.fn.expand("<cword>"))
    elseif vim.tbl_contains({ "man" }, filetype) then
        vim.cmd("Man " .. vim.fn.expand("<cword>"))
    elseif vim.tbl_contains({ "rs" }, filetype) then
        vim.cmd("<cmd>RustLsp hover actions<cr>")
    elseif vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
        require("crates").show_popup()
    else
        vim.lsp.buf.hover()
    end
end

vim.lsp.handlers["textDocument/hover"] =
    vim.lsp.with(
        vim.lsp.handlers.hover,
        {
            border = "rounded",
            max_width = 90,
            max_height = 30,
        }
    )

lvim.lsp.buffer_mappings.normal_mode["K"] = { show_documentation, "Show hover" }

require("lspconfig.ui.windows").default_options.border = "rounded"
