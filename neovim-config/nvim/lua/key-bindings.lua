-- map <Leader> key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- 通过定义两个变量的方式给 nvim_set_keymap() 函数和配置项起别名
local map = vim.api.nvim_set_keymap 
local opt = { noremap = true, silent = true }

-- =========================== INSERT BEGIN =========================== 

-- 映射 jk 为 <Esc>
map('i', 'jk', '<Esc>', opt)
-- 跳到行首行尾
map('i', '<C-h>', '<Esc>I', opt)
map('i', '<C-l>', '<Esc>A', opt)

-- =========================== INSERT END =========================== 

-- =========================== NORMAL BEGIN ===========================

-- H 移动到行首，L 移动到行尾
map('n', 'H', '^', opt)
map('n', 'L', 'g_', opt)
-- 上下滚动浏览
map('n', '<C-j>', '4j', opt)
map('n', '<C-k>', '4k', opt)
-- 修改 Ctrl-u 和 Ctrl-d 的移动幅度 从默认的移动半瓶改为移动 9 行
map('n', '<C-u>', '9k', opt)
map('n', '<C-d>', '9j', opt)
-- 退出
map('n', 'q', ':q<CR>', opt)
map('n', 'qq', ':q!<CR>', opt)
map('n', 'Q', ':qa!<CR>', opt)

-- *************************** windows BEGIN ***************************

-- 分屏 sv(split vertically) sh(split horizontally)
map('n', 'sv', ':vs<CR>', opt)
map('n', 'sh', ':sp<CR>', opt)
-- 关闭当前窗口 (close)
map('n', 'sc', '<C-w>c', opt)
-- 关闭其他窗口 (close other)
map('n', 'so', '<C-w>o', opt)
-- Alt + hjkl 在窗口之间跳转
map('n', '<A-h>', '<C-w>h', opt)
map('n', '<A-j>', '<C-w>j', opt)
map('n', '<A-k>', '<C-w>k', opt)
map('n', '<A-l>', '<C-w>l', opt)
-- 左右方向键控制窗口水平比例
-- Ctrl-左右方向键 小幅度移动
map('n', '<C-Left>', ':vertical resize -2<CR>', opt)
map('n', '<C-Right>', ':vertical resize +2<CR>', opt)
-- s, s. 大幅度移动
map('n', 's,', ':vertical resize -20<CR>', opt)
map('n', 's.', ':vertical resize +20<CR>', opt)
-- 上下方向控制窗口垂直比例
-- Ctrl-上下方向键 小幅度移动
map('n', '<C-Up>', ':resize -2<CR>', opt)
map('n', '<C-Down>', ':resize +2<CR>', opt)
-- sj sk 大幅度移动
map('n', 'sj', ':resize +10<CR>', opt)
map('n', 'sk', ':resize -10<CR>', opt)
-- 窗口等比例显示
map('n', 's=', '<C-w>=', opt)

-- *************************** windows END ***************************

-- =========================== NORMAL END ===========================

-- =========================== VISUAL START ===========================

-- 缩进代码
map('v', '<', '<gv', opt)
map('v', '>', '>gv', opt)
-- 上下移动选中的文本
map('v', 'J', ":move '>+1<CR>gv-gv", opt)
map('v', 'K', ":move '<-2<CR>gv-gv", opt)
-- VISUAL 模式中粘贴的时候默认会复制被粘贴的文本 很反人类 不需要
map('v', 'p', '"_dP', opt)
-- H 行首, L 行尾 
map('v', 'H', '^', opt)
map('v', 'L', 'g_', opt)

-- =========================== VISUAL END ===========================

-- *************************** terminal START ***************************

-- <leader>t 开启终端
map('n', '<leader>t', ':sp | terminal<CR>', opt)
map('n', '<leader>vt', ':vsp | terminal<CR>', opt)
-- <Esc> 退出终端
map('t', '<Esc>', '<C-\\><C-N>', opt)
-- 终端窗口中进行窗口切换
map('t', '<A-h>', [[ <C-\><C-N><C-w>h ]], opt)
map('t', '<A-j>', [[ <C-\><C-N><C-w>j ]], opt)
map('t', '<A-k>', [[ <C-\><C-N><C-w>k ]], opt)
map('t', '<A-l>', [[ <C-\><C-N><C-w>l ]], opt)

-- *************************** terminal END ***************************

-- *************************** plugin START ***************************

local pluginKeys = {}

-- nvim-tree
-- <Alt-m> 开启/关闭 文件浏览器
map('n', '<A-m>', ':NvimTreeToggle<CR>', opt)
-- 文件浏览器列表快捷键
pluginKeys.nvimTreeList = {
  -- 打开文件或文件夹
  { key = { '<CR>', 'o', '<2-LeftMouse>' }, action = 'edit' },
  -- 分屏打开文件
  { key = 'v', action = 'vsplit' },
  { key = 'h', action = 'split' },
  -- 切换显示隐藏文件
  { key = '.', action = 'toggle_dotfiles' },
  -- 切换显示自定义文件，比如 node_modules
  { key = 'i', action = 'toggle_custom' },
  -- 文件操作
  { key = '<F5>', action = 'refresh' },
  { key = 'a', action = 'create' },
  { key = 'd', action = 'remove' },
  { key = 'r', action = 'rename' },
  { key = 'x', action = 'cut' },
  { key = 'c', action = 'copy' },
  { key = 'p', action = 'paste' },
}

-- bufferline
-- 左右Tab切换
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
-- 关闭 tab，使用 "moll/vim-bbye" 插件的 Bdelete 实现
map("n", "<C-w>", ":Bdelete!<CR>", opt)
map('n', '<C-s>', ':w<CR>', opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- telescope 文件搜索
map('n', '<C-p>', ':Telescope find_files<CR>', opt)
map('n', '<C-f>', ':Telescope live_grep<CR>', opt)
pluginKeys.telescopeList = {
  i = {
    -- 上下移动
    ["<C-j>"] = "move_selection_next",
    ["<C-k>"] = "move_selection_previous",
    ["<Down>"] = "move_selection_next",
    ["<Up>"] = "move_selection_previous",
    -- 历史记录
    ["<C-n>"] = "cycle_history_next",
    ["<C-p>"] = "cycle_history_prev",
    -- 关闭窗口
    ["<C-c>"] = "close",
    -- 预览窗口上下滚动
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down",
  },
}

return pluginKeys
-- *************************** plugin END ***************************

