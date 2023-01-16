UTILS = {}

function UTILS.is_available(plugin) return packer_plugins ~= nil and packer_plugins[plugin] ~= nil end

require("utils.defaults")

