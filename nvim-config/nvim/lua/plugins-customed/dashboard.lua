require('dashboard').setup {
    theme = 'doom',
    config = {
        --header = {}, --your header
        center = {
            {
                icon = '  ',
                desc = 'Projects',
                key = 'p',
                key_hl = 'Number',
                action = 'Telescope project'
            },
            {
                icon = '📂 ',
                desc = 'Old Files',
                key = 'o',
                keymap = 'SPC f f',
                key_hl = 'Number',
                action = 'Telescope oldfiles'
            },
            {
                icon = '📂 ',
                desc = 'Find Files',
                key = 'f',
                keymap = 'SPC f f',
                key_hl = 'Number',
                action = 'Telescope find_files'
            },
            {
                icon = '🚀 ',
                desc = 'Last Session',
                key = 'l',
                action = 'SessionManager load_last_session'
            },
            {
                icon = '🛠 ',
                desc = 'Edit Config',
                key = 'c',
                action = 'EditMyConfig'
            },
            {
                icon = '📄 ',
                desc = 'Edit Blog',
                key = 'b',
                action = 'HexoOpen'
            },
        },
        --footer = {} --your footer
    }
}
