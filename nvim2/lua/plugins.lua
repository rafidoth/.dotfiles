local M = {}

M.setup = function()

	require("paq")({
		"savq/paq-nvim", -- Let Paq manage itself
		{ "neovim/nvim-lspconfig" },
		{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "MunifTanjim/nui.nvim" },
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope.nvim" },
		{ "stevearc/conform.nvim" },
		{ "nvim-tree/nvim-web-devicons" },
		{ "akinsho/bufferline.nvim" },
		{ "nvim-mini/mini.bufremove" },
		{ "chrisgrieser/nvim-origami" },
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "shaunsingh/nord.nvim" },
		{ "folke/snacks.nvim" },
		-- { "folke/noice.nvim" },
		{ "ring0-rootkit/ring0-dark.nvim" },
		{ "navarasu/onedark.nvim" },
		{ "projekt0n/github-nvim-theme" },
		{ "scottmckendry/cyberdream.nvim" },
		{ "maxmx03/solarized.nvim" },
		{ "blazkowolf/gruber-darker.nvim" },
		{ "sam4llis/nvim-tundra" },
        { "ellisonleao/gruvbox.nvim" },
        {"tpope/vim-fugitive"},
        {"folke/tokyonight.nvim"},
        {"bakageddy/alduin.nvim"},
        { "sphamba/smear-cursor.nvim"},
        {"karb94/neoscroll.nvim"},
        {"sudo-tee/opencode.nvim"},
        {"catppuccin/nvim"},
        { "nvim-neo-tree/neo-tree.nvim"},
        {"rmagatti/auto-session"},
        {'datsfilipe/vesper.nvim'},
        {"jpwol/thorn.nvim"},

	})

    require("thorn").setup({
        transparent = true,
    })


    require("neo-tree").setup({
      filesystem = {
        follow_current_file = {
          enabled = true,               -- This will find and focus the file in the active buffer every time
                                         -- the current file is changed while the tree is open.
          leave_dirs_open = false,      -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
      },
    })
    require("auto-session").setup({})

    require("catppuccin").setup({
        flavour = "auto", -- latte, frappe, macchiato, mocha
        background = { -- :h background
            light = "latte",
            dark = "frappe",
        },
        transparent_background = true, -- disables setting the background color.
        float = {
            transparent = true, -- enable transparent floating windows
            solid = false, -- use solid styling for floating windows, see |winborder|
        },
        term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
            enabled = false, -- dims the background color of inactive window
            shade = "dark",
            percentage = 0.0, -- percentage of the shade to apply to the inactive window
        },
        no_italic = false, -- Force no italic
        no_bold = false, -- Force no bold
        no_underline = false, -- Force no underline
        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
            comments = { "italic" }, -- Change the style of comments
            conditionals = { "italic" },
            loops = {},
            functions = {},
            keywords = {},
            strings = {},
            variables = {},
            numbers = {},
            booleans = {},
            properties = {},
            types = {},
            operators = {},
            -- miscs = {}, -- Uncomment to turn off hard-coded styles
        },
        lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
                ok = { "italic" },
            },
            underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
                ok = { "underline" },
            },
            inlay_hints = {
                background = true,
            },
        },
        color_overrides = {},
        custom_highlights = {},
        default_integrations = true,
        auto_integrations = false,
        integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            notify = false,
            mini = {
                enabled = true,
                indentscope_color = "",
            },
            -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
    })


    require('opencode').setup({
      server = {
        url = 'localhost',     -- or 'http://192.168.1.100'
        port = nil,
        timeout = 5,
      },
      keymap = {
          editor = {
            ['<leader>oa'] = { 'toggle' },
            ['<leader>os'] = { 'add_visual_selection', mode = {'v'} },
            ['<leader>oi'] = { 'add_visual_selection_inline', mode = {'v'} },
            ['<leader>on'] = { 'open_input_new_session' },
            ['<leader>oq'] = { 'close' }, 
            ['<leader>oS'] = { 'select_session' }, 
            ['<leader>or'] = { 'rename_session' },
            ['<leader>op'] = { 'configure_provider' },
            ['<leader>oV'] = { 'configure_variant' }
          }
      },
      ui = {
        questions = {
          use_vim_ui_select = true, 
        },
        input = {
          min_height = 0.25, 
          max_height = 0.50, 
          text = {
            wrap = true, 
          },
          auto_hide = true,
        },
      }


    })


    require('smear_cursor').setup({})
    require('neoscroll').setup({
    mappings = {
        '<C-u>', '<C-d>',
        '<C-y>',
        'zt', 'zz', 'zb',
      },
    })


    require("tokyonight").setup({
     styles = {
        comments = { italic = false },
        keywords = { italic = false},
        functions = {italic = false },
        variables = {italic = false },
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "dark", -- style for sidebars, see below
        floats = "dark", -- style for floating windows
      },
      on_highlights = function(hl, c)
        local prompt = "#2d3149"
        hl.TelescopeNormal = {
          bg = c.bg_dark,
          fg = c.fg_dark,
        }
        hl.TelescopeBorder = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopePromptNormal = {
          bg = prompt,
        }
        hl.TelescopePromptBorder = {
          bg = prompt,
          fg = prompt,
        }
        hl.TelescopePromptTitle = {
          bg = prompt,
          fg = prompt,
        }
        hl.TelescopePreviewTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopeResultsTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
      end,
    })

    

    require("gruvbox").setup({
        transparent_mode = true,
        bold = false,
        italic = {
            strings = false,
            emphasis = false,
            comments = false,
            operators = false,
            folds = false,
        },
    })

    require('nvim-tundra').setup({
      transparent_background = true,
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

	-- require("noice").setup({
	-- 	cmdline = {
	-- 		view = "cmdline",
	-- 	},
	-- 	presets = {
	-- 		bottom_search = true,
	-- 		command_palette = true,
	-- 		long_message_to_split = true,
	-- 		inc_rename = true,
	-- 	},
	-- })


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

    -- local bufferline = require("bufferline")
    --
    -- bufferline.setup({
    --     options = {
    --         mode = "buffers",
    --         style_preset = bufferline.style_preset.minimal, 
    --         themable = false,
    --         numbers = "none",
    --         buffer_close_icon = "󰅖",
    --         modified_icon = "●",
    --         close_icon = "",
    --         color_icons = true,
    --         show_buffer_icons = true,
    --         show_buffer_close_icons = true,
    --         show_close_icon = false,
    --         show_tab_indicators = true,
    --         indicator = {
    --             style = "underline",
    --         },
    --         diagnostics = "nvim_lsp",
    --         diagnostics_indicator = function(count)
    --             return "(" .. count .. ")"
    --         end,
    --         hover = {
    --             enabled = true,
    --             delay = 150,
    --             reveal = { "close" },
    --         },
    --         -- FIX: Correct spelling of separator
    --         separator_style = { "", "" }, 
    --         sort_by = "insert_at_end",
    --     },
    --     highlights = {
    --         -- Note: You had duplicate 'buffer_selected' keys in your snippet.
    --         -- I have combined them here.
    --         fill = {
    --             bg = "NONE",
    --         },
    --         background = {
    --             bg = "NONE",
    --         },
    --         separator = {
    --             fg = "gray", 
    --             bg = "NONE",
    --         },
    --         separator_visible = {
    --             bg = "NONE",
    --         },
    --         separator_selected = {
    --             bg = "NONE",
    --         },
    --         buffer_visible = {
    --             bg = "NONE",
    --         },
    --         buffer_selected = {
    --             bg = "NONE",
    --             bold = true,
    --             italic = true,
    --         },
    --         -- Other highlights
    --         error_selected = { italic = false, bg = "NONE" },
    --         warning_selected = { italic = false, bg = "NONE" },
    --         info_selected = { italic = false, bg = "NONE" },
    --         hint_selected = { italic = false, bg = "NONE" },
    --     },
    -- })

    local highlights = {
        "BufferLineFill",
        "BufferLineBackground",
        "BufferLineSeparator",
        "BufferLineSeparatorSelected",
        "BufferLineSeparatorVisible",
        "BufferLineBufferSelected",
        "BufferLineBufferVisible",
    }

    for _, group in ipairs(highlights) do
        -- Get existing highlight to keep the foreground color (text color)
        local hl = vim.api.nvim_get_hl(0, { name = group })
        -- Update background to NONE
        hl.bg = "NONE"
        hl.ctermbg = "NONE"
        -- Apply the change
        vim.api.nvim_set_hl(0, group, hl)
    end

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

	-- require("nvim-treesitter.configs").setup({
	-- 	ensure_installed = { "go", "lua", "vimdoc", "query", "javascript", "prisma" },
	-- 	highlight = {
	-- 		enable = true,
	-- 	},
	-- 	-- Other configurations like indent, etc.
	-- })

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
