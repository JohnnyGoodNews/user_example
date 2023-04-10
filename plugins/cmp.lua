return { -- override nvim-cmp plugin
  "hrsh7th/nvim-cmp",
  -- override the options table that is used in the `require("cmp").setup()` call
  opts = function(_, opts)
    -- opts parameter is the default options table
    -- the function is lazy loaded so cmp is able to be required
    local cmp = require "cmp"
    -- modify the mapping part of the table
    opts.mapping["<C-x>"] = cmp.mapping.select_next_item()

    opts.mapping["<Tab>"] = nil

    opts.mapping["<Up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select }
    opts.mapping["<Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select }
    opts.mapping["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert }
    opts.mapping["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }
    opts.mapping["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert }
    opts.mapping["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }
    -- scroll up/down
    opts.mapping["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" })
    opts.mapping["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" })
    -- trigger autocompletion
    opts.mapping["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" })
    -- Yes: Accept the currently selected match and stop completion.
    opts.mapping["<C-y>"] = cmp.config.disable
    -- End completion, go back to what was there before selecting a match (what was typed or longest common string).
    -- 
    opts.mapping["<C-e>"] = cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close() }
    -- confirm
    opts.mapping["<CR>"] = cmp.mapping.confirm { select = false }
    -- cycle forward
    opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" })
    -- cycle backwards
    opts.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" })
    -- return the new table to be used
    return opts
  end,
}
