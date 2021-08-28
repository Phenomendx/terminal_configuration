
"================================================================================================================
let g:rainbow_active = 1
"================================================================================================================

"================================================================================================================
let g:vim_markdown_folding_disabled = 1
"================================================================================================================

"================================================================================================================
let g:fugitive_gitlab_domains = ['']
let g:gitlab_api_keys = {'gitlab.com': ''}
"================================================================================================================

" execute tests
"================================================================================================================
let test#strategy = {
  \ 'nearest': 'neovim',
  \ 'file':    'neovim',
  \ 'suite':   'basic',
\}
let test#neovim#term_position = "topleft"
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
"================================================================================================================

" fuzzy finder
"================================================================================================================
nnoremap ; :Files<CR>
nnoremap ' :Rg<CR>
nnoremap fb :Buffers<CR>
nnoremap fh :History:<CR>
nnoremap fl :Lines<CR>
nnoremap ft :Tags<CR>
nnoremap fw :Windows<CR>
nnoremap fm :Marks<CR>

nnoremap fc :Files ~/.config/nvim/config<CR>

let g:fzf_layout = { 'up': '~70%' }

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_history_dir = '~/.local/share/fzf-history'

let g:fzf_buffers_jump = 1
"================================================================================================================

" easy motion - search and navigate
"================================================================================================================

map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
        \   'converters': [incsearch#config#fuzzyword#converter()],
        \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
        \   'keymap': {"\<CR>": '<Over>(easymotion)'},
        \   'is_expr': 0,
        \   'is_stay': 1
        \ }), get(a:, 1, {}))
endfunction
noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
"================================================================================================================


" file explorer
"================================================================================================================

"Search based of the current file location
nnoremap <silent>fi :<C-u>Defx -new `expand('%:p:h')` -search=`expand('%:p')`<CR>

"Search based on project working directory
nnoremap <silent><leader>e :Defx -search=`expand ('%:p')` `getcwd()` <CR>

autocmd BufWritePost * call defx#redraw()

autocmd FileType defx call s:defx_my_settings()

function! s:defx_my_settings() abort

	nnoremap <silent><buffer><expr> <2-LeftMouse> defx#do_action('open_tree')


  nnoremap <silent><buffer><expr> <CR> defx#do_action('drop')

  nnoremap <silent><buffer><expr> P
	  \ defx#do_action('preview')
  nnoremap <silent><buffer><expr> c
        \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
        \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
        \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
        \ defx#do_action('open')
  nnoremap <silent><buffer><expr> E
        \ defx#do_action('open', ':edit')
  nnoremap <silent><buffer><expr> o
        \ defx#do_action('open_tree')
  nnoremap <silent><buffer><expr> O
        \ defx#do_action('open_tree', 'recursive')
  nnoremap <silent><buffer><expr> K
        \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
        \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M
        \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
        \ defx#do_action('toggle_columns',
        \                'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
        \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
        \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
        \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
        \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
        \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
        \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
        \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
        \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h
        \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
        \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
        \ defx#do_action('quit')
  nnoremap <silent><buffer><expr>s
        \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
        \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
        \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
        \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-r>
        \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
        \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
        \ defx#do_action('change_vim_cwd')
  nnoremap <silent><buffer><expr> q
        \ defx#do_action('close_tree')
endfunction
call defx#custom#column('mark', {
      \ 'readonly_icon': '✗',
      \ 'selected_icon': '✓',
      \ })
call defx#custom#column('filename', {
            \ 'min_width': 60,
            \ 'max_width_percent': 100,
            \ })

"================================================================================================================

"================================================================================================================

"vim-table-mode
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='
