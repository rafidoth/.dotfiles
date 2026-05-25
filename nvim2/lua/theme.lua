local M = {}

M.setup = function()
	vim.opt.cursorline = true
	vim.o.termguicolors = true
	-- vim.o.background = "light"
	-- vim.cmd("colorscheme github_dark_high_contrast")
    -- vim.cmd("colorscheme tokyonight-night")
	-- vim.cmd("colorscheme tundra")
	-- vim.cmd("colorscheme cyberdream")
	-- vim.cmd("colorscheme gruvbox")
	-- vim.cmd("colorscheme unokai")
	-- vim.cmd("colorscheme alduin")
	-- vim.cmd("colorscheme thorn")
    -- vim.cmd("colorscheme gruber-darker")
    -- vim.cmd("colorscheme vesper")
	-- vim.cmd("colorscheme catppuccin-frappe")
	vim.cmd("colorscheme catppuccin-macchiato")
    -- setup must be called before loading
    -- vim.cmd.colorscheme "catppuccin-nvim"
    --

	vim.cmd("let g:netrw_banner=0")
	vim.cmd("let g:netrw_liststyle=3")
	vim.cmd("hi StatusLine guibg=NONE guifg=#d79921")
    -- color column at 80 color change
	-- vim.cmd("highlight ColorColumn ctermbg=black guibg=black")
	vim.api.nvim_set_hl(0, "Search", { bg = "#DAE84D", fg = "#000000" })
    
	-- vim.cmd("hi Normal guifg=white ctermfg=white")
	-- vim.cmd("hi LineNr guibg=NONE ctermbg=NONE ctermfg=Yellow guibg=NONE guifg=Yellow")
	vim.cmd("hi CursorLine guibg=NONE")
	vim.cmd("hi CursorLineNr guibg=NONE")
    vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver50,r-cr-o:hor20" 
	-- vim.cmd("hi String guifg=white ctermfg=white ")
	-- vim.cmd("hi Links guifg=white ctermfg=white")
	-- vim.cmd("hi Function guifg=white ctermfg=white")
	-- vim.cmd("hi Keyword guifg=white ctermfg=white")
	-- vim.cmd("hi Statement guifg=white ctermfg=white")
	-- vim.cmd("hi Type guifg=white ctermfg=white")
	--
	-- vim.cmd("hi Keyword guifg=yellow ctermfg=yellow")
	-- vim.cmd("hi Function guifg=yellow ctermfg=yellow")
    --
    -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    -- Optional: for other UI elements
    vim.api.nvim_set_hl(0, 'NonText', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
end

return M
