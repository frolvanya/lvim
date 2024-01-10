require("cmp")

lvim.builtin.cmp.experimental.ghost_text     = true
lvim.builtin.cmp.window.completion.scrollbar = false

lvim.builtin.cmp.preselect                   = require "cmp.types.cmp".PreselectMode.None


table.insert(lvim.builtin.cmp.sources, { name = "nvim_lsp_signature_help" })

local lspkind                      = require("lspkind")
lvim.icons.ui.Ellipsis             = "…"
lvim.builtin.cmp.formatting.format = lspkind.cmp_format({
    mode = "symbol",
    maxwidth = 50,
    ellipsis_char = lvim.icons.ui.Ellipsis,
    symbol_map = { Copilot = lvim.icons.git.Octoface, Snippet = " " },
    ---@diagnostic disable-next-line: unused-local
    before = function(entry, vim_item)
        vim_item.menu = nil
        return vim_item
    end,
})

lvim.builtin.cmp.cmdline.enable    = true
