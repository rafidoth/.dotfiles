local M = {}

M.setup = function()
	map = vim.keymap.set
	map("n", "<C-q", ":Inspect<CR>")
	map("n", "<C-j>", "5j_")
	map("n", "<C-k>", "5k_")

	map("n", "<leader>os", ":so /home/rafi/.config/nvim/init.lua<CR>")
	map("n", "<leader>e", ":Ex<CR>", { desc = "Netrw" })
	map("n", "<leader>ve", ":Vex<CR>", { desc = "Vertical Netrw" })
	map("n", "<leader>re", ":Rex<CR>", { desc = "Vertical Netrw" })

	map("n", "<leader>cd", ":Copilot disable<CR>")
	map("n", "<leader>ce", ":Copilot enable<CR>")

	map("n", "<leader>qa", ":PaqInstall<CR>")
	map("n", "<leader>qs", ":PaqList<CR>")
	map("n", "<leader>qd", ":PaqClean<CR>")

	map("n", "<leader>p", ":lua vim.diagnostic.open_float()<CR>")
	-- map("n", "<leader>g", ":lua vim.lsp.buf.definition()<CR>")
	map("n", "<leader>r", ":lua vim.lsp.buf.declaration()<CR>")

	map("n", "<leader>ga", ":LspInfo<CR>")
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

	-- opencode keybinds
	vim.keymap.set({ "n", "x" }, "<C-a>", function()
		require("opencode").ask("@this: ", { submit = true })
	end, { desc = "Ask opencode" })

	vim.keymap.set({ "n", "x" }, "<C-x>", function()
		require("opencode").select()
	end, { desc = "Execute opencode action…" })
	vim.keymap.set({ "n", "t" }, "<C-.>", function()
		require("opencode").toggle()
	end, { desc = "Toggle opencode" })

	vim.keymap.set({ "n", "x" }, "go", function()
		return require("opencode").operator("@this ")
	end, { expr = true, desc = "Add range to opencode" })
	vim.keymap.set("n", "goo", function()
		return require("opencode").operator("@this ") .. "_"
	end, { expr = true, desc = "Add line to opencode" })

	vim.keymap.set("n", "<S-C-u>", function()
		require("opencode").command("session.half.page.up")
	end, { desc = "opencode half page up" })
	vim.keymap.set("n", "<S-C-d>", function()
		require("opencode").command("session.half.page.down")
	end, { desc = "opencode half page down" })

	-- You may want these if you stick with the opinionated "<C-a>" and "<C-x>" above — otherwise consider "<leader>o".
	vim.keymap.set("n", "+", "<C-a>", { desc = "Increment", noremap = true })
	vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement", noremap = true })
end
return M
