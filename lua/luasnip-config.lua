local ls = require "luasnip"
local types = require "luasnip.util.types"

ls.config.set_config {
  -- Tells LuaSnip to remember to keep around the last snippet.
  history = true,

  updateevents = "TextChanged,TextChangedI",

  -- Autosnippets:
  enable_autosnippets = true,
}

-- This will empand the current item or jump to the next item within the snippet
vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true})
