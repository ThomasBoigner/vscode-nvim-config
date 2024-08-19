if not vim.g.vscode then
    local lsp = require('lsp-zero')
    local cmp = require('cmp')
    local mason = require('mason')
    local masonLspconfig = require('mason-lspconfig')
    local luasnip = require('luasnip')

    lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({buffer = bufnr})
    end)

    cmp.setup({
        sources = {
            {name = 'nvim_lsp'},
        },
        mapping = {
            ['<C-z>'] = cmp.mapping.confirm({select = false, behavior = cmp.ConfirmBehavior.Replace}),
            ['<C-n>'] = cmp.mapping.select_next_item({behavior = 'select'}),
            ['<C-p>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<C-Space>'] = cmp.mapping.complete(),
        },
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
    })

    mason.setup({})
    masonLspconfig.setup()
end
