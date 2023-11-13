return require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use{
		'junegunn/vim-easy-align',
		opt = false
	}

	use{
		'JuliaEditorSupport/julia-vim',
	}

	use({ 
		"hrsh7th/nvim-cmp",
		requires = { { "hrsh7th/cmp-nvim-lsp" } },
		config = function()
			local cmp = require('cmp')
			cmp.setup({

				completion = {
					completeopt = "menu,menuone,noselect",
				},

				-- You must set mapping.
				mapping = {
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.close(),
				},

				-- You should specify your *installed* sources.
				sources = {
					{ name = "nvim_lsp" },
					{ name = "neorg" }
				},
			})

		end,
	})

	use({
		"neovim/nvim-lspconfig",
		config = function()
			local function create_capabilities()
				local capabilities = vim.lsp.protocol.make_client_capabilities()
				capabilities.textDocument.completion.completionItem.snippetSupport = true
				capabilities.textDocument.completion.completionItem.preselectSupport = true
				capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
				capabilities.textDocument.completion.completionItem.deprecatedSupport = true
				capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
				capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
				capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
				capabilities.textDocument.completion.completionItem.resolveSupport = {
					properties = { "documentation", "detail", "additionalTextEdits" },
				}
				capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown" }
				capabilities.textDocument.codeAction = {
					dynamicRegistration = true,
					codeActionLiteralSupport = {
						codeActionKind = {
							valueSet = (function()
								local res = vim.tbl_values(vim.lsp.protocol.CodeActionKind)
								table.sort(res)
								return res
							end)(),
						},
					},
				}
				return capabilities
			end

			-- disable virtual text (recommended for julia)
			vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
				virtual_text = false,
				underline = false,
				signs = true,
				update_in_insert = false,
			})


			local on_attach = function(client, bufnr)
				local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
				local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

				-- Enable completion triggered by <c-x><c-o>
				buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

				buf_set_keymap('n', '<leader>ld', ':lua vim.lsp.buf.definition()<CR>', {noremap = true})
				buf_set_keymap('n', '<leader>lh', ':lua vim.lsp.buf.hover()<CR>', {noremap = true})
				buf_set_keymap('n', '<leader>lr', ':lua vim.lsp.buf.references()<CR>', {noremap = true})
				buf_set_keymap('n', '<leader>ls', ':lua vim.lsp.buf.document_symbol()<CR>', {noremap = true})
				buf_set_keymap('n', '<leader>lg', ':lua vim.diagnostic.open_float()<CR>', {noremap = true})
			end

			local lspconfig = require("lspconfig")

			local function lsp_setup(name, config)
				lspconfig[name].setup(config)
			end

			lsp_setup("julials", {
				on_attach = on_attach,
				capabilities = create_capabilities(),
			})
			lsp_setup("texlab", {
				on_attach = on_attach,
				capabilities = create_capabilities(),
			})


		end,
	})

    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = function() 
            require'lualine'.setup{
                options = {theme = 'everforest'}
                --options = {theme = 'tokyonight'}
        }
        end
    }


    use {
        'kyazdani42/nvim-web-devicons',
        config = function() 
            require'nvim-web-devicons'.setup {
                -- your personnal icons can go here (to override)
                -- DevIcon will be appended to `name`
                override = {
                    zsh = {
                        icon = "",
                        color = "#428850",
                        name = "Zsh"
                    }
                };
                -- globally enable default icons (default to false)
                -- will get overriden by `get_icons` option
                default = true;
            } 
        end
    }

    use {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require"bufferline".setup{
                    options = {
                            -- numbers = "none" | "ordinal" | "buffer_id" | "both"
                            numbers = "both",
                            -- separator_style = "slant" | "thick" | "thin" | { 'any', 'any' }
                            separator_style = "thin"
                    }
                }
                vim.api.nvim_set_keymap('n', '<C-n>', ':BufferLineCycleNext<CR>', {noremap = true})
                vim.api.nvim_set_keymap('n', '<C-a><C-n>', ':BufferLineMoveNext<CR>', {noremap = true})
                vim.api.nvim_set_keymap('n', '<C-p>', ':BufferLineCyclePrev<CR>', {noremap = true})
                vim.api.nvim_set_keymap('n', '<C-a><C-p>', ':BufferLineMovePrev<CR>', {noremap = true})
                vim.api.nvim_set_keymap('n', '<C-m>', ':BufferLinePick<CR>', {noremap = true})

                vim.api.nvim_set_keymap('n', '<leader>1', ':BufferLineGoToBuffer 1<CR>', {noremap = true})
                vim.api.nvim_set_keymap('n', '<leader>2', ':BufferLineGoToBuffer 2<CR>', {noremap = true})
                vim.api.nvim_set_keymap('n', '<leader>3', ':BufferLineGoToBuffer 3<CR>', {noremap = true})
                vim.api.nvim_set_keymap('n', '<leader>4', ':BufferLineGoToBuffer 4<CR>', {noremap = true})
                vim.api.nvim_set_keymap('n', '<leader>5', ':BufferLineGoToBuffer 5<CR>', {noremap = true})
                vim.api.nvim_set_keymap('n', '<leader>6', ':BufferLineGoToBuffer 6<CR>', {noremap = true})
                vim.api.nvim_set_keymap('n', '<leader>7', ':BufferLineGoToBuffer 7<CR>', {noremap = true})
                vim.api.nvim_set_keymap('n', '<leader>8', ':BufferLineGoToBuffer 8<CR>', {noremap = true})
                vim.api.nvim_set_keymap('n', '<leader>9', ':BufferLineGoToBuffer 9<CR>', {noremap = true})

            end
    }

