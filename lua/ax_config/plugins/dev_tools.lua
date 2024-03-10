-- Plugins for actual development stuff like LSP, Completions and Debugging

return {
	-- Installs LSPs, DAPs, Formatters, etc
	{
		"williamboman/mason.nvim",
		name = "mason",
		config = function()
			require("mason").setup();
		end
	},

	-- Quick ready to go configurations for most LSPs
	{
		"neovim/nvim-lspconfig",
		name = "lspconfig",
		dependencies = { "cmp", "neodev", "mason_lspconfig" },
		config = function()
			local lspconfig = require("lspconfig");
			local capabilities = require("cmp_nvim_lsp").default_capabilities();

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = { Lua = { diagnostics = { globals = { "vim"  } } } }
			});

			lspconfig.jdtls.setup({
				capabilities = capabilities
			});
		end
	},

	-- Bridge between mason and lspconfig
	{
		"williamboman/mason-lspconfig.nvim",
		name = "mason_lspconfig",
		dependencies = "mason",
		config = function()
			require("mason-lspconfig").setup({
				automatic_installation = true
			});
		end
	},

	{
		"folke/trouble.nvim",
		name = "trouble",
		dependncies = { "lspconfig" },
		config = function()
			require("trouble").setup({ icons = false });
		end
	},



	-- Code Completion Engine
	{
		"hrsh7th/nvim-cmp",
		name = "cmp",
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp", name = "cmp_lsp" },
			{ "hrsh7th/cmp-buffer", name = "cmp_buffer" },
			{ "hrsh7th/cmp-path", name = "cmp_path" },
			{ "L3MON4D3/LuaSnip", name = "luasnip" },
			{ "saadparwaiz1/cmp_luasnip", name = "cmp_luasnip" },
		},
		config = function()
			local cmp = require("cmp");

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body);
					end
				},

					sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" }
				})
			});
		end
	},

	-- Neovim config specific completion snippets
	{
		"folke/neodev.nvim",
		name = "neodev",
		config = function()
			require("neodev").setup({
				-- TODO: Add the dapui thing
			});
		end
	},




	-- Debug Adapter Protocol
	{
		"mfussenegger/nvim-dap",
		name = "dap",
	},

	-- The debugger UI
	{
		"rcarriga/nvim-dap-ui",
		name = "dap_ui",
		dependncies = "dap",
		config = function()
			local dap = require("dap");
			local dapui = require("dapui");

			dapui.setup();

			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close();
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close();
			end
		end
	},

	-- Virtual text to show debugging info without opening UI
	{
		"theHamsta/nvim-dap-virtual-text",
		name = "dap_virtual_text",
		config = function()
			require("nvim-dap-virtual-text").setup();
		end
	}
}
