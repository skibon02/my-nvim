
vim.cmd[[
augroup mycolors
    autocmd!

    autocmd ColorScheme gruvbox hi BufferCurrent guifg=#ede2be guibg=#3c3836
    autocmd ColorScheme gruvbox hi BufferCurrentMod guifg=#fabd2f guibg=#3c3836
    autocmd ColorScheme gruvbox hi BufferInactiveMod guifg=#946b0c guibg=#3c3836
    autocmd ColorScheme gruvbox hi BufferInactiveERROR guifg=#660f09 guibg=#3c3836
    autocmd ColorScheme gruvbox hi BufferInactiveWARN guifg=#735902 guibg=#3c3836


augroup END
]]

vim.cmd.colorscheme('gruvbox')

