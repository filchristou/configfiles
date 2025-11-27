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
	    incremental_selection = {
		enable = true,
		keymaps = {
		    init_selection = "<CR>", -- Start selecting with Enter
		    node_incremental = "<CR>", -- Expand selection to parent with Enter
		    scope_incremental = false, -- (Optional) Select scope
		    node_decremental = "<BS>", -- Shrink selection with Backspace
		},
	    },
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
	dependencies = { "saghen/blink.cmp" },

	config = function()
	    local capabilities = require('blink.cmp').get_lsp_capabilities()

	    vim.lsp.config("jetls", {
		cmd = {
		    "jetls",
		    "--threads=auto",
		    "--",
		},
		filetypes = {"julia"},
		capabilities = capabilities
	    })
	    vim.lsp.enable("jetls")
	    vim.lsp.enable("copilot")
	end
    },

    {
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim'},
	config = function()
	    local actions = require('telescope.actions')
	    require('telescope').setup({
		defaults = {
		    file_sorter = require('telescope.sorters').get_fuzzy_sorter,
		    generic_sorter = require('telescope.sorters').get_fuzzy_sorter,
		    mappings = {
			i = {
			    ["<C-j>"] = actions.cycle_history_next,
			    ["<C-k>"] = actions.cycle_history_prev,
			}
		    }
		},
		pickers = {
		    live_grep = {
			mappings = {
			    i = { ["<c-f>"] = actions.to_fuzzy_refine },
			},
		    },
		},
	    })
	end,

	keys = {
	    { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "[S]earch [F]iles" },
	    { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "[S]earch [G]rep (Text)" },
	    { "<leader>sl", "<cmd>Telescope grep_string search=<cr>", desc = "[S]earch [G]rep (Text)" },
	    { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "[S]earch [D]iagnostics" },
	},
    },

    {
	'saghen/blink.cmp',
	version = "1.*",
	build = 'cargo +nightly build --release',
	opts = {
	    keymap = { preset = 'default' },
	    sources = {
		default = { 'lsp', 'buffer', 'path' },
	    },
	},
    },

    {
	"jake-stewart/multicursor.nvim",
	branch = "1.0",
	config = function()
	    local mc = require("multicursor-nvim")
	    mc.setup()

	    local set = vim.keymap.set

	    -- Add or skip cursor above/below the main cursor.
	    set({"n", "x"}, "<up>", function() mc.lineAddCursor(-1) end)
	    set({"n", "x"}, "<down>", function() mc.lineAddCursor(1) end)
	    set({"n", "x"}, "<leader><up>", function() mc.lineSkipCursor(-1) end)
	    set({"n", "x"}, "<leader><down>", function() mc.lineSkipCursor(1) end)

	    -- Add or skip adding a new cursor by matching word/selection
	    set({"n", "x"}, "<leader>n", function() mc.matchAddCursor(1) end)
	    set({"n", "x"}, "<leader>s", function() mc.matchSkipCursor(1) end)
	    set({"n", "x"}, "<leader>N", function() mc.matchAddCursor(-1) end)
	    set({"n", "x"}, "<leader>S", function() mc.matchSkipCursor(-1) end)

	    -- Add and remove cursors with control + left click.
	    set("n", "<c-leftmouse>", mc.handleMouse)
	    set("n", "<c-leftdrag>", mc.handleMouseDrag)
	    set("n", "<c-leftrelease>", mc.handleMouseRelease)

	    -- Disable and enable cursors.
	    set({"n", "x"}, "<c-q>", mc.toggleCursor)

	    -- Mappings defined in a keymap layer only apply when there are
	    -- multiple cursors. This lets you have overlapping mappings.
	    mc.addKeymapLayer(function(layerSet)

		-- Select a different cursor as the main one.
		layerSet({"n", "x"}, "<left>", mc.prevCursor)
		layerSet({"n", "x"}, "<right>", mc.nextCursor)

		-- Delete the main cursor.
		layerSet({"n", "x"}, "<leader>x", mc.deleteCursor)

		-- Enable and clear cursors using escape.
		layerSet("n", "<esc>", function()
		    if not mc.cursorsEnabled() then
			mc.enableCursors()
		    else
			mc.clearCursors()
		    end
		end)
	    end)

	    -- Customize how cursors look.
	    local hl = vim.api.nvim_set_hl
	    hl(0, "MultiCursorCursor", { reverse = true })
	    hl(0, "MultiCursorVisual", { link = "Visual" })
	    hl(0, "MultiCursorSign", { link = "SignColumn"})
	    hl(0, "MultiCursorMatchPreview", { link = "Search" })
	    hl(0, "MultiCursorDisabledCursor", { reverse = true })
	    hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
	    hl(0, "MultiCursorDisabledSign", { link = "SignColumn"})
	end
    },

    {
	"folke/sidekick.nvim",
	opts = {
	    -- add any options here
	    cli = {
		mux = {
		    backend = "zellij",
		    enabled = true,
		},
		enabled = true,
		-- You can set your default AI tool here (e.g., 'claude', 'gemini', 'openai')
		default = {
		    tool = "gemini", -- Change this to your preferred tool
		},
	    },
	},
	keys = {
	    {
		"<tab>",
		function()
		    -- if there is a next edit, jump to it, otherwise apply it if any
		    if not require("sidekick").nes_jump_or_apply() then
			return "<Tab>" -- fallback to normal tab
		    end
		end,
		expr = true,
		desc = "Goto/Apply Next Edit Suggestion",
	    },
	    {
		"<leader>lt",
		function() require("sidekick.cli").toggle() end,
		desc = "Sidekick Toggle CLI",
	    },
	    {
		"<leader>lc",
		function() require("sidekick.cli").select() end,
		-- Or to select only installed tools:
		-- require("sidekick.cli").select({ filter = { installed = true } })
		desc = "Select CLI",
	    },
	    {
		"<leader>ld",
		function() require("sidekick.cli").close() end,
		desc = "Detach a CLI Session",
	    },
	    {
		"<leader>ls",
		function() require("sidekick.cli").send({ msg = "{this}" }) end,
		mode = { "x", "n" },
		desc = "[s]end this",
	    },
	    {
		"<leader>lf",
		function() require("sidekick.cli").send({ msg = "{file}" }) end,
		desc = "Send File",
	    },
	    {
		"<leader>lv",
		function() require("sidekick.cli").send({ msg = "{selection}" }) end,
		mode = { "x" },
		desc = "Send Visual Selection",
	    },
	    {
		"<leader>lp",
		function() require("sidekick.cli").prompt() end,
		mode = { "n", "x" },
		desc = "Sidekick Select Prompt",
	    },
	},
    }

}
