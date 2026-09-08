set relativenumber
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
syntax on
set updatetime=100

" use <Leader>w to quick save
noremap <Leader>w :update<CR>

" use <Leader>l to quick clear highlight text
noremap <Leader>l :nohl<CR>

" use <Leader>t to create new tab
noremap <Leader>t :tabnew<CR>

" use <Leader>s to create new horizontal split
noremap <Leader>s :sp<CR>

" use <Leader>v to create new vertical split
noremap <Leader>v :vsp<CR>

" cursors:
" insert mode (|)
let &t_SI = "\e[5 q"
" replace mode (_)
let &t_SR = "\e[3 q"
" normal mode (█)
let &t_EI = "\e[1 q"
