local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = require("lsp-format").on_attach
local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

require('rust-tools').setup(opts)

-- require 'lspconfig'.rust_analyzer.setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     settings = {
--         ["rust-analyzer"] = {
--             assist = {
--                 importMergeBehavior = "last",
--                 importPrefix = "by_self",
--             },
--             diagnostics = {
--                 disabled = { "unresolved-import" }
--             },
--             cargo = {
--                 loadOutDirsFromCheck = true
--             },
--             procMacro = {
--                 enable = true
--             },
--             checkOnSave = {
--                 command = "clippy"
--             },
--         }
--     },
--     flags = lsp_flags,
-- }
