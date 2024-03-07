return function()
    -- Set up nvim-cmp.
    local cmp = require("cmp");

    cmp.setup({
        -- Disable completion in comments
        enabled = function()
            local context = require("cmp.config.context");
            if vim.api.nvim_get_mode().mode == "c" then
                return true;
            else
                return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment");
            end
        end,

        -- Snippet Engine
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body);
            end,
        },

        -- Set Keymappings
        mapping = cmp.mapping.preset.insert({
            ["<C-n>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select });
                else
                    fallback();
                end
            end, {"i","s","c",}),
            ["<C-p>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                        cmp.select_prev_item();
                else
                    fallback();
                end
            end, {"i","s","c",}),
            ["<C-u>"] = cmp.mapping.scroll_docs(-3),
            ["<C-d>"] = cmp.mapping.scroll_docs(3),
            ["<C-b>"] = cmp.mapping.scroll_docs(-6),
            ["<C-f>"] = cmp.mapping.scroll_docs(6),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),

        -- Completion Sources
        sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" },
        },
        {
            { name = "buffer" },
        })
    });

    -- Neodev Setup - Nvim flavoured lua snippets
    require("neodev").setup({
        library = {
            plugins = { "nvim-dap-ui" },
            types = true
        },
    })

    -- Set up Mason.
    require("mason").setup();
    require("mason-lspconfig").setup({ automatic_installation = true });

    -- Setup LSPs
    local lspconfig = require("lspconfig");
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
            Lua = {
                diagnostics = { globals = { "vim" } }
            }
        }
    });
    lspconfig.jdtls.setup({ capabilities = capabilities });

    -- DAP UI Setup
    local dap = require("dap");
    local dapui = require("dapui");
    require("nvim-dap-virtual-text").setup();
    dapui.setup();
    dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
    end

    -- Initiate per language DAP setups
    require("ax-nvim-config.plugins_configs.dap_setups");
end
