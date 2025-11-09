function Toggle_background()
  if vim.o.background == 'dark' then
    vim.o.background = 'light'
  elseif vim.o.background == 'light' then
    vim.o.background = 'dark'
  end
  print('vim.o.background=' .. vim.o.background)
end
