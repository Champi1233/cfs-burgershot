fx_version 'cerulean'
game 'gta5'

author 'Champi'
description 'Burgershot script til FiveM'
version '1.0.0'
lua54 'yes'

client_scripts {
    'config.lua',
    'client/main.lua'
}

server_scripts {
    'config.lua',
    'server/main.lua'
}

shared_scripts {'@es_extended/imports.lua','@ox_lib/init.lua'}