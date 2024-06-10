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
lvim.builtin.which_key.mappings["c"] = nil

lvim.builtin.which_key.mappings["sg"] = { "<cmd>Telescope git_files<cr>", "Find Git File" }
lvim.builtin.which_key.mappings["su"] = { "<cmd>Telescope undo<cr>", "Undotree" }
lvim.builtin.which_key.mappings["bw"] = { "<cmd>BufferKill<cr>", "Close current buffer" }
lvim.builtin.which_key.mappings["lh"] = {
    "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>",
    "Toggle Inlay Hint"
}


lvim.builtin.which_key.mappings["g"] = {
    name = "Git",
    a = { "<cmd>G add .<cr>", "Add" },
    c = { "<cmd>G commit --quiet<cr>", "Commit" },
    p = { "<cmd>G push<cr>", "Push" },
    P = { "<cmd>G pull<cr>", "Pull" },
    s = { "<cmd>G status<cr>", "Status" },
    d = { "<cmd>G diff<cr>", "Diff" },
    D = { "<cmd>Gvdiffsplit!<cr>", "Diff merge conflict" },
    l = { "<cmd>G log -p<cr>", "Log" },
    g = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle()<cr>", "Lazygit" },
    b = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
}

lvim.builtin.which_key.mappings["t"] = {
    name = "Trouble",
    t = { "<cmd>Trouble diagnostics toggle<cr>", "Toggle" },
    s = { "<cmd>Trouble symbols toggle focus=false<cr>", "Symbols" },
}

local harpoon = require("harpoon")
harpoon:setup()

lvim.builtin.which_key.mappings["h"] = {
    name = "Harpoon",
    a = { function() harpoon:list():add() end, "Add" },
    e = { function() harpoon.ui:toggle_quick_menu(harpoon:list(), { border = "rounded", title_pos = "center" }) end, "Toggle quick menu" },
    -- e = { function() toggle_telescope(harpoon:list()) end, "Toggle quick menu" },
    h = { function() harpoon:list():select(1) end, "Navigate to 1" },
    j = { function() harpoon:list():select(2) end, "Navigate to 2" },
    k = { function() harpoon:list():select(3) end, "Navigate to 3" },
    l = { function() harpoon:list():select(4) end, "Navigate to 4" },
    p = { function() harpoon:list():prev() end, "Previous" },
    n = { function() harpoon:list():next() end, "Next" },
}

lvim.builtin.which_key.mappings["a"] = {
    name = "CopilotChat",
    a = {
        "<cmd>lua require('CopilotChat.integrations.telescope').pick(require('CopilotChat.actions').help_actions())<cr>",
        "Help actions"
    },
    p = {
        "<cmd>lua require('CopilotChat.integrations.telescope').pick(require('CopilotChat.actions').prompt_actions())<cr>",
        "Prompt actions"
    },
    m = { "<cmd>CopilotChatCommit<cr>", "Generate commit message for all changes" },
    M = { "<cmd>CopilotChatCommitStaged<cr>", "Generate commit message for staged changes" },
    q = {
        function()
            local input = vim.fn.input("Quick Chat: ")
            if input ~= "" then
                vim.cmd("CopilotChatBuffer " .. input)
            end
        end,
        "Quick chat"
    },
    f = { "<cmd>CopilotChatFixDiagnostic<cr>", "Fix Diagnostic" },
    l = { "<cmd>CopilotChatReset<cr>", "Clear buffer and chat history" },
    t = { "<cmd>CopilotChatToggle<cr>", "Toggle" },
}

lvim.builtin.which_key.vmappings["a"] = {
    name = "CopilotChat",
    p = {
        "<cmd>lua require('CopilotChat.integrations.telescope').pick(require('CopilotChat.actions').prompt_actions())<cr>",
        "Prompt actions"
    },
    v = {
        "<cmd>CopilotChatVisual<cr>",
        "Open chat using selected code",
    },
    e = { "<cmd>CopilotChatExplain<cr>", "Explain code" },
    T = { "<cmd>CopilotChatTests<cr>", "Generate tests" },
    r = { "<cmd>CopilotChatReview<cr>", "Review code" },
    R = { "<cmd>CopilotChatRefactor<cr>", "Refactor code" },
    o = { "<cmd>CopilotChatOptimize<cr>", "Optimize code" },
    n = { "<cmd>CopilotChatBetterNamings<cr>", "Better Naming" },
    d = { "<cmd>CopilotChatDocs<cr>", "Generate Docs" },
}
