lvim.builtin.which_key.mappings["r"] = {
    name = "Rust",
    r = { "<cmd>RustLsp runnables<cr>", "Runnables" },
    t = { "<cmd>RustLsp testables<cr>", "Testables" },
    m = { "<cmd>RustLsp expandMacro<cr>", "Expand Macro" },
    a = { "<cmd>RustLsp codeAction<cr>", "Code Actions" },
    h = { "<cmd>RustLsp hover actions<cr>", "Hover" },
    e = { "<cmd>RustLsp explainError<cr>", "Explain Error" },
    D = { "<cmd>RustLsp renderDiagnostic<cr>", "Render Diagnostic" },
    c = { "<cmd>RustLsp openCargo<cr>", "Open Cargo.toml" },
    d = { "<cmd>RustLsp openDocs<cr>", "Open Docs.rs" },
}

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
