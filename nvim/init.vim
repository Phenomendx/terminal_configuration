call plug#begin()
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'fatih/vim-go'
"Plug 'mhinz/vim-grepper'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'jremmen/vim-ripgrep'
call plug#end()

let g:qf_modifiable = 1
let g:qf_write_changes = 1

let g:coc_global_extensions = ['coc-java', 'coc-json', 'coc-snippets', 'coc-pairs']

au BufNewFile,BufRead Jenkinsfile* setf groovy

let g:deoplete#enable_at_startup = 1

set rtp+=~/.fzf

colorscheme gruvbox

"Interfer with system copy-paste buffers
"Note that X11 and Windows systems has different typy of buffers 
set clipboard=unnamed,unnamedplus
"set clipboard=unnamedplus

"PRIMARY BUFFER
noremap <leader>y "*y
noremap <leader>p "*p
"CLIPBOARD BUFFER
noremap <leader>Y "+y
noremap <leader>P "+p

noremap <esc> :noh<cr>

set noswapfile

syntax on

filetype on

set number

set autoindent

set tabstop=4

set shiftwidth=2

set mouse=a

set hlsearch

set matchpairs+=<:>

set ignorecase

set list

set ruler
set scrolloff=7
set relativenumber

autocmd InsertEnter * :set norelativenumber " no relativenumber in insert mode
autocmd InsertLeave * :set relativenumber   " show relativenumber when leave insert mode

"Change working directory to the opened file's directory 
"set autochdir

set autowriteall

if has('statusline')
		"Show constantly current working directory
		set laststatus=2
		set statusline=
		set statusline=cwd:
		set statusline+=%{GetCurrentWorkingDirectory()}
		set statusline+=\ \|\  
		set statusline+=file:
		set statusline+=\ %f
		set statusline+=\ \|
		"set statusline+=coc-status::
		"set statusline+=%{coc#status()}
endif

function! GetCurrentWorkingDirectory()
	let l:workingDirectory = getcwd()
	return l:workingDirectory
endfunction

"create undo file
if has('persistent_undo')
  set undofile                " So is persistent undo ...
  set undolevels=1000         " Maximum number of changes that can be undone
  set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
  set undodir=~/.undodir/
endif

"autocmd BufEnter *.java :NERDTReeFind<cr>
" ----------------------------------------------------------------------------
" Key Mappings:Customized keys
" ----------------------------------------------------------------------------
"Quick window close
nnoremap qw :q <CR>

"Set file's current directory as current working directory
nnoremap <leader>cd :cd %:p:h<cr>

"Count the occurrences of a match
map ,* *<C-O>:%s///gn<CR>

"Remap esc in insert mode
imap jj <esc>

"use <C-V> to paste yanked content
inoremap <C-V> <C-R>"

"Go to home and end using capitalized directions
noremap H 0
noremap L $
noremap Y y$

"Remap VIM 0 to first non-blank character
noremap 0 ^

"Keep search pattern at the center of the screen."
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz<Paste>

"Use 'm/M' to move among buffers
noremap M :bp<CR>
noremap m :bn<CR>

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
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k

"Increases/Decrease window width/height
nnoremap <S-Left> 5<c-w><
nnoremap <S-Right> 5<c-w>>
nnoremap <S-Up> 3<c-w>+
nnoremap <S-Down> 3<c-w>-

" Scroll with C-J
nnoremap <c-j> 3<c-e>
nnoremap <c-k> 3<c-y>

if has('macunix')
	   "pbcopy for OSX copy/paste
	   vnoremap <C-x> :!pbcopy<CR>
		 vnoremap <C-c> :w !pbcopy<CR><CR>
endif

"----------------------------------------------
" Plugins Configuration
" ---------------------------------------------

"vim-go

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

"vim-markdown
let g:vim_markdown_folding_disabled = 1

"Tabular plugin
if exists(":Tabularize")
	nnoremap <Leader>a= :Tabularize /=<CR>
	vnoremap <Leader>a= :Tabularize /=<CR>
	nnoremap <Leader>a: :Tabularize /:\zs<CR>
	vnoremap <Leader>a: :Tabularize /:\zs<CR>
endif

"----------limelight.vim configuration----------
nmap <Leader>l <Plug>(Limelight)
xmap <Leader>l <Plug>(Limelight)
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
" Default: 0.5
let g:limelight_default_coefficient = 0.7
" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
" Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1
"----------limelight.vim configuration----------

"Ultisnip
let g:UltiSnipsExpandTrigger="<tab>"  " use <Tab> trigger autocompletion
"let g:UltiSnipsJumpForwardTrigger="<c-f>"
"let g:UltiSnipsJumpBackwardTrigger="<c-b>"

"Fugitive-gitlab
let g:fugitive_gitlab_domains = []
let g:gitlab_api_keys = {'gitlab.com': ''}

" ----------coc.vim configuration----------

"Multiple cursors
nmap <silent> <C-c> <Plug>(coc-cursors-position)
nmap <silent> <C-d> <Plug>(coc-cursors-word)
xmap <silent> <C-d> <Plug>(coc-cursors-range)
" use normal command like `<leader>xi(`
nmap <leader>x  <Plug>(coc-cursors-operator)

"Navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"Use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

nmap <leader>rf <Plug>(coc-refactor)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR><Paste>
" Quick fix
nnoremap <silent> <space>q  :<C-u>CocFix<cr>

" ----------coc.vim configuration----------

"----------------coc-snippets--------------
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-f>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-b>'
"----------------coc-snippets--------------

"NERDTree
nnoremap <c-t> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = 50
nnoremap <silent> <Leader>r :NERDTreeFind<CR>

"Fuzzy Finder
map ; :Files<CR>
noremap ' :RgWithColor<CR> 
nnoremap fb :Buffers<CR>
nnoremap fh :History:<CR>
nnoremap fl :Lines<CR>
nnoremap fbl :Lines<CR>
nnoremap ft: Tags<CR>
nnoremap fw: Windows<CR>

let g:fzf_layout = { 'down': '~40%' }
" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
"let g:fzf_files_options = '--preview "pygmentize {}" --color light'

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
" Example: :RgWithFileRegExpFilter 'search for something' -g '*.java'
command! -bang -nargs=* RgWithFileRegExpFilter call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case " . <q-args>, 1, <bang>0)

command! -bang -nargs=* RgWithPreview
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color-never --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%', '?'),
  \   <bang>0)

command! -bang -nargs=* RgWithColor
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --colors "path:fg:190,220,255" --colors "line:fg:128,128,128" --smart-case '.shellescape(<q-args>), 1, { 'options': '--color hl:123,hl+:222' }, 0)
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Vim grepper
"let g:grepper={}
"let g:grepper.tools=["rg"]
