return { 
  "folke/which-key.nvim",
  opts = function(_, opts)
    opts.plugins = {
      presets = {
        operators = false,
        motions = false,
      },
    }
  end,
}
