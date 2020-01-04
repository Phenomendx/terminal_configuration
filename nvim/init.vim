call plug#begin()
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
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
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'fatih/vim-go'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'janko-m/vim-test'
Plug 'gyim/vim-boxdraw'
Plug 'sbdchd/neoformat'
Plug 'mhartington/oceanic-next'
Plug 'mtth/scratch.vim'
Plug 'dense-analysis/ale'
Plug 'pangloss/vim-javascript'
Plug 'terryma/vim-expand-region'

Plug 'michaeljsmith/vim-indent-object'
call plug#end()

source $HOME/.config/nvim/config/keys.vimrc
source $HOME/.config/nvim/config/general.vimrc
source $HOME/.config/nvim/config/coc.vimrc
source $HOME/.config/nvim/config/coc-extensions.vimrc
source $HOME/.config/nvim/config/plugins.vimrc

set rtp+=~/.fzf

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'vue': ['eslint']
\}


vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
