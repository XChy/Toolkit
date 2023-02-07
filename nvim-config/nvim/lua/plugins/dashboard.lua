require('dashboard').setup {
    theme = 'doom',
    config = {
        --header = {}, --your header
        center = {
            {
                desc = 'Projects',
                key = 'p',
                key_hl = 'Number',
                action = 'Telescope project'
            },
            {
                desc = 'Old Files',
                key = 'o',
                keymap = 'SPC f f',
                key_hl = 'Number',
                action = 'Telescope oldfiles'
            },
            {
                desc = 'Find Files',
                key = 'f',
                keymap = 'SPC f f',
                key_hl = 'Number',
                action = 'Telescope find_files'
            },
            {
                desc = 'Last Session',
                key = 'l',
                action = 'SessionManager load_last_session'
            },
            {
                desc = 'Edit Config',
                key = 'c',
                action = 'EditMyConfig'
            },
            {
                desc = 'Edit Blog',
                key = 'b',
                action = 'EditMyBlog'
            },
        },
        --footer = {} --your footer
    }
}
