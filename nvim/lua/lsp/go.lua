lspconfig = require "lspconfig"
util = require "lspconfig/util"
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.gopls.setup{
	on_attach = on_attach,
    capabilities = capabilities,
	flags=lsp_flags,
	cmd = {'gopls', 'serve'},
	filetypes = {"go", "gomod", "gowork", "gotmpl"},
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	single_file_support = true,
	-- for postfix snippets and analyzers
	capabilities = capabilities,
	    settings = {
	      gopls = {
		      experimentalPostfixCompletions = true,
		      analyses = {
                fieldalignment = true,
		        unusedparams = true,
		        shadow = true,
		     },
		     staticcheck = true,
		    },
	    },
}

function go_org_imports(wait_ms)
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
  end
