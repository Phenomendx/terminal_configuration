
" ----------------------------------------------------------------------------
" Key Mappings:Customized keys
" ----------------------------------------------------------------------------

"PRIMARY BUFFER
noremap <leader>y "*y
noremap <leader>p "*p
"CLIPBOARD BUFFER
noremap <leader>Y "+y
noremap <leader>P "+p

noremap <esc> :noh<cr>

"Close window
nnoremap qw :q <CR>

"Set file's current directory as current working directory
nnoremap <leader>cd :cd %:p:h<cr>

"Count the occurrences of a match
map ,* *<C-O>:%s///gn<CR>

imap jj <esc>

"Go to home and end using capitalized directions
noremap H 0
noremap L $

"Yank by the end of line not including the new line character
noremap Y y$

"Remap VIM 0 to first non-blank character
noremap 0 ^

"Keep search pattern at the center of the screen."
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz<Paste>

"Use 'bn/bp' to move among buffers
noremap <leader>bp :bp<CR>
noremap <leader>bn :bn<CR>

"Use 't/T' to move among tabs
noremap t :tabn<CR>
noremap T :tabp<CR>

"select all
noremap <Leader>sa ggVG

"Vmap for maintain Visual Mode after shifting > and <
vnoremap < <gv
vnoremap > >gv

"Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"Edit vimrc
nnoremap ,ev :vsplit $MYVIMRC<cr>
nnoremap ,er :vsplit $HOME/.zshrc<cr>

"Movement between windows
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
"nnoremap <c-j> <c-w>j
"nnoremap <c-k> <c-w>k

"Increases/Decrease window width/height
nnoremap <S-Left> 5<c-w><
nnoremap <S-Right> 5<c-w>>
nnoremap <S-Up> 3<c-w>+
nnoremap <S-Down> 3<c-w>-

" Scroll with C-J
nnoremap <c-j> 3<c-e>
nnoremap <c-k> 3<c-y>

