return function(use)
  use {
    's1n7ax/nvim-window-picker',
    tag = 'v1.*',
    config = function()
      require('window-picker').setup()
    end,
  }

  use { 'jose-elias-alvarez/null-ls.nvim' }

  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
  }

  use 'mrjones2014/smart-splits.nvim'

  -- Coloschemes
  use 'Mofiqul/dracula.nvim'
  use { 'kartikp10/noctis.nvim', requires = { 'rktjmp/lush.nvim' } }

  -- Plugin Setups
  require 'custom.config.neo-tree'()
  require 'custom.config.null-ls'()
end
