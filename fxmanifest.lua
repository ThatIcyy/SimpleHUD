fx_version 'cerulean'
game 'gta5'
 

 
lua54 'yes' 
 
shared_script { 
    '@qb-core/import.lua'
}
 
client_scripts {
    'client.lua'
}

files {
    'html/dist/index.html',
    'html/static/img/*.svg'
}

ui_page 'html/dist/index.html'

dependency 'qb-core'
