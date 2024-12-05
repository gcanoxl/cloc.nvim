---@class ClocProjectConfig
---@field pattern string
---@field include string[]

---@class ClocConfig
---@field program string
---@field projects ClocProjectConfig[]
---@field autocmds string[]

---@type ClocConfig
local default = {
	program = "gocloc",
	-- order matters, the more specific should be first
	projects = {
		-- flutter project
		{
			pattern = "pubspec.yaml",
			include = { "lib" },
		},
		-- project managed by git
		{
			pattern = ".git",
			include = { "." },
		},
	},
	autocmds = { "BufWritePost" }, -- or nil, nil indicates no autocmd will be set
}

local M = {}

---@type ClocConfig
---@diagnostic disable-next-line: missing-fields
M.options = {}

function M.setup(config)
	M.options = vim.tbl_extend("force", default, config or {})
end

return M
