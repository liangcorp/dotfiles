require('lualine').setup {
    sections = {
        lualine_b = {
            {'branch'},
            {'diff'},
            {'diagnostics', sources={ 'coc' }}
        }
    }
}
-- require('lualine').setup {}

