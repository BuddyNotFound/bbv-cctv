fx_version 'cerulean'
game 'gta5'
author 'bbv-cctv'
lua54 'yes'


client_scripts {
    'wrapper/cl_wrapper.lua',
    'wrapper/cl_wp_callback.lua',
    'client/cl_main.lua',
    'client/cl_ui.lua',
}

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}

server_scripts {
    'wrapper/sv_wrapper.lua',
    'wrapper/sv_wp_callback.lua',
    'server/server.lua'
}

--neen ui

ui_page 'web/index.html'

files {
	'web/**.*'
}