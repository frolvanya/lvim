local prompts = {
    -- Code related prompts
    Explain = "Please explain how the following code works.",
    Review = "Please review the following code and provide suggestions for improvement.",
    Tests = "Please explain how the selected code works, then generate unit tests for it.",
    Refactor = "Please refactor the following code to improve its clarity and readability.",
    FixCode = "Please fix the following code to make it work as intended.",
    FixError = "Please explain the error in the following text and provide a solution.",
    BetterNamings = "Please provide better names for the following variables and functions.",
    Documentation = "Please provide documentation for the following code.",
    SwaggerApiDocs = "Please provide documentation for the following API using Swagger.",
    SwaggerJsDocs = "Please write JSDoc for the following API using Swagger.",
    -- Text related prompts
    Summarize = "Please summarize the following text.",
    Spelling = "Please correct any grammar and spelling errors in the following text.",
    Wording = "Please improve the grammar and wording of the following text.",
    Concise = "Please rewrite the following text to make it more concise.",
}

lvim.plugins = {
    { "arcticicestudio/nord-vim" },

    {
        "folke/trouble.nvim",
        opts = {},
        cmd = "Trouble",
    },
    { "onsails/lspkind.nvim" },
    {
        "j-hui/fidget.nvim",
        config = function()
            require("fidget").setup()
        end,
    },
    {
        "kevinhwang91/nvim-bqf",
        event = { "BufRead", "BufNew" },
        config = function()
            require("bqf").setup({
                auto_enable = true,
                preview = {
                    win_height = 12,
                    win_vheight = 12,
                    winblend = 0,
                },
                func_map = {
                    vsplit = "",
                    ptogglemode = "z,",
                    stoggleup = "",
                },
                filter = {
                    fzf = {
                        action_for = { ["ctrl-s"] = "split" },
                        extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
                    },
                },
            })
        end,
    },
    {
        "kevinhwang91/nvim-ufo",
        dependencies = "kevinhwang91/promise-async",
        config = function()
            vim.o.foldlevel = 99
            vim.o.foldlevelstart = 99

            require('ufo').setup({
                provider_selector = function(bufnr, filetype, buftype)
                    return { 'treesitter', 'indent' }
                end
            })
        end
    },

    { "zbirenbaum/copilot.lua" },
    {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function()
            require("copilot_cmp").setup()
        end
    },
    {
        "hrsh7th/nvim-cmp",
        commit = "b356f2c"
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        dependencies = {
            { "zbirenbaum/copilot.lua" },
            { "nvim-lua/plenary.nvim" }
        },
        opts = {
            question_header = "## User ",
            answer_header = "## Copilot ",
            error_header = "## Error ",
            separator = " ",            -- Separator to use in chat
            prompts = prompts,
            auto_follow_cursor = false, -- Don't follow the cursor after getting response
            show_help = false,          -- Show help in virtual text, set to true if that's 1st time using Copilot Chat
            window = {
                border = "rounded",
                layout = "float",
                width = 0.91,
                height = 0.8,
                title = ""
            },
        },
        config = function(_, opts)
            local chat = require("CopilotChat")
            local select = require("CopilotChat.select")

            chat.setup(opts)

            vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
                chat.ask(args.args, { selection = select.visual })
            end, { nargs = "*", range = true })

            -- Restore CopilotChatBuffer
            vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
                chat.ask(args.args, { selection = select.buffer })
            end, { nargs = "*", range = true })

            -- Custom buffer for CopilotChat
            vim.api.nvim_create_autocmd("BufEnter", {
                pattern = "copilot-*",
                callback = function()
                    vim.opt_local.relativenumber = true
                    vim.opt_local.number = true

                    local ft = vim.bo.filetype
                    if ft == "copilot-chat" then
                        vim.bo.filetype = "chat"
                    end
                end,
            })
        end,
        event = "VeryLazy",
    },

    { "ggandor/leap.nvim" },
    {
        "nacro90/numb.nvim",
        event = "BufRead",
        config = function()
            require("numb").setup {
                show_numbers = true,
                show_cursorline = true,
            }
        end,
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    {
        'chomosuke/typst-preview.nvim',
        ft = 'typst',
        build = function() require 'typst-preview'.update() end,
    },
    { "sindrets/diffview.nvim" },
    { "tpope/vim-fugitive" },
    {
        "stevearc/oil.nvim",
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    { "abeldekat/harpoonline" },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
        end
    },

    {
        "mrcjkb/rustaceanvim",
        ft = { "rust" },
        config = function()
            vim.g.rustaceanvim = {
                tools = {
                    float_win_config = {
                        border = "rounded"
                    }
                },
                server = {
                    on_attach = require("lvim.lsp").common_on_attach,
                },
            }
        end,
    },
    -- {
    --     "simrat39/rust-tools.nvim",
    --     config = function()
    --         local rt = require("rust-tools")
    --         rt.setup({
    --             server = {
    --                 on_attach = function(_, bufnr)
    --                     vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
    --                 end,
    --             },
    --         })
    --     end
    -- },
    {
        "saecki/crates.nvim",
        version = "v0.4.0",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("crates").setup {
                null_ls = {
                    enabled = true,
                    name = "crates.nvim",
                },
                popup = {
                    border = "rounded",
                },
            }
        end,
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "debugloop/telescope-undo.nvim",
        },
        config = function()
            ---@diagnostic disable-next-line: redundant-parameter
            require("telescope").setup({
                pickers = {
                    find_files = {
                        hidden = true
                    }
                },
                extensions = {
                    undo = {
                        use_delta = false,
                    },
                },
            })
            require("telescope").load_extension("undo")
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            ---@diagnostic disable-next-line: redundant-parameter
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown()
                    }
                }
            }

            require("telescope").load_extension("ui-select")
        end
    },

    { "hrsh7th/cmp-nvim-lsp-signature-help" },
}
