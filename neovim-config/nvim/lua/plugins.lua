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

    -- nvim-tree 侧边文件浏览器
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icons
      },
    }

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
