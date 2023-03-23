return {
    {
        "williamboman/mason.nvim",
        event = "BufReadPre",
        opts = {
            ensure_installed = {
                "prettierd",
                "stylua",
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "ray-x/lsp_signature.nvim",
            "RRethy/vim-illuminate",
        },
        event = "BufReadPre",
        config = function()
            local lspconfig = require("lspconfig")
            local on_attach = require("r3x.handlers").on_attach
            local capabilities = require("r3x.handlers").capabilities

            local servers = {
                "prismals",
                "dockerls",
                "cssls",
                -- "tailwindcss",
            }

            for _, lsp in pairs(servers) do
                lspconfig[lsp].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end

            lspconfig["lua_ls"].setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        hint = { enable = true },
                    },
                },
            })

            lspconfig["tsserver"].setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    javascript = {
                        inlayHints = {
                            includeInlayEnumMemberValueHints = true,
                            includeInlayFunctionLikeReturnTypeHints = true,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
                            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                            includeInlayPropertyDeclarationTypeHints = true,
                            includeInlayVariableTypeHints = true,
                        },
                    },
                    typescript = {
                        inlayHints = {
                            includeInlayEnumMemberValueHints = true,
                            includeInlayFunctionLikeReturnTypeHints = true,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
                            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                            includeInlayPropertyDeclarationTypeHints = true,
                            includeInlayVariableTypeHints = true,
                        },
                    },
                },
            })

            lspconfig["rust_analyzer"].setup({
                on_attach = on_attach,
                capabilities = capabilities,
                cmd = { "rustup", "run", "stable", "rust-analyzer" }, --TODO: `rustup component add rust-analyzer` to install LSP
                settings = {
                    ["rust-analyzer"] = {
                        procMacro = { enable = true },
                        cargo = { allFeatures = true },
                        checkOnSave = true,
                        check = {
                            command = "clippy", --TODO: `rustup component add clippy` to install clippy
                            extraArgs = { "--no-deps" },
                        },
                    },
                },
            })

            lspconfig["gopls"].setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    gopls = {
                        hints = {
                            assignVariableTypes = true,
                            compositeLiteralFields = true,
                            compositeLiteralTypes = true,
                            constantValues = true,
                            functionTypeParameters = true,
                            parameterNames = true,
                            rangeVariableTypes = true,
                        },
                    },
                },
            })

            lspconfig["yamlls"].setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    yaml = {
                        keyOrdering = false,
                    },
                },
            })

            local cap = capabilities
            cap.offsetEncoding = "utf-8"

            lspconfig["clangd"].setup({
                on_attach = on_attach,
                capabilities = cap,
            })

            require("r3x.handlers").setup()
        end,
    },
    {
        "lvimuser/lsp-inlayhints.nvim",
        event = "LspAttach",
        opts = {
            inlay_hints = {
                parameter_hints = {
                    show = true,
                    prefix = "<- ",
                    separator = ", ",
                    remove_colon_start = false,
                    remove_colon_end = true,
                },
                type_hints = {
                    show = true,
                    prefix = " » ",
                    separator = ", ",
                    remove_colon_start = false,
                    remove_colon_end = false,
                },
                only_current_line = false,
                labels_separator = "  ", -- gap between type hints and parameter hints
                highlight = "Comment", -- see `:highlight` for more options
            },
        },
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        event = "LspAttach",
        config = function()
            local nls = require("null-ls")

            nls.setup({
                debug = false,
                sources = {
                    nls.builtins.formatting.stylua,
                    nls.builtins.formatting.prettierd.with({
                        disabled_filetypes = { "markdown", "yaml" },
                    }),
                },
            })
        end,
    },
}
