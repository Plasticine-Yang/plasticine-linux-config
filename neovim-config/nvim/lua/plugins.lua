local packer = require('packer')

packer.startup(
  function(use)
    -- Packer 管理可以自己本身
    use 'wbthomason/packer.nvim'
    -- 要安装的插件在后面添加即可 格式为 作者名/仓库名

    ------------------------ colorscheme ------------------------

    -- tokyonight
    use 'folke/tokyonight.nvim'

    ------------------------ colorscheme ------------------------

    -- vim-surround
    use 'tpope/vim-surround'

    -- vim-easymotion
    use 'easymotion/vim-easymotion'

    -- nvim-tree 侧边文件浏览器
    use({
      'kyazdani42/nvim-tree.lua',
      requires = {
        -- optional, for file icons
        'kyazdani42/nvim-web-devicons'
      }
    })

    -- bufferline 顶部标签页
    use({
      'akinsho/bufferline.nvim',
      requires = {
        'kyazdani42/nvim-web-devicons',
        'moll/vim-bbye'
      }
    })

    -- lualine 底部信息显示
    use({
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons' }
    })
    use('arkav/lualine-lsp-progress')

    -- telescope 文件模糊搜索
    use({
      'nvim-telescope/telescope.nvim',
      requires = { 'nvim-lua/plenary.nvim' }
    })
    -- telescope extensions
    use 'LinArcX/telescope-env.nvim'

    -- dashboard-nvim 
    use('glepnir/dashboard-nvim')

    -- project
    use('ahmedkhalf/project.nvim')

    -- treesitter 语法高亮
    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })

  end 
)

-- 修改 plugins.lua 时调用 vim script 自动安装插件
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
