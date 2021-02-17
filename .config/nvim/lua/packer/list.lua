local M = {}

function M.load_plugins()
  return {
    { repo = 'christianchiarulli/nvcode-color-schemes.vim' },
    { repo = 'norcalli/nvim-colorizer.lua' },
    { repo = 'tpope/vim-fugitive' },
    { repo = 'b3nj5m1n/kommentary' },
    { repo = 'mbbill/undotree' },
    { repo = 'tjdevries/lsp_extensions.nvim' },
    { repo = 'glepnir/lspsaga.nvim' },
    { repo = 'onsails/lspkind-nvim' },
    { repo = 'tweekmonster/startuptime.vim', cmd = "StartupTime" },
    { repo = 'kyazdani42/nvim-tree.lua' },
    { repo = 'nvim-telescope/telescope-packer.nvim' },
    { repo = 'nvim-telescope/telescope-fzy-native.nvim' },
    { repo = 'glepnir/dashboard-nvim' },
    {
      repo = 'airblade/vim-rooter',
      config = function() require 'plugin.rooter' end
    },
    {
      repo = 'glacambre/firenvim',
      run = function() vim.fn['firenvim#install'](0) end
    },
    {
      repo = 'mattn/emmet-vim',
      config = function() require 'plugin.emmet' end
    },
    {
      repo = "akinsho/nvim-bufferline.lua",
      config = function() require 'plugin.bufferline' end
    },
    {
      repo = "hrsh7th/nvim-compe",
      config = function() require 'plugin.compe' end
    },
    {
      repo = 'windwp/nvim-autopairs',
      config = function() require 'plugin.autopairs' end
    },
    {
      repo = "hrsh7th/vim-vsnip",
      config = function() require 'plugin.vsnip' end,
      requires = {'hrsh7th/vim-vsnip-integ'}
    },
    {
      repo = 'brooth/far.vim',
      config = function() require 'plugin.far' end
    },
    {
      repo = 'voldikss/vim-floaterm',
      config = function() require 'plugin.floaterm' end
    },
    {
      repo = 'AndrewRadev/tagalong.vim',
      config = function() require 'plugin.tagalong' end
    },
    {
      repo = 'nvim-telescope/telescope.nvim',
      config = function() require 'plugin.telescope' end,
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'kyazdani42/nvim-web-devicons'}}
    },
    {
      repo = 'romainl/vim-cool',
      config = function() require 'plugin.vim-cool' end
    },
    {
      repo = 'RRethy/vim-illuminate',
      config = function() require 'plugin.vim-illuminate' end
    },
    {
      repo = 'liuchengxu/vim-which-key',
      config = function() require 'plugin.which-key' end
    },
    {
      repo = 'glepnir/galaxyline.nvim',
      branch = 'main',
      config = function() require 'aesth.statusline' end,
      requires = {'kyazdani42/nvim-web-devicons'}
    },
    {
      repo = 'neovim/nvim-lspconfig',
      config = function() require 'lsp.init'.setup() end
    },
    {
      repo = 'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      requires = {
        {'nvim-treesitter/playground', after = 'nvim-treesitter'},
        {'romgrk/nvim-treesitter-context', after = 'nvim-treesitter'}
      },
      config = function() require 'plugin.ts'.setup() end,
      event = 'VimEnter *'
    },
  }
end

return M
