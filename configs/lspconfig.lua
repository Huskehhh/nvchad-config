local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local inlayhints = require("lsp-inlayhints")
local lspconfig = require("lspconfig")

local servers = {
	"clangd",
	"rust_analyzer",
	"pyright",
	"html",
	"cssls",
	"tsserver",
	"svelte",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = function(client, bufnr)
			on_attach(client, bufnr)
			inlayhints.on_attach(client, bufnr)
		end,
		capabilities = capabilities,
	})
end

-- Overwrite the rust-analyzer settings so we can enable clippy instead of cargo check.
lspconfig["rust_analyzer"].setup({
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		inlayhints.on_attach(client, bufnr)
	end,
	settings = {
		["rust-analyzer"] = {
			check = {
				command = "clippy",
			},
		},
	},
	capabilities = capabilities,
})

vim.keymap.set("n", "<leader>fm", function()
	vim.lsp.buf.format({ async = false })
end)
vim.keymap.set("v", "<leader>fm", function()
	vim.lsp.buf.format({ async = false })
end)
