local colorscheme = 'tokyonight'
local statusOK, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)

if not statusOK then
  -- vim.notify 能够在 command 命令行栏中弹出信息
  -- .. 操作符用于拼接字符串
  vim.notify('colorscheme: ' .. colorscheme .. ' not found!')
  return
end
