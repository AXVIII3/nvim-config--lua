-- Plugins for actual development stuff like LSP, Completions and Debugging

return {
	-- Installs LSPs, DAPs, Formatters, etc
	{
		"williamboman/mason.nvim",
		name = "mason",
		cmd = "Mason",
		config = function()
			require("mason").setup();
		end
	},


	-- Quick ready to go configurations for most LSPs
	{
		"neovim/nvim-lspconfig",
		name = "lspconfig",
		dependencies = {
			"cmp_lsp",
			"mason_lspconfig",
			{ "folke/neodev.nvim", name = "neodev" }
		},
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		config = function()
			local lspconfig = require("lspconfig");
			local capabilities = require("cmp_nvim_lsp").default_capabilities();

			require("neodev").setup();
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = { globals = { "vim"  } },
						callSnippet = "Replace"
					}
				}
			});
		end
	},


	-- Bridge between mason and lspconfig
	{
		"williamboman/mason-lspconfig.nvim",
		name = "mason_lspconfig",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		config = function()
			require("mason-lspconfig").setup({
				automatic_installation = true
			});
		end
	},


	-- Configuration for JAVA language server (jdtls)
	{
		"mfussenegger/nvim-jdtls",
		name = "jdtls",
		config = function()
			if (not ax.should_setup_java) then
				return
			end

			-- Setup taken from https://github.com/mfussenegger/nvim-jdtls

			-- The java-debug-adapter stuff
			-- https://github.com/microsoft/java-debug
			local bundles = {
				vim.fn.glob(
					-- Installed by mason
					vim.fn.stdpath("data") ..
					"/mason/packages/java-debug-adapter/extension/server/" ..
					"com.microsoft.java.debug.plugin-*.jar",
					true
				)
			}

			-- The java-test stuff
			-- https://github.com/microsoft/vscode-java-test
			vim.list_extend(
				bundles,
				vim.split(
					vim.fn.glob(
						-- Installed by mason
						vim.fn.stdpath("data") ..
						"/mason/packages/java-test/extension/server/*.jar",
						true
					), "\n"
				)
			);

			vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "BufNewFile" }, {
				pattern = "*.java",
				callback = function()
					require("jdtls").start_or_attach({
						cmd = { vim.fn.stdpath("data") .. "\\mason\\bin\\jdtls"..
								(vim.fn.has("windows") == 1 and ".cmd" or "") },
						root_dir = vim.fs.dirname(
										vim.fs.find(
											{'gradlew', '.git', 'mvnw'},
											{ upward = true }
										)[1]
									),
						init_options = {
							bundles = bundles
						}
					});
				end
			});
		end
	},


	{
		"folke/trouble.nvim",
		name = "trouble",
		dependencies = "lspconfig",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
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
		event = "InsertEnter",
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
				});
			});
		end
	},






	-- Debug Adapter Protocol
	{
		"mfussenegger/nvim-dap",
		name = "dap",
		dependencies = {
			-- List of debuggers
		},
		-- config = function()
		-- 	-- DAP Setups can be found at
		-- 	-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
		--
		-- 	local dap = require("dap");
		-- end
	},


	-- The debugger UI
	{
		"rcarriga/nvim-dap-ui",
		name = "dap_ui",
		dependencies = { "dap", { "nvim-neotest/nvim-nio", name = "nio" } },
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
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
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		config = function()
			---@diagnostic disable-next-line: missing-parameter
			require("nvim-dap-virtual-text").setup();
		end
	}
}
