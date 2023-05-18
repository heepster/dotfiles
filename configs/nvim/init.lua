require('core.util')
require("core.settings")
require("core.plugins")
require("core.theme")
require("core.key_mappings")

local lua_config_dir = vim.fn.stdpath('config') .. '/lua'
source_files_from_dir(lua_config_dir .. '/' .. 'plugin_config')
