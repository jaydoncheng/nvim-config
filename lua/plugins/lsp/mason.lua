return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
            ui = {
                    border = "rounded",
                    height = 0.8,
                },
            })
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "tsserver",
                    "html",
                    "cssls",
                    "pyright",
                    "clangd"
                },

                automatic_installation = true,
            })
        end
    },
}
