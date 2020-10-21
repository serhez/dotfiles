lua << EOF

local lsp_status = require('lsp-status')
local nvim_lsp = require('nvim_lsp')

lsp_status.register_progress()

local attach_hook = function(client)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    require'completion'.on_attach(client)
    require'diagnostic'.on_attach(client)
    require'lsp-status'.on_attach(client)

    local opts = { noremap=true, silent=true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lS', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lk', '<cmd>lua vim.lsp.buf.help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ld', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>le', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gW', '<cmd>lua vim.lsp.buf.workplace_symbol()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[c', ':PrevDiagnosticCycle<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']c', ':NextDiagnosticCycle<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lt', "<cmd>lua require'lsp_extensions'.inlay_hints()<CR>", opts)
end

-- local default_config_servers = {
--     'bashls',
--     'clangd',
--     'cmake',
--     'cssls',
--     'diagnosticls',
--     'dockerls',
--     'hls',
--     'html',
--     'jdtls',
--     'jsonls',
--     'omnisharp',
--     'pyls_ms',
--     'sourcekit',
--     'sqlls',
--     'sumneko_lua',
--     'texlab',
--     'tsserver',
--     'vimls',
-- }

-- for _, lsp in ipairs(default_config_servers) do
--     nvim_lsp[lsp].setup {
--         on_attach = attach_hook,
--         capabilities = lsp_status.capabilities,
--     }
-- end

nvim_lsp.bashls.setup({
    -- callbacks = lsp_status.extensions.bashls.setup(),
    on_attach = attach_hook,
    capabilities = lsp_status.capabilities
})

nvim_lsp.clangd.setup({
    filetypes = { "c", "cpp", "h", "hpp", "tpp", "objc", "objcpp" },
    callbacks = lsp_status.extensions.clangd.setup(),
    init_options = {
        clangdFileStatus = true
    },
    on_attach = attach_hook,
    capabilities = lsp_status.capabilities
})

nvim_lsp.cmake.setup({
    -- callbacks = lsp_status.extensions.cmake.setup(),
    on_attach = attach_hook,
    capabilities = lsp_status.capabilities
})

nvim_lsp.cssls.setup({
    -- callbacks = lsp_status.extensions.cssls.setup(),
    on_attach = attach_hook,
    capabilities = lsp_status.capabilities
})

nvim_lsp.diagnosticls.setup({
    -- callbacks = lsp_status.extensions.diagnosticls.setup(),
    on_attach = attach_hook,
    capabilities = lsp_status.capabilities
})

nvim_lsp.dockerls.setup({
    -- callbacks = lsp_status.extensions.dockerls.setup(),
    on_attach = attach_hook,
    capabilities = lsp_status.capabilities
})

nvim_lsp.hls.setup({
    -- callbacks = lsp_status.extensions.hls.setup(),
    on_attach = attach_hook,
    capabilities = lsp_status.capabilities
})

nvim_lsp.html.setup({
    -- callbacks = lsp_status.extensions.html.setup(),
    on_attach = attach_hook,
    capabilities = lsp_status.capabilities
})

nvim_lsp.jdtls.setup({
    -- callbacks = lsp_status.extensions.jdtls.setup(),
    on_attach = attach_hook,
    capabilities = lsp_status.capabilities
})

nvim_lsp.jsonls.setup({
    -- callbacks = lsp_status.extensions.jsonls.setup(),
    on_attach = attach_hook,
    capabilities = lsp_status.capabilities
})

nvim_lsp.omnisharp.setup({
    -- callbacks = lsp_status.extensions.omnisharp.setup(),
    on_attach = attach_hook,
    capabilities = lsp_status.capabilities
})

nvim_lsp.pyls_ms.setup({
    callbacks = lsp_status.extensions.pyls_ms.setup(),
    on_attach = attach_hook,
    capabilities = lsp_status.capabilities
})

nvim_lsp.sourcekit.setup({
    -- callbacks = lsp_status.extensions.sourcekit.setup(),
    on_attach = attach_hook,
    capabilities = lsp_status.capabilities
})

nvim_lsp.sqlls.setup({
    -- callbacks = lsp_status.extensions.sqlls.setup(),
    on_attach = attach_hook,
    capabilities = lsp_status.capabilities
})

nvim_lsp.sumneko_lua.setup({
    -- callbacks = lsp_status.extensions.sumneko_lua.setup(),
    on_attach = attach_hook,
    capabilities = lsp_status.capabilities
})

nvim_lsp.texlab.setup({
    -- callbacks = lsp_status.extensions.texlab.setup(),
    on_attach = attach_hook,
    capabilities = lsp_status.capabilities
})

nvim_lsp.tsserver.setup({
    -- callbacks = lsp_status.extensions.tsserver.setup(),
    on_attach = attach_hook,
    capabilities = lsp_status.capabilities
})

nvim_lsp.vimls.setup({
    -- callbacks = lsp_status.extensions.vimls.setup(),
    on_attach = attach_hook,
    capabilities = lsp_status.capabilities
})

EOF

