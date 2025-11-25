return {

	{
		"folke/tokyonight.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme tokyonight]])
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter", 
		branch = 'master', 
		lazy = false, 
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "c", "lua", "vim", "vimdoc", "julia", "markdown" },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		},

		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},

	{
		"mason-org/mason.nvim",
		opts = {}
	},

	{
		'stevearc/conform.nvim',
		opts = {
			formatters = {
				runic = {
					command = "runic",
				},
			},
			formatters_by_ft = {
				julia = {"runic"},
			},
			default_format_opts = {
				-- Increase the timeout in case Runic needs to precompile
				-- (e.g. after upgrading Julia and/or Runic).
				timeout_ms = 10000,
			},
		}
	},

	{
		"neovim/nvim-lspconfig",
		config = function()

			vim.lsp.config("jetls", {
				cmd = {
					"jetls",
					"--threads=auto",
					"--",
				},
				filetypes = {"julia"},
			})
			vim.lsp.enable("jetls")
			-- require("lspconfig").lua_ls.setup({}) 
		end
	},

	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },

		keys = {
			{ "<leader>tf", "<cmd>Telescope find_files<cr>", desc = "[S]earch [F]iles" },
			{ "<leader>tg", "<cmd>Telescope live_grep<cr>", desc = "[S]earch [G]rep (Text)" },
			{ "<leader>td", "<cmd>Telescope diagnostics<cr>", desc = "[S]earch [D]iagnostics" },
		},
	}

}
