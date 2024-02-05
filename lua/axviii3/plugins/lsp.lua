-- Servers to keep installed
local ensure_installed_lsps = {
    "lua_ls",
    "eslint",
    "tsserver"
}

-- Other stuff to keep installed (like linters, formatters, etc)
local ensure_installed_others = {
}


-- This one is provided by lsp-zero github page and edited as per my needs
return {
    -- Linter and formatter
    -- NOTE: Null Ls is archived
    {
        "jose-elias-alvarez/null-ls.nvim",
        event = "VeryLazy",
        opts = function()
            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
            local null_ls = require("null-ls")

            return {
                sources = {
                    null_ls.builtins.diagnostics.eslint,
                },
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({
                            group = augroup,
                            buffer = bufnr
                        })

                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = bufnr })
                            end
                        })
                    end
                end
            }
        end
    },

    -- Stiches everything together
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },

    -- Install and manage lsp servers
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
        opts = {
            ensure_installed = ensure_installed_others
        }
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            {'L3MON4D3/LuaSnip'},
        },
        config = function()
            -- Here is where you configure the autocompletion settings.
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_cmp()

            -- And you can configure cmp even more, if you want to.
            local cmp = require('cmp')
            local cmp_action = lsp_zero.cmp_action()

            cmp.setup({
                formatting = lsp_zero.cmp_format(),
                mapping = cmp.mapping.preset.insert({

                    -- Select next item for more info on pressing tab
                    ["<tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            local entry = cmp.get_selected_entry()
                            if not entry then
                                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                            else
                                cmp.select_next_item()
                            end
                        else
                            fallback()
                        end
                    end, {"i","s","c",}),

                    -- Select completion on pressing enter
                    ["<CR>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            local entry = cmp.get_selected_entry()
                            if not entry then
                                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                                cmp.confirm()
                            else
                                cmp.confirm()
                            end
                        else
                            fallback()
                        end
                    end, {"i","s","c",}),

                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                })
            })
        end
    },

    {
        "hrsh7th/cmp-cmdline",
        dependencies = 'hrsh7th/nvim-cmp',
        config = function()
            local cmp = require("cmp")

            cmp.setup.cmdline("/", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" }
                }
            })

            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources(
                { { name = "path" } },
                {
                    {
                        name = "cmdline",
                        options = {
                            ignore_cmds = { "Man", "!" }
                        }
                    }
                })
            })
        end
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = {'LspInfo', 'LspInstall', 'LspStart'},
        event = {'BufReadPre', 'BufNewFile'},
        dependencies = {
            {'hrsh7th/cmp-nvim-lsp'},
            {'williamboman/mason-lspconfig.nvim'},
        },
        config = function()
            -- This is where all the LSP shenanigans will live
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            local lsp_config = require('lspconfig')
            vim.keymap.set({ 'n', 'v' }, "<leader>ca", vim.lsp.buf.code_action, {})

            --- if you want to know more about lsp-zero and mason.nvim
            --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({ buffer = bufnr })
            end)

            lsp_zero.set_sign_icons({
                error = '✕',
                warn = '!',
                hint = '?',
                info = '⚑'
            })

            require('mason-lspconfig').setup({
                ensure_installed = ensure_installed_lsps,
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        lsp_config.lua_ls.setup(lua_opts)
                    end,
                    eslint = function()
                        lsp_config.eslint.setup({})
                    end,
                    tsserver = function()
                        lsp_config.tsserver.setup({})
                    end,
                }
            })
        end
    }
}
