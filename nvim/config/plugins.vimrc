
"----------------------------------- session ------------------------
let g:session_directory = '~/.cache/session.vim'
" A directory path which all session files will be saved/searched
let g:session_autosave = 'no'
"----------------------------------- session ------------------------


"------------- scratch-vim -----------
set hidden
let g:scratch_autohide = &hidden
let g:scratch_insert_autohide = 1
let g:scratch_persistence_file='~/.scratch-vim/notes'
let g:scratch_height = 40
"------------- scratch-vim -----------

"----------------------------vim-go----------------------------------
" Disable vim-go :GoDef short cut (gd)
" This is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
"----------------------------vim-go----------------------------------

"------------------------vim-markdown---------------------------
let g:vim_markdown_folding_disabled = 1
"------------------------vim-markdown---------------------------

"-----------Tabular plugin------------------
if exists(":Tabularize")
  nnoremap <Leader>a= :Tabularize /=<CR>
  vnoremap <Leader>a= :Tabularize /=<CR>
  nnoremap <Leader>a: :Tabularize /:\zs<CR>
  vnoremap <Leader>a: :Tabularize /:\zs<CR>
endif
"-----------Tabular plugin------------------

"-------------------------------------Fugitive-gitlab---------
let g:fugitive_gitlab_domains = ['']
let g:gitlab_api_keys = {'gitlab.com': ''}
"-------------------------------------Fugitive-gitlab---------

"----------------quickfix-reflector--------------
let g:qf_modifiable = 1
let g:qf_write_changes = 1
"----------------quickfix-reflector--------------

"----------------vim-test--------------
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
"----------------vim-test--------------

"------------------NERDTree------------
let g:NERDTreeWinPos = "left"
let g:NERDTreeWinSize = 50
"let NERDTreeShowBookmarks = 1
nnoremap <c-t> :NERDTreeToggle<CR>
nnoremap <silent> <leader>u :NERDTreeFind<CR>
nnoremap <leader>gb :NERDTreeFromBookmark<Space>
"------------------NERDTree------------

"------------------NERDTreeHighlight------------
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
let g:NERDTreeLimitedSyntax = 1
"------------------NERDTreeHighlight------------

"-----------------Fuzzy Finder-------------
map ; :Files<CR>
nnoremap <leader>, :RgWithColor<CR> 
nnoremap fb :Buffers<CR>
nnoremap fh :History:<CR>
nnoremap fl :Lines<CR>
nnoremap ft :Tags<CR>
nnoremap fw :Windows<CR>
nnoremap fm :Marks<CR>

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'up': '~70%' }

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" You can set up fzf window using a Vim command (Neovim or latest Vim 8 required)
"let g:fzf_layout = { 'window': 'enew' }
"let g:fzf_layout = { 'window': '-tabnew' }
"let g:fzf_layout = { 'window': '30new' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
"let g:fzf_files_options = '--preview "bat {}" --color light'
let g:fzf_files_options = '--preview "bat --color=always  --line-range :800 {}"'

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
command! -bang -nargs=* RgWithFileRegExpFilter call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case " . <q-args>, 1,  <bang>0)

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
"-----------------Fuzzy Finder-------------
