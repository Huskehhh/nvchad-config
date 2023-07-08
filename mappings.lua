---@type MappingsTable
local M = {}

M.general = {
	n = {
		["<leader><tab>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle Nvim Tree" },
		["<leader>u"] = { "<cmd> UndotreeToggle <CR>", "Toggle Undo Tree" },
	},
}

return M
