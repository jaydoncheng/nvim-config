return {
    'NvChad/nvim-colorizer.lua',
    config = function ()
        require('colorizer').setup({
            filetypes = {
                css = { css = true },
                'javascript',
                html = { names = false}
            },
        })
    end
}
