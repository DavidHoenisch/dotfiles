-- Function to jump to the closing brace at the first column, starting from the next line
function JumpToClosingBrace()
  -- Get the current mode
  local mode = vim.fn.mode()

  -- Check if we are in visual mode
  if mode:match '[vV]' then
    -- Get the current cursor position in visual mode
    local initial_pos = vim.fn.getpos "'<"
    -- Move the cursor to the closing brace `}`
    vim.fn.search('^}', 'W')
    -- Extend the selection to the new position
    vim.fn.setpos("'<", initial_pos)
    vim.cmd 'normal! gv'
  else
    -- In normal mode, simply jump to the closing brace `}`
    vim.fn.search('^}', 'W')
  end
end

return {
  -- Map <leader>} to the custom function for normal mode
  vim.api.nvim_set_keymap('n', '<leader>}', ':lua JumpToClosingBrace()<CR>', { noremap = true, silent = true }),

  -- Map <leader>} to the custom function for visual mode
  vim.api.nvim_set_keymap('v', '<leader>}', ':<C-u>lua JumpToClosingBrace()<CR>', { noremap = true, silent = true }),
}
