lvim.builtin.which_key.setup.layout.align = "center"
lvim.builtin.which_key.setup.window.border = "rounded"
lvim.builtin.which_key.setup.icons.group = "  "
lvim.builtin.which_key.setup.icons.separator = " "

lvim.builtin.which_key.mappings["/"] = nil
lvim.builtin.which_key.mappings[";"] = nil
lvim.builtin.which_key.mappings["h"] = nil
lvim.builtin.which_key.mappings["e"] = nil
lvim.builtin.which_key.mappings["T"] = nil

lvim.builtin.which_key.mappings["f"] = { "<cmd>Telescope find_files<cr>", "Find File" }
lvim.builtin.which_key.mappings["sg"] = { "<cmd>Telescope git_files<cr>", "Find Git File" }
lvim.builtin.which_key.mappings["su"] = { "<cmd>Telescope undo<cr>", "Undotree" }
lvim.builtin.which_key.mappings["bw"] = { "<cmd>BufferKill<cr>", "Close current buffer" }

local crates = require("crates")
lvim.builtin.which_key.mappings["c"] = {
    name = "Crates",
    t = { crates.toggle, "Toogle" },
    r = { crates.reload, "Reload" },
    v = { crates.show_versions_popup, "Show Versions" },
    f = { crates.show_features_popup, "Show Features" },
    d = { crates.show_dependencies_popup, "Show Dependencies" },
    u = { crates.upgrade_crate, "Upgrade Crate" },
    a = { crates.upgrade_all_crates, "Update All Crates" },
    e = { crates.expand_plain_crate_to_inline_table, "Expand Crate" },
    E = { crates.extract_crate_into_table, "Extract Crate" },
    H = { crates.open_homepage, "Open Homepage" },
    R = { crates.open_repository, "Open Repository" },
    D = { crates.open_documentation, "Open Documentation" },
    C = { crates.open_crates_io, "Open Crates.io" },
}

lvim.builtin.which_key.mappings["m"] = {
    name = "Markdown",
    m = { "<cmd>MarkdownPreview<cr>", "MarkdownPreview" },
    s = { "<cmd>MarkdownPreviewStop<cr>", "MarkdownPreviewStop" },
    t = { "<cmd>MarkdownPreviewToggle<cr>", "MarkdownPreviewToggle" },
}

lvim.builtin.which_key.mappings["g"] = {
    name = "Git",
    a = { "<cmd>G add .<cr>", "Add" },
    m = { "<cmd>G commit<cr>", "Commit" },
    p = { "<cmd>G push<cr>", "Push" },
    s = { "<cmd>G status<cr>", "Status" },
    d = { "<cmd>G diff<cr>", "Diff" },
    g = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle()<cr>", "Lazygit" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
}
