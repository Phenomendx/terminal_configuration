call plug#begin()
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rhubarb'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'vim-scripts/DrawIt'
Plug 'kristijanhusak/defx-git'
Plug 'reedes/vim-pencil'
Plug 'frazrepo/vim-rainbow'
Plug 'dhruvasagar/vim-table-mode'
Plug 'sainnhe/edge'
call plug#end()

au CursorHold,CursorHoldI * checktime

source $HOME/.config/nvim/config/basic_mappings.vimrc
source $HOME/.config/nvim/config/basic_options.vimrc
source $HOME/.config/nvim/config/plugins.vimrc
source $HOME/.config/nvim/config/terminall.vimrc
source $HOME/.config/nvim/config/scala.vimrc
source $HOME/.config/nvim/config/coc_snippets.vimrc

au FocusLost * :wa
