-- map <Leader> key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- 通过定义两个变量的方式给 nvim_set_keymap() 函数和配置项起别名
local map = vim.api.nvim_set_keymap 
local opt = { noremap = true, silent = true }

-- =========================== INSERT BEGIN =========================== 

-- 映射 jk 为 <Esc>
map('i', 'jk', '<Esc>', opt)

-- =========================== INSERT END =========================== 

-- =========================== NORMAL BEGIN ===========================

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

-- *************************** windows END ***************************

-- =========================== NORMAL END ===========================
