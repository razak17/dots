local opts =  {
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  use_saga_diagnostic_sign = true,
  error_header = "  Error",
  warn_header = "  Warn",
  hint_header = "  Hint",
  infor_header = "  Infor",
  max_diag_msg_width = 50,
  code_action_icon = ' ',
  code_action_keys = { quit = 'q',exec = '<CR>' },
  finder_definition_icon = '  ',
  finder_reference_icon = '  ',
  max_finder_preview_lines = 10,
  finder_action_keys = {
    open = 'o', vsplit = 's',split = 'i',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>'
  },
  definition_preview_icon = '  ',
  -- 1: thin border | 2: rounded border | 3: thick border | 4: ascii border
  border_style = 1,
  rename_prompt_prefix = '➤',
}

return opts
