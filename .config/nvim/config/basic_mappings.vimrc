
" ----------------------------------------------------------------------------
" Key Mappings:Customized keys
" ----------------------------------------------------------------------------

"PRIMARY BUFFER
noremap <leader>y "*y
noremap <leader>p "*p
"CLIPBOARD BUFFER
noremap <leader>Y "+y
noremap <leader>P "+p

"noremap <esc> :noh<cr>
imap jj <esc>

"Close window
nnoremap qw :q <CR>

"Set file's current directory as current working directory
nnoremap <leader>cd :cd %:p:h<cr>

"Go to home and end using capitalized directions
noremap H 0
noremap L $

"Yank by the end of line not including the new line character
noremap Y y$

"0 to first non-blank character
noremap 0 ^

"Keep search pattern at the center of the screen."
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz

"Use 'bn/bp' to move among buffers
noremap <leader>p :bp<CR>
noremap <leader>n :bn<CR>

"Use 't/T' to move among tabs
noremap t :tabn<CR>
noremap T :tabp<CR>

"Select all
noremap <Leader>sa ggVG

"Move visual block
vnoremap J :m '>+1<CR>gv=g"v
vnoremap K :m '<-2<CR>gv=gv

"Edit vimrc and zshrc
nnoremap ,ev :vsplit $MYVIMRC<cr>
nnoremap ,er :vsplit $HOME/.zshrc<cr>

"Movement between windows
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k

" Next window
nnoremap ]w <c-w>w

"Increases/Decrease window width/height
nnoremap <Space>v :vsplit<CR>
nnoremap <Space>h :split<CR>
nnoremap <Space> 4<c-w>>
nnoremap <Tab> 4<c-w><
nnoremap <CR> 4<c-w>>
nnoremap <S-Up> 3<c-w>+
nnoremap <S-Down> 3<c-w>-
nnoremap <Space>f <c-w>o

"Moving windows
nnoremap <Tab>h <C-W>H
nnoremap <Tab>l <C-W>L
nnoremap <Tab>j <C-W>J
nnoremap <Tab>k <C-W>K
nnoremap <Tab>t <C-W>T

" Scroll with option k/j
nnoremap ∆ 3<c-e>
nnoremap ˚ 3<c-y>

"Indent the content of the file
nmap <Leader>f gg=G 
inoremap <Leader>f <Esc>gg=G 

"Only current window
nnoremap<leader>o :only<CR>
