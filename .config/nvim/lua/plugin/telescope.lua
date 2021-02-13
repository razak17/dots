local mappings = require('utils.map')
local nnoremap = mappings.nnoremap

require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = require('telescope.actions').close,
        ["<C-e>"] = require('telescope.actions').goto_file_selection_tabedit,
        ["<C-b>"] = require('telescope.actions').move_selection_previous,
      },
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_position = "bottom",
    prompt_prefix = ">",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_defaults = {
      -- TODO add builtin options.
    },
    file_sorter =  require'telescope.sorters'.get_fzy_sorter,
    file_ignore_patterns = {"target/*"},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default { }, currently unsupported for shells like cmd.exe / powershell.exe
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_cat.new`
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_vimgrep.new`
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_qflist.new`
  }
})

-- Using lua functions
nnoremap('<C-k>', ':lua require("telescope.builtin").find_files()<CR>')
nnoremap('<Leader>ff', ':lua require("telescope.builtin").builtin()<CR>')
nnoremap('<Leader>fr', ':lua require("telescope.builtin").keymaps()<CR>')
nnoremap('<Leader>fb', ':lua require("telescope.builtin").buffers()<CR>')
nnoremap('<Leader>fh', ':lua require("telescope.builtin").help_tags()<CR>')
nnoremap('<Leader>fl', ':lua require("telescope.builtin").live_grep()<CR>')
nnoremap('<Leader>fc', ':lua require("telescope.builtin").grep_string { search = vim.fn.expand("<cword>") }<CR>')
nnoremap('<Leader>fs', ':lua require("telescope.builtin").grep_string({ search = vim.fn.input("Grep For > ")})<CR>')

-- Git Pickers
nnoremap('<Leader>fgb', ':lua require("telescope.builtin").git_branches()<CR>')
nnoremap('<Leader>fgc', ':lua require("telescope.builtin").git_commits()<CR>')
nnoremap('<Leader>fgC', ':lua require("telescope.builtin").git_bcommits()<CR>')
nnoremap('<Leader>fgf', ':lua require("telescope.builtin").git_files()<CR>')
nnoremap('<Leader>fgs', ':lua require("telescope.builtin").git_status()<CR>')
