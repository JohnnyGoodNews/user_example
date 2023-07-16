return {
  'projekt0n/github-nvim-theme',
  --version = 'v0.0.7',
  config = function()
    require('github-theme').setup({
      -- ...
    })

    -- vim.cmd('colorscheme github_dark')
  end
}
