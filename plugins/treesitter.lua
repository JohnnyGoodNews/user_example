return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
      -- "lua"
    })
    opts.textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          -- ["ak"] = { },
          -- ["ik"] = { },
          -- ["ac"] = { },
          -- ["ic"] = { },
          -- ["a?"] = { },
          -- ["i?"] = { },
          -- ["af"] = { },
          -- ["if"] = { },
          -- ["al"] = { },
          -- ["il"] = { },
          -- ["aa"] = { },
          -- ["ia"] = { },
          ["fk"] = { query = "@block.outer", desc = "around block" },
          ["sk"] = { query = "@block.inner", desc = "inside block" },
          ["fc"] = { query = "@class.outer", desc = "around class" },
          ["sc"] = { query = "@class.inner", desc = "inside class" },
          ["f?"] = { query = "@conditional.outer", desc = "around conditional" },
          ["s?"] = { query = "@conditional.inner", desc = "inside conditional" },
          ["ff"] = { query = "@function.outer", desc = "around function " },
          ["sf"] = { query = "@function.inner", desc = "inside function " },
          ["fl"] = { query = "@loop.outer", desc = "around loop" },
          ["sl"] = { query = "@loop.inner", desc = "inside loop" },
          ["fa"] = { query = "@parameter.outer", desc = "around argument" },
          ["sa"] = { query = "@parameter.inner", desc = "inside argument" },
        },
      },
    }
  end,
}
