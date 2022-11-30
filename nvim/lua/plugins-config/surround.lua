local status, surround = pcall(require, 'surround')
if not status then
  vim.notify('plugin: `surround` not found')
  return
end

local default_opts = {
  mappings_style = 'surround',
}

surround.setup(default_opts)
