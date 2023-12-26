lvim.builtin.cmp.window.completion.scrollbar = false
lvim.builtin.cmp.experimental.ghost_text     = true

local cmp                                    = require("cmp")

lvim.builtin.cmp.preselect                   = require "cmp.types.cmp".PreselectMode.None

local has_words_before                       = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

lvim.builtin.cmp.mappings                    = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<Tab>"] = vim.schedule_wrap(function(fallback)
        if cmp.visible() and has_words_before() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
        else
            fallback()
        end
    end),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
    }),
}
lvim.builtin.cmp.sources                     = {
    { name = "copilot" },
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "buffer" },
    { name = "crates" },
}

lvim.icons.ui.Ellipsis                       = "…"
lvim.builtin.cmp.formatting.max_width        = 10

local lspkind                                = require('lspkind')
-- lvim.builtin.cmp.formatting.fields = { "kind", "abbr", "menu" }
lvim.builtin.cmp.formatting.format           = lspkind.cmp_format({
    mode = 'symbol',
    maxwidth = 50,
    ellipsis_char = lvim.icons.ui.Ellipsis,
    symbol_map = { Copilot = lvim.icons.git.Octoface, Snippet = " " },
    ---@diagnostic disable-next-line: unused-local
    before = function(entry, vim_item)
        vim_item.menu = nil
        return vim_item
    end,
})
