return {
    "neovim/nvim-lspconfig",
    -- event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        require("lspconfig.ui.windows").default_options.border = "rounded"
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        vim.diagnostic.config({
            update_in_insert = true,
        })
        vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, {})
        vim.keymap.set("n", "gD", vim.lsp.buf.definition, {})
        vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", {})
        vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", {})
        vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", {})
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- if only default config is needed:
        local lsps_default = { 
            "lua_ls",
            "html",
            "tsserver",
            "cssls",
            "eslint",
            "svelte",
            "pyright",
            "ruff_lsp",
            "clangd"
        }
        for _, lsp in pairs(lsps_default) do
            lspconfig[lsp].setup({ capabilities = capabilities })
        end
    end,
}
