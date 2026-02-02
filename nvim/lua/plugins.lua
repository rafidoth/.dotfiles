local M = {}

M.setup = function()
	require("paq")({
		"savq/paq-nvim", -- Let Paq manage itself
		{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
		{ "MunifTanjim/nui.nvim" },
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope.nvim" },
		{ "github/copilot.vim" },
		{ "stevearc/conform.nvim" },
		{ "nvim-tree/nvim-web-devicons" },
		{ "akinsho/bufferline.nvim" },
		{ "neovim/nvim-lspconfig" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "nvim-mini/mini.bufremove" },
		{ "chrisgrieser/nvim-origami" },
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "shaunsingh/nord.nvim" },
		{ "folke/snacks.nvim" },
		{ "NickvanDyke/opencode.nvim" },
		{ "folke/noice.nvim" },
		{ "ring0-rootkit/ring0-dark.nvim" },
		{ "navarasu/onedark.nvim" },
		{ "projekt0n/github-nvim-theme" },
		{ "scottmckendry/cyberdream.nvim" },
		{ "maxmx03/solarized.nvim" },
		{ "blazkowolf/gruber-darker.nvim" },
		{ "sam4llis/nvim-tundra" },
		{ "mistweaverco/kulala.nvim" },
	})

	require("kulala").setup({
		global_keymaps = true,
		global_keymaps_prefix = "<leader>R",
		kulala_keymaps_prefix = "",
	})

	require("gruber-darker").setup({
		bold = false,
		invert = {
			signs = false,
			tabline = false,
			visual = false,
		},
		italic = {
			strings = false,
			comments = false,
			operators = false,
			folds = false,
		},
		undercurl = true,
		underline = true,
	})

	require("noice").setup({
		cmdline = {
			view = "cmdline",
		},
		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = true,
			inc_rename = true,
		},
	})

	local oc = require("opencode")
	vim.o.autoread = true

	local cmp = require("cmp")
	cmp.setup({
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
		}),
		mapping = cmp.mapping.preset.insert({
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<C-n>"] = cmp.mapping.select_next_item(), -- Next suggestion
			["<C-p>"] = cmp.mapping.select_prev_item(), -- Previous suggestion
		}),

		window = {
			completion = cmp.config.window.bordered(),
		},
	})
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local on_attach = function(client, bufnr)
		-- This sets the LSP source on the current buffer when the server attaches
		require("cmp").setup.buffer({
			sources = {
				{ name = "nvim_lsp" },
			},
		}, { buffer = bufnr })
	end

	-- Default options:
	require("origami").setup({
		pauseFoldsOnSearch = true,
		foldtext = {
			enabled = true,
			padding = 3,
			lineCount = {
				template = "%d lines", -- `%d` is replaced with the number of folded lines
				hlgroup = "Comment",
			},
			diagnosticsCount = true, -- uses hlgroups and icons from `vim.diagnostic.config().signs`
			gitsignsCount = true, -- requires `gitsigns.nvim`
			disableOnFt = { "snacks_picker_input" }, ---@type string[]
		},
		foldKeymaps = {
			setup = true, -- modifies `h`, `l`, `^`, and `$`
			closeOnlyOnFirstColumn = false, -- `h` and `^` only close in the 1st column
			scrollLeftOnCaret = false, -- `^` should scroll left (basically mapped to `0^`)
		},
	})
	require("mini.bufremove").setup({}) -- use default config

	local bufferline = require("bufferline")

	bufferline.setup({
		options = {
			mode = "buffers",
			style_preset = minimal,
			themable = false,

			numbers = "none",

			buffer_close_icon = "󰅖",
			modified_icon = "●",
			close_icon = "",

			color_icons = true,
			show_buffer_icons = true,
			show_buffer_close_icons = true,
			show_close_icon = false,
			show_tab_indicators = true,
			indicator = {
				style = "underline",
			},

			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count)
				return "(" .. count .. ")"
			end,
			hover = {
				enabled = true,
				delay = 150,
				reveal = { "close" },
			},
			seperator_style = { " ", " " },
			sort_by = "insert_at_end",
		},
	})

	vim.keymap.set("n", "<leader>b", function()
		if vim.o.showtabline == 0 then
			vim.o.showtabline = 2
		else
			vim.o.showtabline = 0
		end
	end, { silent = true })

	require("conform").setup({
		formatters_by_ft = {
			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			json = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			lua = { "stylua" },
		},
		format_on_save = {
			lsp_fallback = true,
			async = false, -- Set to true for asynchronous formatting
			timeout_ms = 500,
		},
	})

	require("nvim-treesitter.configs").setup({
		ensure_installed = { "go", "lua", "vimdoc", "query", "javascript", "prisma" },
		highlight = {
			enable = true,
		},
		-- Other configurations like indent, etc.
	})

	require("telescope").setup({
		defaults = {
			file_ignore_patterns = {
				"^node_modules/", -- Ignores the node_modules directory at the root and its contents
				".git/", -- Optionally, ignore the .git directory as well
				-- Add other patterns here as needed, e.g., '%.log', 'build/'
			},
		},
	})

	-- lsp diagnostic
	vim.diagnostic.config({ virtual_text = true })

	require("mason").setup()
	require("mason-lspconfig").setup({
		ensure_installed = { "lua_ls", "gopls", "ts_ls" },
		automatic_installation = true,

		-- This 'handlers' block is the key to loading your custom configs
		handlers = {
			-- Default handler for any server *not* handled specifically below.
			-- It uses the standard lspconfig.setup({})
			function(server_name)
				require("lspconfig")[server_name].setup({})
			end,
			function(server_name)
				require("lspconfig")[server_name].setup({
					-- 1. Tells the server to include completion capabilities
					capabilities = cmp_nvim_lsp.default_capabilities(),
					-- 2. Executes our minimal setup when the server starts
					on_attach = on_attach,
				})
			end,

			-- Custom Handler for All Your Servers (gopls, lua_ls, ts_ls)
			-- This logic tries to load your separate config file for the server.
			["gopls"] = function()
				-- We assume your config is at e.g., require("gopls") if in your root lua folder.
				-- If your file is /home/rafi/.config/nvim/lua/lspconfig/gopls.lua,
				-- you would use: local config = require("lspconfig.gopls")
				local config = require("gopls")
				require("lspconfig").gopls.setup(config)
			end,

			["lua_ls"] = function()
				local config = require("lua_ls")
				require("lspconfig").lua_ls.setup(config)
			end,

			["ts_ls"] = function()
				-- You need to create a ts_ls.lua file for this to work,
				-- or use the default setup if you don't have one.
				local config_exists, config = pcall(require, "ts_ls")
				if config_exists then
					require("lspconfig").ts_ls.setup(config)
				else
					-- Fallback to a basic setup for ts_ls if the file isn't found
					require("lspconfig").ts_ls.setup({
						root_dir = require("lspconfig.util").root_pattern(
							"tsconfig.json",
							"jsconfig.json",
							"package.json"
						),
						settings = { typescript = { hostInfo = "neovim" } },
					})
				end
			end,
		},
	})
end
return M
