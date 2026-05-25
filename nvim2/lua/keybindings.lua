

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
  local filename = vim.fn.expand('%:p')
  if filename == '' then
    filename = '[No Name]'
  end
  local output = string.format(
    "File: %s\nLines: %d-%d\n\n%s",
    filename, start_line, end_line, selected_text
  )
  vim.fn.setreg('+', output)
  --Restore unnamed register correctly
  vim.fn.setreg('"', old_reg, old_reg_type)
  vim.notify(
    string.format("Copied selection from %s (lines %d-%d)", filename, start_line, end_line),
    vim.log.levels.INFO
  )
end


local M = {}

M.setup = function()
	map = vim.keymap.set
	map("n", "<C-q", ":Inspect<CR>")
	map("n", "<C-j>", "5j_")
	map("n", "<C-k>", "5k_")
    map("n", "<leader>f",":Neotree current buffers toggle<CR>")
    map("n", "<leader>e",":Neotree current toggle<CR>")

	map("n", "<leader>os", ":so /home/rafi/.config/nvim/init.lua<CR>")
	-- map("n", "<leader>e", ":Ex<CR>", { desc = "Netrw" })
	map("n", "<leader>ve", ":Vex<CR>", { desc = "Vertical Netrw" })
	map("n", "<leader>re", ":Rex<CR>", { desc = "Vertical Netrw" })
	map("n", "<leader>E", ":20Lex<CR>", { desc = "Vertical Netrw" })


	map("n", "<leader>qa", ":PaqInstall<CR>")
	map("n", "<leader>qs", ":PaqList<CR>")
	map("n", "<leader>qd", ":PaqClean<CR>")

	map("n", "<leader>p", ":lua vim.diagnostic.open_float()<CR>")
	-- map("n", "<leader>g", ":lua vim.lsp.buf.definition()<CR>")
	map("n", "<leader>r", ":lua vim.lsp.buf.declaration()<CR>")

	-- map("n", "<leader>ga", ":LspInfo<CR>")
	map("n", "<leader>gd", ":Telescope lsp_definitions<CR>")
	map("n", "<leader>gs", ":Telescope lsp_references<CR>")
	map("n", "<leader>gi", ":Telescope lsp_implementations<CR>")
	map("n", "<leader>gt", ":Telescope lsp_type_definitions<CR>")

	-- map('n', '<leader>j', ':Telescope jumplist<CR>')
	map("n", "<leader>ta", ":Telescope live_grep<CR>")
	map("n", "<leader>ts", ":Telescope help_tags<CR>")

	map("n", "<C-f>", ":Telescope current_buffer_fuzzy_find <CR>")
	map("n", "<C-e>", ":Telescope find_files<CR>")
	map("v", "<C-j>", "5j")
	map("v", "<C-k>", "5k")
	map("v", "<C-k>", "5k")

	map("n", "\\", ":b#<CR>")
	map("n", "L", ":bnext<CR>")
	map("n", "H", ":bprevious<CR>")
	map("n", "<C-w>q", ":lua MiniBufremove.delete()<CR>")

    	map("n", "<leader>g", ":tab G<CR>")
    	map('v', '<leader>r', copy_visual_with_info, { desc = 'Copy visual selection with line numbers and filename' })
end
return M
