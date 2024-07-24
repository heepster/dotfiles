return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp"
    },
    config = function(ls, opts)
        require("mason").setup()
   	require("mason-lspconfig").setup {
		ensure_installed = {
			-- typescript
			"tsserver",
			"biome",

			-- golang
			"gopls",
			"golangci_lint_ls",

			-- lua
			"lua_ls",
		}
	}

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
	local lspconfig = require("lspconfig")

	local servers = {
		'tsserver',
		'biome',
		'gopls',
		'golangci_lint_ls',
		'lua_ls',
	}

        for _, lsp in ipairs(servers) do
            lspconfig[lsp].setup {
              capabilities = capabilities,
            }
        end
    end
}
