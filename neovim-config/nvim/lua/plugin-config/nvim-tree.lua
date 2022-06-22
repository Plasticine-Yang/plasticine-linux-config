local statusOK, nvimTree = pcall(require, 'nvim-tree')

if not statusOK then
  vim.notify('plugin: nvim-tree not found!')
  return
end

-- 配置文件浏览器列表操作快捷键
local listKeys = require('key-bindings').nvimTreeList
nvimTree.setup({
  -- Changes the tree root directory on `DirChanged` and refreshes the tree.
  update_cwd = true,
  -- Update the focused file on `BufEnter`, un-collapses the folders
  -- recursively until it finds the file.
  -- 也就是当打开一个文件的时候，文件浏览器的列表光标会递归地定位到这个文件
  update_focused_file = {
    enable = true,
    -- update_cwd = true 已经废弃 需要换成 update_root 属性
    update_root = true
  },
  -- 隐藏 .文件 和 node_modules 目录
  -- 可以通过触发 `toggle_dotfiles` 这一 action 切换显示 .文件
  -- 可以通过触发 `toggle_custom` 这一 action 切换显示 node_modules 目录
  filters = {
    dotfiles = true,
    custom = { 'node_modules' },
  },
  -- 文件浏览器展示相关配置
  view = {
    width = 40,
    side = 'left',
    hide_root_folder = false,
    -- 自定义在文件浏览器列表中的快捷键
    mappings = {
      custom_only = false,
      list = listKeys
    },
    -- 不显示行数
    number = false,
    relativenumber = false,
    -- 显示图标
    signcolumn = 'yes'
  },
  actions = {
    open_file = {
      -- 首次打开时大小自动适应
      resize_window = true,
      -- 打开文件时关闭文件浏览器窗口
      quit_on_open = true
    }
  },
})

-- 自动关闭
vim.cmd([[
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])
