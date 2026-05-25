---@type vim.lsp.Config
local util = require("lspconfig.util")

return {
    cmd = { "lua-language-server" },

    filetypes = { "lua" },

    root_dir = util.root_pattern(".git", "init.lua"),

    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }, -- recognize the global 'vim'
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true), -- make LSP aware of Neovim runtime
                checkThirdParty = false,
            },
            telemetry = { enable = false },
            completion = {
                callSnippet = "Replace",
            },
        },
    },
}
