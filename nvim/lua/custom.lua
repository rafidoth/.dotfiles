local function copy_visual_with_info()
  local old_reg = vim.fn.getreg('"')
  local old_reg_type = vim.fn.getregtype('"')
  -- Yank visual selection into register v
  vim.cmd('normal! "vy')
  local selected_text = vim.fn.getreg('v')
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local start_line = start_pos[2]
  local end_line = end_pos[2]
  local filename = vim.fn.expand('%:t')
  if filename == '' then
    filename = '[No Name]'
  end
  local output = string.format(
    "File: %s\nLines: %d-%d\n\n%s",
    filename, start_line, end_line, selected_text
  )
  vim.fn.setreg('+', output)
  -- ✅ Restore unnamed register correctly
  vim.fn.setreg('"', old_reg, old_reg_type)
  vim.notify(
    string.format("Copied selection from %s (lines %d-%d)", filename, start_line, end_line),
    vim.log.levels.INFO
  )
end

vim.api.nvim_create_user_command('CopyVisualWithInfo', copy_visual_with_info, {})
vim.keymap.set('v', '<leader>y', copy_visual_with_info, { desc = 'Copy visual selection with line numbers and filename' })|



