 " open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
"tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-t> :call OpenTerminal()<CR>
              
tnoremap <M-h> <C-\><C-N><C-w>h
tnoremap ∆ <C-\><C-N><C-w>j
tnoremap ˚ <C-\><C-N><C-w>k
tnoremap <M-l> <C-\><C-N><C-w>l
tnoremap <Esc> <C-\><C-N>
tnoremap jj  <C-\><C-N>
tnoremap xx  <C-\><C-n>:q!<CR>

