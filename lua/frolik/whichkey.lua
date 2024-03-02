lvim.builtin.which_key.setup.layout.align = "center"
lvim.builtin.which_key.setup.window.border = "rounded"
lvim.builtin.which_key.setup.icons.group = "  "
lvim.builtin.which_key.setup.icons.separator = " "

lvim.builtin.which_key.mappings["/"] = nil
lvim.builtin.which_key.mappings[";"] = nil
lvim.builtin.which_key.mappings["h"] = nil
lvim.builtin.which_key.mappings["e"] = nil
lvim.builtin.which_key.mappings["T"] = nil
lvim.builtin.which_key.mappings["q"] = nil
lvim.builtin.which_key.mappings["w"] = nil
lvim.builtin.which_key.mappings["f"] = nil

lvim.builtin.which_key.mappings["sg"] = { "<cmd>Telescope git_files<cr>", "Find Git File" }
lvim.builtin.which_key.mappings["su"] = { "<cmd>Telescope undo<cr>", "Undotree" }
lvim.builtin.which_key.mappings["bw"] = { "<cmd>BufferKill<cr>", "Close current buffer" }

lvim.builtin.which_key.mappings["g"] = {
    name = "Git",
    a = { "<cmd>G add .<cr>", "Add" },
    c = { "<cmd>G commit --quiet<cr>", "Commit" },
    p = { "<cmd>G push<cr>", "Push" },
    s = { "<cmd>G status<cr>", "Status" },
    d = { "<cmd>G diff<cr>", "Diff" },
    l = { "<cmd>G log -p<cr>", "Log" },
    g = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle()<cr>", "Lazygit" },
    b = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
}

lvim.builtin.which_key.mappings["t"] = {
    name = "Trouble",
    t = { "<cmd>TroubleToggle<cr>", "Toggle" },
    r = { "<cmd>TroubleRefresh<cr>", "Refresh" },
    c = { "<cmd>TroubleClose<cr>", "Close" },
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
    e = { function() harpoon.ui:toggle_quick_menu(harpoon:list(), { border = "rounded", title_pos = "center" }) end, "Toggle quick menu" },
    -- e = { function() toggle_telescope(harpoon:list()) end, "Toggle quick menu" },
    h = { function() harpoon:list():select(1) end, "Navigate to 1" },
    j = { function() harpoon:list():select(2) end, "Navigate to 2" },
    k = { function() harpoon:list():select(3) end, "Navigate to 3" },
    l = { function() harpoon:list():select(4) end, "Navigate to 4" },
    p = { function() harpoon:list():prev() end, "Previous" },
    n = { function() harpoon:list():next() end, "Next" },
}
