call plug#begin()
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rhubarb'
Plug 'vim-scripts/argtextobj.vim'
Plug 'tommcdo/vim-exchange'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'janko-m/vim-test'
Plug 'mhartington/oceanic-next'
Plug 'terryma/vim-expand-region'
Plug 'michaeljsmith/vim-indent-object'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'easymotion/vim-easymotion'
Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/DrawIt'
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'kristijanhusak/defx-git'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'dhruvasagar/vim-open-url'
Plug 'reedes/vim-pencil'
Plug 'frazrepo/vim-rainbow'
Plug 'szw/vim-g'
Plug 'git@github.com:CrispyDrone/vim-tasks.git'
Plug 'dhruvasagar/vim-table-mode'
Plug 'honza/vim-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'dracula/vim'
Plug 'fatih/vim-go'
Plug 'azabiong/vim-highlighter'
Plug 'sainnhe/edge'
call plug#end()

au CursorHold,CursorHoldI * checktime

source $HOME/.config/nvim/config/basic_mappings.vimrc
source $HOME/.config/nvim/config/basic_options.vimrc
source $HOME/.config/nvim/config/plugins.vimrc
source $HOME/.config/nvim/config/terminall.vimrc
source $HOME/.config/nvim/config/scala.vimrc
source $HOME/.config/nvim/config/coc_snippets.vimrc
" source $HOME/.config/nvim/config/coc_yank.vimrc

au BufNewFile,BufRead Jenkinsfile* setf groovy
au BufNewFile,BufRead Jenkinsenki* setf groovy
au FocusLost * :wa

let HiSet   = 'f<CR>'           " normal, visual
let HiErase = 'f<BS>'           " normal, visual
let HiClear = 'f<C-L>'          " normal
let HiFind  = 'f<Tab>'          " normal, visual
let HiFindTool = 'rg --color=never --no-heading --column --smart-case'
nn <silent>-  :<C-U> Hi/next<CR>
nn <silent>_  :<C-U> Hi/previous<CR>
nn f<Left>    :<C-U> Hi/older<CR>
nn f<Right>   :<C-U> Hi/newer<CR>
