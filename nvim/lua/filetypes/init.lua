local function merge_filetype_maps(target, source)
	for filetype, tools in pairs(source or {}) do
		target[filetype] = tools
	end
end

local function module_names()
	local dir = vim.fn.stdpath("config") .. "/lua/filetypes"
	local modules = {}

	for name, type in vim.fs.dir(dir) do
		if type == "file" and name ~= "init.lua" and name:sub(-4) == ".lua" then
			table.insert(modules, name:sub(1, -5))
		end
	end

	table.sort(modules)

	return modules
end

local config = {
	mason = {},
	formatters = {},
	linters = {},
}

for _, name in ipairs(module_names()) do
	local module = require("filetypes." .. name)

	for _, tool in ipairs(module.mason or {}) do
		if not vim.tbl_contains(config.mason, tool) then
			table.insert(config.mason, tool)
		end
	end

	merge_filetype_maps(config.formatters, module.formatters)
	merge_filetype_maps(config.linters, module.linters)
end

return config
