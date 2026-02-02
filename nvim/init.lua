vim.g.mapleader = " "
local keys = require("keybindings")
keys.setup()
require("appearance").setup()
require("plugins").setup()

-- my dummmbasss snippets here
local function insert_example_text_block()
	-- The text you want to insert, as a table of strings (one for each line)
	local text_block = {
		"if err != nil {",
		"  return err",
		"}",
	}
	local current_buf = vim.api.nvim_get_current_buf()
	local insert_at = vim.api.nvim_win_get_cursor(0)[1]

	vim.api.nvim_buf_set_lines(current_buf, insert_at, insert_at, true, text_block)
	local new_cursor_row = insert_at + 2
	vim.api.nvim_win_set_cursor(0, { new_cursor_row, 3 }) -- Move to row 4, column 3 (adjust as needed)
end

-- Create the Neovim command
vim.api.nvim_create_user_command(
	"E",
	insert_example_text_block, -- The function to call
	{
		desc = "Insert a multi-line code block at the cursor position",
		nargs = 0, -- Takes no arguments
	}
)

--

-- vim.api.nvim_set_hl(0, 'Function' , {fg = '#fde047', bg = 'NONE', bold = true})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		local params = vim.lsp.util.make_range_params()
		params.context = { only = { "source.organizeImports" } }
		-- buf_request_sync defaults to a 1000ms timeout. Depending on your
		-- machine and codebase, you may want longer. Add an additional
		-- argument after params if you find that you have to write the file
		-- twice for changes to be saved.
		-- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
		for cid, res in pairs(result or {}) do
			for _, r in pairs(res.result or {}) do
				if r.edit then
					local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
					vim.lsp.util.apply_workspace_edit(r.edit, enc)
				end
			end
		end
		vim.lsp.buf.format({ async = false })
	end,
})
vim.lsp.enable("gopls")
vim.lsp.enable("templ")
vim.lsp.enable("lua_ls")
require("theme").setup()
