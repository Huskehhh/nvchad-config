local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},

	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup()
		end,
		lazy = false,
	},

	{
		"ThePrimeagen/harpoon",
		config = function()
			require("custom.configs.harpoon")
		end,
		lazy = false,
	},

	{
		"mbbill/undotree",
		lazy = false,
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		lazy = false,
		config = function()
			require("treesitter-context").setup()
		end,
	},

	{
		"saecki/crates.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = false,
		config = function()
			require("crates").setup()
		end,
	},

	{
		"williamboman/mason.nvim",
		opts = { ensure_installed = overrides.mason.ensure_installed },
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = { ensure_installed = overrides.treesitter.ensure_installed },
	},

	{
		"simrat39/inlay-hints.nvim",
		config = function()
			require("inlay-hints").setup()
		end,
		lazy = false,
	},
}

return plugins
