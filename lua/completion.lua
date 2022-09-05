vim.opt.completeopt = {"menu", "menuone", "noselect"}

local lspkind = require('lspkind')
local cmp = require("cmp")

cmp.setup({
  mapping = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.close(),
    ["<c-y>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
    ['<CR>']    = cmp.mapping.confirm({select = true}),
    ['<Up>']    = cmp.mapping.select_prev_item(select_opts),
    ['<Down>']  = cmp.mapping.select_next_item(select_opts),

    -- If the completion menu is visible, move to the next item.
    -- If the line is "empty", insert a Tab character.
    -- If the cursor is inside a word, trigger the completion menu.
    ['<Tab>'] = cmp.mapping(function(fallback)
      local col = vim.fn.col('.') - 1
    
      if cmp.visible() then
        cmp.select_next_item(select_opts)
      elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        fallback()
      else
        cmp.complete()
      end
    end, {'i', 's'}),

    -- If the completion menu is visible, move to the previous item.
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item(select_opts)
      else
        fallback()
      end
    end, {'i', 's'}),
  },

  sources = {
    { name = "nvim_lua" },
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "buffer", keyword_length = 5 },
  },

  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text", 
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
    }),
  },

  experimental = {
    ghost_text = true,
  },

  --window = {
  --  documentation = cmp.config.window.bordered()
  --},
})
