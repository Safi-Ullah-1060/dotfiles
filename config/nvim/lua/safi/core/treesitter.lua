-- nvim 0.12+ native treesitter setup, no nvim-treesitter plugin needed
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'cpp', 'c' },
  callback = function()
    vim.treesitter.start()
    vim.bo.indentexpr = "" -- let cindent handle it
    vim.bo.cindent = true
  end,
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'python', 'bash', 'lua', 'regex' },
  callback = function()
    vim.treesitter.start()
    vim.bo.indentexpr = "v:lua.vim.treesitter.indentexpr()"
  end,
})

-- install parsers on startup if missing
local parsers = { 'c', 'cpp', 'python', 'bash', 'lua', 'regex' }
for _, lang in ipairs(parsers) do
  if not pcall(vim.treesitter.language.inspect, lang) then
    vim.cmd("TSInstall " .. lang)
  end
end
