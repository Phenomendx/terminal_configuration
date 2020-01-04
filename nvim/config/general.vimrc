syntax on

filetype on

autocmd BufWritePre,TextChanged,InsertLeave *.js Neoformat
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

au BufNewFile,BufRead Jenkinsfile* setf groovy

if (has("termguicolors"))
 set termguicolors
endif

colorscheme OceanicNext
"colorscheme gruvbox

set clipboard=unnamed,unnamedplus

set noswapfile

set number

set encoding=UTF-8

set autoindent

set tabstop=2
set shiftwidth=2
set expandtab

set mouse=a

"set hlsearch
set nohlsearch

set matchpairs+=<:>

set ignorecase

set list

set ruler
set scrolloff=14
set relativenumber

set virtualedit+=all

" Change working directory to the opened file's directory 
"set autochdir

set autowriteall

if has('statusline')
    "Show constantly current working directory
    set laststatus=2
    "set statusline=
    "set statusline=cwd:
    "set statusline+=%{GetCurrentWorkingDirectory()}
    "set statusline+=\ \|
    "set statusline+=\ file:
    "set statusline+=\%f
    "set statusline+=\ \|
    "set statusline+=\ branch:
    "set statusline+=%{FugitiveStatusline()}
    set statusline+=coc-status::
    set statusline+=%{coc#status()}
endif

function! GetCurrentWorkingDirectory()
  let l:workingDirectory = getcwd()
  return l:workingDirectory
endfunction

" Create undo file
if has('persistent_undo')
  set undofile                " So is persistent undo ...
  set undolevels=1000         " Maximum number of changes that can be undone
  set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
  set undodir=~/.undodir/
endif
