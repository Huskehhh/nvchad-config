local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local inlayhints = require("lsp-inlayhints")
local lspconfig = require("lspconfig")

local servers = { "html", "cssls", "tsserver", "clangd", "rust_analyzer", "pyright" }

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
