local M = {}

M.setup = function()
	vim.o.termguicolors = true
	-- vim.o.background = "light"
	-- vim.cmd("colorscheme github_dark_high_contrast")
	vim.cmd("colorscheme tundra")
	vim.cmd("let g:netrw_banner=0")
	-- vim.cmd("hi StatusLine guibg=NONE guifg=#ffffff")
	vim.api.nvim_set_hl(0, "Search", { bg = "#DAE84D", fg = "#000000" })
	-- vim.cmd("hi Normal guifg=white ctermfg=white")
	-- vim.cmd("hi LineNr guibg=NONE ctermbg=NONE ctermfg=Yellow guibg=NONE guifg=Yellow")
	-- vim.cmd("hi CursorLine guibg=NONE")

	vim.opt.cursorline = true
	-- vim.api.nvim_set_hl(0, "CursorLineNr", {
	-- 	fg = "Green",
	-- 	bg = "None",
	-- 	ctermfg = "Green",
	-- 	ctermbg = "None",
	-- })
	-- vim.cmd("hi String guifg=white ctermfg=white ")
	-- vim.cmd("hi Links guifg=white ctermfg=white")
	-- vim.cmd("hi Function guifg=white ctermfg=white")
	-- vim.cmd("hi Keyword guifg=white ctermfg=white")
	-- vim.cmd("hi Statement guifg=white ctermfg=white")
	-- vim.cmd("hi Type guifg=white ctermfg=white")
	--
	-- vim.cmd("hi Keyword guifg=yellow ctermfg=yellow")
	-- vim.cmd("hi Function guifg=yellow ctermfg=yellow")
end

return M
