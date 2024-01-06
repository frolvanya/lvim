lvim.plugins = {
    { "arcticicestudio/nord-vim" },

    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
    },
    { "onsails/lspkind.nvim" },
    {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function()
            require("lsp_signature").on_attach({ hint_enable = false })
        end,
    },
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

    { "zbirenbaum/copilot.lua" },
    {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function()
            require("copilot_cmp").setup()
        end
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
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
        end
    },

    { "simrat39/rust-tools.nvim" },
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

    {
        "epwalsh/obsidian.nvim",
        version = "*",
        lazy = true,
        ft = "markdown",
        dependencies = {
            "nvim-lua/plenary.nvim",

        },
        opts = {
            workspaces = {
                {
                    name = "personal",
                    path = "~/personal",
                },
            }
        },
    }
}
