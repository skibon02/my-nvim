
vim.cmd[[
augroup mycolors
    autocmd!

    autocmd ColorScheme gruvbox hi BufferCurrent guifg=white guibg=#3c3836
    autocmd ColorScheme gruvbox hi BufferCurrentMod guifg=#fabd2f guibg=#3c3836
    autocmd ColorScheme gruvbox hi BufferInactiveMod guifg=#fabd2f guibg=#3c3836

augroup END
]]

vim.cmd.colorscheme('gruvbox')