--	use {
--		'glepnir/galaxyline.nvim',
--		-- your statusline
--		config = function() require'mystatusline' end,
--		-- some optional icons
--		requires = {'kyazdani42/nvim-web-devicons', opt = false}
--	}

    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require'nvim-tree'.setup()
            vim.api.nvim_set_keymap('n', 't', ':NvimTreeToggle<CR>', {noremap = true})
        end
    }

    use 'dstein64/nvim-scrollview'

    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} },
        config = function()
            vim.api.nvim_set_keymap('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", {noremap = true})
            vim.api.nvim_set_keymap('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>", {noremap = true})
        end
    }

     use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

            parser_configs.norg = {
                install_info = {
                    url = "https://github.com/nvim-neorg/tree-sitter-norg",
                    files = { "src/parser.c", "src/scanner.cc" },
                    branch = "main"
                },
            }


            require'nvim-treesitter.configs'.setup {
                highlight = {
                    enable = true,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "gnn",
                        node_incremental = "grn",
                        scope_incremental = "grc",
                        node_decremental = "grm",
                    }
                },
                indent = {
                    enable = true
                }
            }
        end
    }

    use { 
        "nvim-neorg/neorg",
        config = function()
            require('neorg').setup {
                -- Tell Neorg what modules to load
                load = {
                    ["core.defaults"] = {}, -- Load all the default modules
                    ["core.norg.concealer"] = {}, -- Allows for use of icons
                    ["core.norg.dirman"] = { -- Manage your directories with Neorg
                        config = {
                            workspaces = {
                                my_workspace = "~/neorg"
                            }
                        }
                    },
                    ["core.norg.completion"] = {
                        config = {
                            engine = "nvim-cmp"
                        }
                    },
--                    ["core.keybinds"] = {
--                        config = {
--                            default_keybinds = true,
--                        }
--                    }

                },
                hook = function()
                    -- This sets the leader for all Neorg keybinds. It is separate from the regular <Leader>,
                    -- And allows you to shove every Neorg keybind under one "umbrella".
                    local neorg_leader = "<Leader>" -- You may also want to set this to <Leader>o for "organization"

                    -- Require the user callbacks module, which allows us to tap into the core of Neorg
                    local neorg_callbacks = require('neorg.callbacks')

                    -- Listen for the enable_keybinds event, which signals a "ready" state meaning we can bind keys.
                    -- This hook will be called several times, e.g. whenever the Neorg Mode changes or an event that
                    -- needs to reevaluate all the bound keys is invoked
                    neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)

                        -- Map all the below keybinds only when the "norg" mode is active
                        keybinds.map_event_to_mode("norg", {
                            n = { -- Bind keys in normal mode
                                -- Keys for managing TODO items and setting their states
                                { "gtd", "core.norg.qol.todo_items.todo.task_done" },
                                { "gtu", "core.norg.qol.todo_items.todo.task_undone" },
                                { "gtp", "core.norg.qol.todo_items.todo.task_pending" },
                                { "<C-Space>", "core.norg.qol.todo_items.todo.task_cycle" },
                                { "<CR>", "core.norg.esupports.goto_link" }

                            },
                        }, { silent = true, noremap = true })
                    end)
                end
            }
            end,
            requires = "nvim-lua/plenary.nvim",
    }

    use 'glepnir/dashboard-nvim'

 --               {
 --                ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
 --                ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
 --                ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
 --                ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
 --                ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
 --                ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
 --                '        hyperextensible Vim-based text editor          ',
 --                '                  (with Lua build-in)                  '
 --               }

 --           vim.g.dashboard_custom_footer = {
 --               'τάχιστον νοῦς· διὰ παντὸς γὰρ τρέχει',
 --               '- Θαλής ο Μιλήσιος, 643-548 π.Χ.'
 --           }

 --           vim.g.dashboard_preview_command = 'cat'
 --           --vim.g.dashboard_preview_pipeline = 'lolcat'
 --           vim.g.dashboard_preview_file = '~/.config/nvim/neovim.cat'
 --           vim.g.dashboard_preview_file_height = 12
 --           vim.g.dashboard_preview_file_width = 80



    use {
        "savq/melange",
        config = function()
            vim.o.background = "dark"
            vim.cmd("colorscheme melange")
        end
    }
end)
