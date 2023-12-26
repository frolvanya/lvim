local function show_documentation()
    local filetype = vim.bo.filetype
    if vim.tbl_contains({ 'vim', 'help' }, filetype) then
        vim.cmd('h ' .. vim.fn.expand('<cword>'))
    elseif vim.tbl_contains({ 'man' }, filetype) then
        vim.cmd('Man ' .. vim.fn.expand('<cword>'))
    elseif vim.fn.expand('%:t') == 'Cargo.toml' and require('crates').popup_available() then
        require('crates').show_popup()
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

require('lspconfig.ui.windows').default_options.border = 'rounded'

-- local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
-- ---@diagnostic disable-next-line: duplicate-set-field
-- function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
--     opts = opts or {}
--     opts.max_width = opts.max_width or 90
--     opts.max_height = opts.max_height or 30
--     return orig_util_open_floating_preview(contents, syntax, opts, ...)
-- end
