fx_version 'bodacious'
games { 'gta5' }

author 'VojtaN'
description 'VXRP Multipack'
version '1.0.1'

client_script "client/*.lua"

server_script { "server/*.lua",
                "server.lua",
                "update_checker.lua"
              }

shared_script 'config.lua'
