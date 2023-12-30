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
    c = { "<cmd>G commit<cr>", "Commit" },
    p = { "<cmd>G push<cr>", "Push" },
    s = { "<cmd>G status<cr>", "Status" },
    d = { "<cmd>G diff<cr>", "Diff" },
    g = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle()<cr>", "Lazygit" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
}

local harpoon = require("harpoon")
harpoon:setup()

-- local conf = require("telescope.config").values
-- local function toggle_telescope(harpoon_files)
--     local file_paths = {}
--     for _, item in ipairs(harpoon_files.items) do
--         table.insert(file_paths, item.value)
--     end

--     require("telescope.pickers").new({}, {
--         prompt_title = "Harpoon",
--         finder = require("telescope.finders").new_table({
--             results = file_paths,
--         }),
--         previewer = conf.file_previewer({}),
--         sorter = conf.generic_sorter({}),
--     }):find()
-- end

lvim.builtin.which_key.mappings["h"] = {
    name = "Harpoon",
    a = { function() harpoon:list():append() end, "Add" },
    e = { function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, "Toggle quick menu" },
    -- e = { function() toggle_telescope(harpoon:list()) end, "Toggle quick menu" },
    h = { function() harpoon:list():select(1) end, "Navigate to 1" },
    j = { function() harpoon:list():select(2) end, "Navigate to 2" },
    k = { function() harpoon:list():select(3) end, "Navigate to 3" },
    l = { function() harpoon:list():select(4) end, "Navigate to 4" },
    p = { function() harpoon:list():prev() end, "Previous" },
    n = { function() harpoon:list():next() end, "Next" },
}
