return 
    { 'nvim-treesitter/nvim-treesitter', build = ':tsupdate', 
        config = function()
            local ts_config = require('nvim-treesitter.configs')
            ts_config.setup({
                ensure_installed = {'lua', 'javascript'},
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true }
            })
        end
    }
