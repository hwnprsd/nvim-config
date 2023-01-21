return function(use)
  use {
    's1n7ax/nvim-window-picker',
    tag = 'v1.*',
    config = function()
      require('window-picker').setup()
    end,
  }

  -- Null LS
  use { 'jose-elias-alvarez/null-ls.nvim' }

  -- Tree
  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
  }

  -- Splits TMUX
  use 'mrjones2014/smart-splits.nvim'

  -- Auto Pairs for quotes and brackets
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
    end,
  }
  -- Dashboard
  use { 'glepnir/dashboard-nvim' }

  -- Center text
  use { 'shortcuts/no-neck-pain.nvim', tag = '*' }

  -- Some golang stuff
  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua'

  use {
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require('which-key').setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  }
  -- Coloschemes
  use 'Mofiqul/dracula.nvim'
  use { 'colevoss/nvimpire' }
  use { 'kartikp10/noctis.nvim', requires = { 'rktjmp/lush.nvim' } }

  -- Plugin Setups
  require 'custom.config.neo-tree'()
  require 'custom.config.null-ls'()
  require('go').setup()
  require 'custom.config.nvimpire'()
end
