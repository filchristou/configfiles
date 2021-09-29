-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/u/home/wima/fchrstou/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/u/home/wima/fchrstou/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/u/home/wima/fchrstou/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/u/home/wima/fchrstou/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/u/home/wima/fchrstou/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n�\3\0\0\6\0\22\0)6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\19\0'\4\20\0005\5\21\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\28:BufferLineMoveNext<CR>\n<C-6>\1\0\1\fnoremap\2\28:BufferLineMovePrev<CR>\n<C-4>\1\0\1\fnoremap\2\29:BufferLineCyclePrev<CR>\n<C-b>\1\0\1\fnoremap\2\29:BufferLineCycleNext<CR>\n<C-n>\6n\20nvim_set_keymap\bapi\bvim\foptions\1\0\0\1\0\2\20separator_style\tthin\fnumbers\tboth\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/u/home/wima/fchrstou/.local/share/nvim/site/pack/packer/start/bufferline.nvim"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/u/home/wima/fchrstou/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\2\n�\16\0\0\6\0%\0Q6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\19\0'\4\20\0005\5\21\0B\0\5\0016\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\22\0'\4\23\0005\5\24\0B\0\5\0016\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\25\0'\4\26\0005\5\27\0B\0\5\0016\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\28\0'\4\29\0005\5\30\0B\0\5\0016\0\0\0009\0\1\0005\1 \0=\1\31\0006\0\0\0009\0\1\0005\1\"\0=\1!\0006\0\0\0009\0\1\0005\1$\0=\1#\0K\0\1\0\1\3\0\0Lτάχιστον νοῦς· διὰ παντὸς γὰρ τρέχει5- Θαλής ο Μιλήσιος, 643-548 π.Χ.\28dashboard_custom_footer\1\t\0\0�\1 ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗�\1 ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║�\1 ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║�\1 ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║�\1 ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║�\1 ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝<        hyperextensible Vim-based text editor          <                  (with Lua build-in)                  \28dashboard_custom_header\1\0\a\14find_word\b--5\14find_file\b--3\17last_session\b--6\23change_colorscheme\b--2\rnew_file\b--7\15book_marks\b--1\17find_history\b--4\30dashboard_custom_shortcut\1\0\1\fnoremap\2\30<cmd>DashboardNewFile<CR>\22<leader><leader>6\1\0\1\fnoremap\2\31<cmd>DashboardJumpMark<CR>\22<leader><leader>5\1\0\1\fnoremap\2\31<cmd>DashboardFindWord<CR>\22<leader><leader>4\1\0\1\fnoremap\2(<cmd>DashboardChangeColorscheme<CR>\22<leader><leader>3\1\0\1\fnoremap\2\31<cmd>DashboardFindFile<CR>\22<leader><leader>2\1\0\1\fnoremap\2\"<cmd>DashboardFindHistory<CR>\22<leader><leader>1\1\0\1\fnoremap\2\25<cmd>SessionLoad<CR>\15<leader>sl\1\0\1\fnoremap\2\25<cmd>SessionSave<CR>\15<leader>ss\6n\20nvim_set_keymap\bapi\14telescope dashboard_default_executive\6g\bvim\0" },
    loaded = true,
    path = "/u/home/wima/fchrstou/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["julia-vim"] = {
    loaded = true,
    path = "/u/home/wima/fchrstou/.local/share/nvim/site/pack/packer/start/julia-vim"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/u/home/wima/fchrstou/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n`\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\ntheme\15everforest\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/u/home/wima/fchrstou/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/u/home/wima/fchrstou/.local/share/nvim/site/pack/packer/start/lush.nvim"
  },
  melange = {
    config = { "\27LJ\2\nY\0\0\3\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\24colorscheme melange\bcmd\tdark\15background\6o\bvim\0" },
    loaded = true,
    path = "/u/home/wima/fchrstou/.local/share/nvim/site/pack/packer/start/melange"
  },
  neorg = {
    config = { "\27LJ\2\n�\2\0\2\b\0\n\0\0189\2\0\1'\4\1\0005\5\a\0004\6\6\0005\a\2\0>\a\1\0065\a\3\0>\a\2\0065\a\4\0>\a\3\0065\a\5\0>\a\4\0065\a\6\0>\a\5\6=\6\b\0055\6\t\0B\2\4\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\6n\1\0\0\1\3\0\0\t<CR>\"core.norg.esupports.goto_link\1\3\0\0\14<C-Space>-core.norg.qol.todo_items.todo.task_cycle\1\3\0\0\bgtp/core.norg.qol.todo_items.todo.task_pending\1\3\0\0\bgtu.core.norg.qol.todo_items.todo.task_undone\1\3\0\0\bgtd,core.norg.qol.todo_items.todo.task_done\tnorg\22map_event_to_mode{\1\0\6\0\6\0\t'\0\0\0006\1\1\0'\3\2\0B\1\2\0029\2\3\1'\4\4\0003\5\5\0B\2\3\1K\0\1\0\0)core.keybinds.events.enable_keybinds\ron_event\20neorg.callbacks\frequire\r<Leader>�\2\1\0\a\0\19\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\15\0005\3\3\0004\4\0\0=\4\4\0034\4\0\0=\4\5\0035\4\t\0005\5\a\0005\6\6\0=\6\b\5=\5\n\4=\4\v\0035\4\r\0005\5\f\0=\5\n\4=\4\14\3=\3\16\0023\3\17\0=\3\18\2B\0\2\1K\0\1\0\thook\0\tload\1\0\0\25core.norg.completion\1\0\0\1\0\1\vengine\rnvim-cmp\21core.norg.dirman\vconfig\1\0\0\15workspaces\1\0\0\1\0\1\17my_workspace\f~/neorg\24core.norg.concealer\18core.defaults\1\0\0\nsetup\nneorg\frequire\0" },
    loaded = true,
    path = "/u/home/wima/fchrstou/.local/share/nvim/site/pack/packer/start/neorg"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n�\3\0\0\b\0\22\0+6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\0035\4\b\0009\5\6\0009\5\a\5B\5\1\2=\5\t\0049\5\6\0009\5\n\5B\5\1\2=\5\v\0049\5\6\0009\5\f\5)\a��B\5\2\2=\5\r\0049\5\6\0009\5\f\5)\a\4\0B\5\2\2=\5\14\0049\5\6\0009\5\15\5B\5\1\2=\5\16\0049\5\6\0009\5\17\5B\5\1\2=\5\18\4=\4\6\0034\4\3\0005\5\19\0>\5\1\0045\5\20\0>\5\2\4=\4\21\3B\1\2\1K\0\1\0\fsources\1\0\1\tname\nneorg\1\0\1\tname\rnvim_lsp\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\15completion\1\0\0\1\0\1\16completeopt\26menu,menuone,noselect\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "/u/home/wima/fchrstou/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nm\0\0\4\0\a\0\f6\0\0\0009\0\1\0006\2\0\0009\2\2\0029\2\3\0029\2\4\2B\0\2\0026\1\5\0009\1\6\1\18\3\0\0B\1\2\1L\0\2\0\tsort\ntable\19CodeActionKind\rprotocol\blsp\15tbl_values\bvim�\5\1\0\a\0\30\0B6\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\0029\1\4\0009\1\5\0019\1\6\1+\2\2\0=\2\a\0019\1\4\0009\1\5\0019\1\6\1+\2\2\0=\2\b\0019\1\4\0009\1\5\0019\1\6\0015\2\v\0005\3\n\0=\3\f\2=\2\t\0019\1\4\0009\1\5\0019\1\6\1+\2\2\0=\2\r\0019\1\4\0009\1\5\0019\1\6\1+\2\2\0=\2\14\0019\1\4\0009\1\5\0019\1\6\1+\2\2\0=\2\15\0019\1\4\0009\1\5\0019\1\6\1+\2\2\0=\2\16\0019\1\4\0009\1\5\0019\1\6\0015\2\19\0005\3\18\0=\3\20\2=\2\17\0019\1\4\0009\1\5\0019\1\6\0015\2\22\0=\2\21\0019\1\4\0005\2\24\0005\3\27\0005\4\26\0003\5\25\0B\5\1\2=\5\f\4=\4\28\3=\3\29\2=\2\23\0012\0\0�L\0\2\0\29codeActionLiteralSupport\19codeActionKind\1\0\0\1\0\0\0\1\0\1\24dynamicRegistration\2\15codeAction\1\2\0\0\rmarkdown\24documentationFormat\15properties\1\0\0\1\4\0\0\18documentation\vdetail\24additionalTextEdits\19resolveSupport\28commitCharactersSupport\24labelDetailsSupport\25insertReplaceSupport\22deprecatedSupport\rvalueSet\1\0\0\1\2\0\0\3\1\15tagSupport\21preselectSupport\19snippetSupport\19completionItem\15completion\17textDocument\29make_client_capabilities\rprotocol\blsp\bvimA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1�\24nvim_buf_set_keymap\bapi\bvimA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1�\24nvim_buf_set_option\bapi\bvim�\3\1\2\n\0\20\0&3\2\0\0003\3\1\0\18\4\3\0'\6\2\0'\a\3\0B\4\3\1\18\4\2\0'\6\4\0'\a\5\0'\b\6\0005\t\a\0B\4\5\1\18\4\2\0'\6\4\0'\a\b\0'\b\t\0005\t\n\0B\4\5\1\18\4\2\0'\6\4\0'\a\v\0'\b\f\0005\t\r\0B\4\5\1\18\4\2\0'\6\4\0'\a\14\0'\b\15\0005\t\16\0B\4\5\1\18\4\2\0'\6\4\0'\a\17\0'\b\18\0005\t\19\0B\4\5\0012\0\0�K\0\1\0\1\0\1\fnoremap\0028:lua vim.lsp.diagnostic.show_line_diagnostics()<CR>\15<leader>lg\1\0\1\fnoremap\2+:lua vim.lsp.buf.document_symbol()<CR>\15<leader>ls\1\0\1\fnoremap\2&:lua vim.lsp.buf.references()<CR>\15<leader>lr\1\0\1\fnoremap\2!:lua vim.lsp.buf.hover()<CR>\15<leader>lh\1\0\1\fnoremap\2&:lua vim.lsp.buf.definition()<CR>\15<leader>ld\6n\27v:lua.vim.lsp.omnifunc\romnifunc\0\0'\0\2\5\1\1\0\6-\2\0\0008\2\0\0029\2\0\2\18\4\1\0B\2\2\1K\0\1\0\2�\nsetup�\2\1\0\n\0\17\0\0293\0\0\0006\1\1\0009\1\2\0019\1\3\0016\2\1\0009\2\2\0029\2\5\0026\4\1\0009\4\2\0049\4\6\0049\4\a\0045\5\b\0B\2\3\2=\2\4\0013\1\t\0006\2\n\0'\4\v\0B\2\2\0023\3\f\0\18\4\3\0'\6\r\0005\a\14\0=\1\15\a\18\b\0\0B\b\1\2=\b\16\aB\4\3\0012\0\0�K\0\1\0\17capabilities\14on_attach\1\0\0\fjulials\0\14lspconfig\frequire\0\1\0\4\nsigns\2\14underline\1\17virtual_text\1\21update_in_insert\1\27on_publish_diagnostics\15diagnostic\twith$textDocument/publishDiagnostics\rhandlers\blsp\bvim\0\0" },
    loaded = true,
    path = "/u/home/wima/fchrstou/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-scrollview"] = {
    loaded = true,
    path = "/u/home/wima/fchrstou/.local/share/nvim/site/pack/packer/start/nvim-scrollview"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n�\1\0\0\6\0\n\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\24:NvimTreeToggle<CR>\6t\6n\20nvim_set_keymap\bapi\bvim\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/u/home/wima/fchrstou/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n�\3\0\0\6\0\20\0\0266\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0025\1\a\0005\2\4\0005\3\5\0=\3\6\2=\2\b\1=\1\3\0006\1\0\0'\3\t\0B\1\2\0029\1\n\0015\3\f\0005\4\v\0=\4\r\0035\4\14\0005\5\15\0=\5\16\4=\4\17\0035\4\18\0=\4\19\3B\1\2\1K\0\1\0\vindent\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\4\22scope_incremental\bgrc\21node_incremental\bgrn\21node_decremental\bgrm\19init_selection\bgnn\1\0\1\venable\2\14highlight\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\17install_info\1\0\0\nfiles\1\3\0\0\17src/parser.c\19src/scanner.cc\1\0\2\vbranch\tmain\burl3https://github.com/nvim-neorg/tree-sitter-norg\tnorg\23get_parser_configs\28nvim-treesitter.parsers\frequire\0" },
    loaded = true,
    path = "/u/home/wima/fchrstou/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\roverride\1\0\1\fdefault\2\bzsh\1\0\0\1\0\3\tname\bZsh\ncolor\f#428850\ticon\b\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = true,
    path = "/u/home/wima/fchrstou/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/u/home/wima/fchrstou/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/u/home/wima/fchrstou/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\6\0\n\0\0176\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2:<cmd>lua require('telescope.builtin').live_grep()<cr>\15<leader>fg\1\0\1\fnoremap\2;<cmd>lua require('telescope.builtin').find_files()<cr>\15<leader>ff\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/u/home/wima/fchrstou/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/u/home/wima/fchrstou/.local/share/nvim/site/pack/packer/start/tokyonight.nvim"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/u/home/wima/fchrstou/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["zenbones.nvim"] = {
    loaded = true,
    path = "/u/home/wima/fchrstou/.local/share/nvim/site/pack/packer/start/zenbones.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\n�\3\0\0\6\0\22\0)6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\19\0'\4\20\0005\5\21\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\28:BufferLineMoveNext<CR>\n<C-6>\1\0\1\fnoremap\2\28:BufferLineMovePrev<CR>\n<C-4>\1\0\1\fnoremap\2\29:BufferLineCyclePrev<CR>\n<C-b>\1\0\1\fnoremap\2\29:BufferLineCycleNext<CR>\n<C-n>\6n\20nvim_set_keymap\bapi\bvim\foptions\1\0\0\1\0\2\20separator_style\tthin\fnumbers\tboth\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: melange
time([[Config for melange]], true)
try_loadstring("\27LJ\2\nY\0\0\3\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\24colorscheme melange\bcmd\tdark\15background\6o\bvim\0", "config", "melange")
time([[Config for melange]], false)
-- Config for: neorg
time([[Config for neorg]], true)
try_loadstring("\27LJ\2\n�\2\0\2\b\0\n\0\0189\2\0\1'\4\1\0005\5\a\0004\6\6\0005\a\2\0>\a\1\0065\a\3\0>\a\2\0065\a\4\0>\a\3\0065\a\5\0>\a\4\0065\a\6\0>\a\5\6=\6\b\0055\6\t\0B\2\4\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\6n\1\0\0\1\3\0\0\t<CR>\"core.norg.esupports.goto_link\1\3\0\0\14<C-Space>-core.norg.qol.todo_items.todo.task_cycle\1\3\0\0\bgtp/core.norg.qol.todo_items.todo.task_pending\1\3\0\0\bgtu.core.norg.qol.todo_items.todo.task_undone\1\3\0\0\bgtd,core.norg.qol.todo_items.todo.task_done\tnorg\22map_event_to_mode{\1\0\6\0\6\0\t'\0\0\0006\1\1\0'\3\2\0B\1\2\0029\2\3\1'\4\4\0003\5\5\0B\2\3\1K\0\1\0\0)core.keybinds.events.enable_keybinds\ron_event\20neorg.callbacks\frequire\r<Leader>�\2\1\0\a\0\19\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\15\0005\3\3\0004\4\0\0=\4\4\0034\4\0\0=\4\5\0035\4\t\0005\5\a\0005\6\6\0=\6\b\5=\5\n\4=\4\v\0035\4\r\0005\5\f\0=\5\n\4=\4\14\3=\3\16\0023\3\17\0=\3\18\2B\0\2\1K\0\1\0\thook\0\tload\1\0\0\25core.norg.completion\1\0\0\1\0\1\vengine\rnvim-cmp\21core.norg.dirman\vconfig\1\0\0\15workspaces\1\0\0\1\0\1\17my_workspace\f~/neorg\24core.norg.concealer\18core.defaults\1\0\0\nsetup\nneorg\frequire\0", "config", "neorg")
time([[Config for neorg]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\roverride\1\0\1\fdefault\2\bzsh\1\0\0\1\0\3\tname\bZsh\ncolor\f#428850\ticon\b\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n�\3\0\0\b\0\22\0+6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\0035\4\b\0009\5\6\0009\5\a\5B\5\1\2=\5\t\0049\5\6\0009\5\n\5B\5\1\2=\5\v\0049\5\6\0009\5\f\5)\a��B\5\2\2=\5\r\0049\5\6\0009\5\f\5)\a\4\0B\5\2\2=\5\14\0049\5\6\0009\5\15\5B\5\1\2=\5\16\0049\5\6\0009\5\17\5B\5\1\2=\5\18\4=\4\6\0034\4\3\0005\5\19\0>\5\1\0045\5\20\0>\5\2\4=\4\21\3B\1\2\1K\0\1\0\fsources\1\0\1\tname\nneorg\1\0\1\tname\rnvim_lsp\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\15completion\1\0\0\1\0\1\16completeopt\26menu,menuone,noselect\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nm\0\0\4\0\a\0\f6\0\0\0009\0\1\0006\2\0\0009\2\2\0029\2\3\0029\2\4\2B\0\2\0026\1\5\0009\1\6\1\18\3\0\0B\1\2\1L\0\2\0\tsort\ntable\19CodeActionKind\rprotocol\blsp\15tbl_values\bvim�\5\1\0\a\0\30\0B6\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\0029\1\4\0009\1\5\0019\1\6\1+\2\2\0=\2\a\0019\1\4\0009\1\5\0019\1\6\1+\2\2\0=\2\b\0019\1\4\0009\1\5\0019\1\6\0015\2\v\0005\3\n\0=\3\f\2=\2\t\0019\1\4\0009\1\5\0019\1\6\1+\2\2\0=\2\r\0019\1\4\0009\1\5\0019\1\6\1+\2\2\0=\2\14\0019\1\4\0009\1\5\0019\1\6\1+\2\2\0=\2\15\0019\1\4\0009\1\5\0019\1\6\1+\2\2\0=\2\16\0019\1\4\0009\1\5\0019\1\6\0015\2\19\0005\3\18\0=\3\20\2=\2\17\0019\1\4\0009\1\5\0019\1\6\0015\2\22\0=\2\21\0019\1\4\0005\2\24\0005\3\27\0005\4\26\0003\5\25\0B\5\1\2=\5\f\4=\4\28\3=\3\29\2=\2\23\0012\0\0�L\0\2\0\29codeActionLiteralSupport\19codeActionKind\1\0\0\1\0\0\0\1\0\1\24dynamicRegistration\2\15codeAction\1\2\0\0\rmarkdown\24documentationFormat\15properties\1\0\0\1\4\0\0\18documentation\vdetail\24additionalTextEdits\19resolveSupport\28commitCharactersSupport\24labelDetailsSupport\25insertReplaceSupport\22deprecatedSupport\rvalueSet\1\0\0\1\2\0\0\3\1\15tagSupport\21preselectSupport\19snippetSupport\19completionItem\15completion\17textDocument\29make_client_capabilities\rprotocol\blsp\bvimA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1�\24nvim_buf_set_keymap\bapi\bvimA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1�\24nvim_buf_set_option\bapi\bvim�\3\1\2\n\0\20\0&3\2\0\0003\3\1\0\18\4\3\0'\6\2\0'\a\3\0B\4\3\1\18\4\2\0'\6\4\0'\a\5\0'\b\6\0005\t\a\0B\4\5\1\18\4\2\0'\6\4\0'\a\b\0'\b\t\0005\t\n\0B\4\5\1\18\4\2\0'\6\4\0'\a\v\0'\b\f\0005\t\r\0B\4\5\1\18\4\2\0'\6\4\0'\a\14\0'\b\15\0005\t\16\0B\4\5\1\18\4\2\0'\6\4\0'\a\17\0'\b\18\0005\t\19\0B\4\5\0012\0\0�K\0\1\0\1\0\1\fnoremap\0028:lua vim.lsp.diagnostic.show_line_diagnostics()<CR>\15<leader>lg\1\0\1\fnoremap\2+:lua vim.lsp.buf.document_symbol()<CR>\15<leader>ls\1\0\1\fnoremap\2&:lua vim.lsp.buf.references()<CR>\15<leader>lr\1\0\1\fnoremap\2!:lua vim.lsp.buf.hover()<CR>\15<leader>lh\1\0\1\fnoremap\2&:lua vim.lsp.buf.definition()<CR>\15<leader>ld\6n\27v:lua.vim.lsp.omnifunc\romnifunc\0\0'\0\2\5\1\1\0\6-\2\0\0008\2\0\0029\2\0\2\18\4\1\0B\2\2\1K\0\1\0\2�\nsetup�\2\1\0\n\0\17\0\0293\0\0\0006\1\1\0009\1\2\0019\1\3\0016\2\1\0009\2\2\0029\2\5\0026\4\1\0009\4\2\0049\4\6\0049\4\a\0045\5\b\0B\2\3\2=\2\4\0013\1\t\0006\2\n\0'\4\v\0B\2\2\0023\3\f\0\18\4\3\0'\6\r\0005\a\14\0=\1\15\a\18\b\0\0B\b\1\2=\b\16\aB\4\3\0012\0\0�K\0\1\0\17capabilities\14on_attach\1\0\0\fjulials\0\14lspconfig\frequire\0\1\0\4\nsigns\2\14underline\1\17virtual_text\1\21update_in_insert\1\27on_publish_diagnostics\15diagnostic\twith$textDocument/publishDiagnostics\rhandlers\blsp\bvim\0\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\6\0\n\0\0176\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2:<cmd>lua require('telescope.builtin').live_grep()<cr>\15<leader>fg\1\0\1\fnoremap\2;<cmd>lua require('telescope.builtin').find_files()<cr>\15<leader>ff\6n\20nvim_set_keymap\bapi\bvim\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: tokyonight.nvim
time([[Config for tokyonight.nvim]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "tokyonight.nvim")
time([[Config for tokyonight.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n`\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\ntheme\15everforest\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n�\1\0\0\6\0\n\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\24:NvimTreeToggle<CR>\6t\6n\20nvim_set_keymap\bapi\bvim\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n�\3\0\0\6\0\20\0\0266\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0025\1\a\0005\2\4\0005\3\5\0=\3\6\2=\2\b\1=\1\3\0006\1\0\0'\3\t\0B\1\2\0029\1\n\0015\3\f\0005\4\v\0=\4\r\0035\4\14\0005\5\15\0=\5\16\4=\4\17\0035\4\18\0=\4\19\3B\1\2\1K\0\1\0\vindent\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\4\22scope_incremental\bgrc\21node_incremental\bgrn\21node_decremental\bgrm\19init_selection\bgnn\1\0\1\venable\2\14highlight\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\17install_info\1\0\0\nfiles\1\3\0\0\17src/parser.c\19src/scanner.cc\1\0\2\vbranch\tmain\burl3https://github.com/nvim-neorg/tree-sitter-norg\tnorg\23get_parser_configs\28nvim-treesitter.parsers\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: dashboard-nvim
time([[Config for dashboard-nvim]], true)
try_loadstring("\27LJ\2\n�\16\0\0\6\0%\0Q6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\19\0'\4\20\0005\5\21\0B\0\5\0016\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\22\0'\4\23\0005\5\24\0B\0\5\0016\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\25\0'\4\26\0005\5\27\0B\0\5\0016\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\28\0'\4\29\0005\5\30\0B\0\5\0016\0\0\0009\0\1\0005\1 \0=\1\31\0006\0\0\0009\0\1\0005\1\"\0=\1!\0006\0\0\0009\0\1\0005\1$\0=\1#\0K\0\1\0\1\3\0\0Lτάχιστον νοῦς· διὰ παντὸς γὰρ τρέχει5- Θαλής ο Μιλήσιος, 643-548 π.Χ.\28dashboard_custom_footer\1\t\0\0�\1 ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗�\1 ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║�\1 ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║�\1 ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║�\1 ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║�\1 ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝<        hyperextensible Vim-based text editor          <                  (with Lua build-in)                  \28dashboard_custom_header\1\0\a\14find_word\b--5\14find_file\b--3\17last_session\b--6\23change_colorscheme\b--2\rnew_file\b--7\15book_marks\b--1\17find_history\b--4\30dashboard_custom_shortcut\1\0\1\fnoremap\2\30<cmd>DashboardNewFile<CR>\22<leader><leader>6\1\0\1\fnoremap\2\31<cmd>DashboardJumpMark<CR>\22<leader><leader>5\1\0\1\fnoremap\2\31<cmd>DashboardFindWord<CR>\22<leader><leader>4\1\0\1\fnoremap\2(<cmd>DashboardChangeColorscheme<CR>\22<leader><leader>3\1\0\1\fnoremap\2\31<cmd>DashboardFindFile<CR>\22<leader><leader>2\1\0\1\fnoremap\2\"<cmd>DashboardFindHistory<CR>\22<leader><leader>1\1\0\1\fnoremap\2\25<cmd>SessionLoad<CR>\15<leader>sl\1\0\1\fnoremap\2\25<cmd>SessionSave<CR>\15<leader>ss\6n\20nvim_set_keymap\bapi\14telescope dashboard_default_executive\6g\bvim\0", "config", "dashboard-nvim")
time([[Config for dashboard-nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
