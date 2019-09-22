language C
syntax on
filetype plugin indent on
" Open config file (~/.config/nvim/init.vim)
command! Cn :e ~/.config/nvim/init.vim
" Open config file (~/.zshrc)
command! Cz :e ~/.zshrc
set runtimepath+=/Users/noah/go/src/github.com/NoahOrberg/protobuf_langserver/
" typo {{{
iabbrev TOOD TODO
iabbrev srting string
iabbrev strign string
iabbrev strnig string
iabbrev nit int
iabbrev pubric public
iabbrev Pritln Println
iabbrev Prit Print
iabbrev pritn print
iabbrev singup signup
iabbrev singin signin
" }}}
" Setting options {{{
set scrolloff=3
set number
set relativenumber
set hidden
set cursorline
set cursorcolumn
set cmdheight=2
set showmatch
set backspace=indent,eol,start
set smartcase
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set foldmethod=marker
set noswapfile
set shortmess+=A
set undofile
set undodir=~/.vim/undo
set splitbelow
set wildmode=longest:full,full
set ignorecase
set smartcase
set wrapscan
set incsearch
set inccommand=split
set clipboard=unnamed
set clipboard+=unnamedplus
let g:python3_host_prog = $PYENV_ROOT . '/versions/3.6.6/bin/python3' " use pyenv python3
let g:python_host_prog = $PYENV_ROOT . '/versions/2.7.15/bin/python2' " use pyenv python2
" }}}
" AutoCmd {{{
augroup fileTypeIndent
  autocmd!
  autocmd BufNewFile,BufRead *.vim   setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.h     setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.java  setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.jomp  setlocal tabstop=2 softtabstop=2 shiftwidth=2 ft=java
  autocmd BufNewFile,BufRead *.js    setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.vue   setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.yaml  setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.yml   setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.dart  setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.py    setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END
augroup fileTypeOpt
  autocmd FileType gitcommit setlocal spell
augroup END
" }}}
" KEYBINDS {{{
" noh
nnoremap <silent><esc><esc> :nohlsearch<CR>

" Terminal
inoremap <silent><C-j> <C-n>
tnoremap <silent> jj <C-\><C-n>
inoremap <silent> jj <ESC>
tnoremap <silent> <ESC> <C-\><C-n>
command Nt sp | terminal

" Buffer
nnoremap <silent>Bn :bnext<CR>
nnoremap <silent>Bb :b#<CR>

" Tab
nnoremap <silent>tn :tabn<CR>
nnoremap <silent>tp :tabp<CR>

" trash operate (not in any register)
nnoremap D "_d
" to clipboard
nnoremap Y "+y
" to clipboard
vnoremap Y "+y
" put current filename
nnoremap FF "%p
" put now
nnoremap <silent> DD :Date<CR>
" copy text to clip board
noremap <C-c>y "*y
" paste text in clip board
nnoremap <C-c>p "*p

" useful
nnoremap <Space> <Nop>
nnoremap Q <Nop>
nnoremap q: :q<CR>
nnoremap <SPACE>Q :<C-u>q!<CR>
nnoremap <SPACE>q :<C-u>q<CR>
nnoremap <SPACE>w :<C-u>w<CR>
nnoremap <SPACE>e :<C-u>e 
nnoremap <SPACE>a :<C-u>ALEToggle<CR> :<C-u>echo g:ale_enabled<CR>

" replace
nnoremap <SPACE>r :<C-u>s//g<LEFT><LEFT>
nnoremap <SPACE>R :<C-u>%s//g<LEFT><LEFT>
vnoremap <SPACE>r :s//g<LEFT><LEFT>

" CtrlSF
nnoremap <SPACE>sf :<C-u>CtrlSF 

" multiple lines -> oneline
"  nothing separator
vnoremap <silent><SPACE>1 :<C-u>'<,'>s/\n//g<CR>
"  separator is ';'
vnoremap <silent><SPACE>; :<C-u>'<,'>s/\n/; /g<CR>

" oneline -> multiple lines
vnoremap <silent><SPACE>! :<C-u>'<,'>s/,/,\r/g<CR>

" resize window 
nmap <C-w><C-j> <C-w>+<SID>ws
nmap <C-w><C-k> <C-w>-<SID>ws
nmap <C-w><C-l> <C-w>><SID>ws
nmap <C-w><C-h> <C-w><<SID>ws
nnoremap <silent> <script> <SID>ws<C-j> <C-w>+<SID>ws
nnoremap <silent> <script> <SID>ws<C-k> <C-w>-<SID>ws
nnoremap <silent> <script> <SID>ws<C-l> <C-w>><SID>ws
nnoremap <silent> <script> <SID>ws<C-h> <C-w><<SID>ws
nmap <SID>ws <SID>

" move window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Enter Ex-mode
noremap <SPACE>x :

" Ex-mode (many keybinds LIKE Emacs
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
cnoremap <C-B> <S-Left>
cnoremap <C-F> <S-Right>

" C-h is back space
inoremap <C-h> <BACKSPACE>

" To open a new terminal window
nnoremap <leader>t <Cmd>rightbelow 10new<CR><Cmd>terminal<CR>
" To open a new empty buffer
nnoremap <leader>n :enew<cr>

" comp
inoremap <TAB> <C-k><C-n>

" show bufname
noremap Bn :echo bufname('%')<CR>

" move to TOP and TAIL
nnoremap H ^
nnoremap L $

" move next/prev empty line
nnoremap <C-j> }
nnoremap <C-k> {
" }}}
" Plug {{{
" NOTE: INSTALL Plug Command (https://github.com/junegunn/vim-plug#neovim)
"   $ curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
Plug 'jparise/vim-graphql'
" Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins' }
Plug 'thinca/vim-showtime'

Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline'
Plug 'leafgarland/typescript-vim'
Plug 'dart-lang/dart-vim-plugin'

Plug 'lambdalisue/gina.vim'
Plug 'tpope/vim-fugitive'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'mattn/emmet-vim'
Plug 'cohama/lexima.vim'
Plug 'Yggdroot/indentLine'
Plug 'tomtom/tcomment_vim'
Plug 'thinca/vim-quickrun'
Plug 'glidenote/memolist.vim'
Plug 'majutsushi/tagbar'

Plug 'w0rp/ale'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'pdavydov108/vim-lsp-cquery'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
" Plug 'Shougo/deoplete.nvim'
" Plug 'zchee/deoplete-go', {'do': 'make'}
" Plug 'fatih/vim-go'

Plug 'dyng/ctrlsf.vim'
Plug '$HOME/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'terryma/vim-multiple-cursors'
Plug 'jdkanani/vim-material-theme'

" Made by @NoahOrberg
" Plug 'NoahOrberg/AYUNiS.nvim'
Plug 'NoahOrberg/diesirae.nvim'
Plug 'NoahOrberg/spacemacs-theme.vim'
Plug 'NoahOrberg/fizard.nvim'
Plug 'NoahOrberg/transfact.nvim'
call plug#end()
" }}}
" NERDTree {{{
let g:NERDTreeShowHidden = 1
noremap <silent> <C-e> :NERDTreeToggle<CR>
" }}}
" deoplete {{{
" NOTE: not use deoplete
" let g:deoplete#enable_at_startup = 1
" set completeopt+=noinsert
" let g:deoplete#omni_patterns = {}
" set shortmess+=c " to silent message
" }}}
" snippet {{{
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
imap <expr><TAB>
      \ pumvisible() ? "\<C-n>" :
      \ neosnippet#expandable_or_jumpable() ?
      \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
" }}}
" lightline {{{
set laststatus=2
set showtabline=2
set noshowmode
" let g:lightline = {
"       \ 'colorscheme': 'jellybeans',
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ],
"       \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
"       \ },
"       \ 'component_function': {
"       \   'gitbranch': 'fugitive#head',
"       \   'ayunis': 'AYUNiSGetNowPlaying'
"       \ },
"       \ }
" let g:lightline.tabline          = {
"       \ 'left': [['ayunis', 'buffers']],
"       \ 'right': [['close']]
"       \ }
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \ },
      \ }
let g:lightline.tabline          = {
      \ 'left': [['buffers']],
      \ 'right': [['close']]
      \ }
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
"}}}
" indentLine {{{
let g:indentLine_char = '¦'
set list lcs=tab:\¦\ 
" }}}
" ctrlp {{{
noremap <silent><C-b> :CtrlPBuffer<CR>
noremap <silent><C-m> :CtrlPMRUFiles<CR>
noremap <silent><C-l> :CtrlPLine<CR>
" }}}
" memolist.vim {{{
let g:memolist_path = $HOME . "/Documents"
" }}}
" vim-go {{{
" NOTE: not use vim-go now.
" let g:go_fmt_command = "goimports"
" nnoremap gt :GoTestFunc<CR>
" nnoremap gT :GoTest<CR>
" }}}
" tagbar {{{
nmap <F8> :TagbarToggle<CR>
nmap tt :TagbarToggle<CR>
nmap tc :TagbarCurrentTag<CR>
let g:tagbar_ctags_bin = '/usr/local/Cellar/ctags/5.8_1/bin/ctags'
" tagbar setting for golang.
" ref. https://github.com/jstemmer/gotags#vim-tagbar-configuration
let g:tagbar_type_go = {
\ 'ctagstype' : 'go',
\ 'kinds'     : [
\   'p:package',
\   'i:imports:1',
\   'c:constants',
\	  'v:variables',
\	  't:types',
\	  'n:interfaces',
\	  'w:fields',
\	  'e:embedded',
\	  'm:methods',
\	  'r:constructor',
\	  'f:functions'
\ ],
\ 'sro' : '.',
\ 'kind2scope' : {
\   't' : 'ctype',
\   'n' : 'ntype'
\ },
\ 'scope2kind' : {
\   'ctype' : 't',
\   'ntype' : 'n'
\ },
\ 'ctagsbin'  : 'gotags',
\ 'ctagsargs' : '-sort -silent'
\}
" }}}
" AYUNiS.nvim {{{
let g:ayunis_rtp = $HOME . '/.vim/plugged/AYUNiS.nvim'
" Next
nnoremap <silent><SPACE>sl :call AYUNiSNext()<CR>
" Prev
nnoremap <silent><SPACE>sh :call AYUNiSPrev()<CR>
" Toggle(playpause)
nnoremap <silent><SPACE>st :call AYUNiSToggle()<CR>
" Volume up
nnoremap <silent><SPACE>s+ :call AYUNiSVolumeUp()<CR>
" Volume down
nnoremap <silent><SPACE>s- :call AYUNiSVolumeDown()<CR>
" }}}
" diesirae.nvim {{{
let g:diesirae_config = {
      \  'commands': {
      \    'py': {
      \      'build_command': [], 
      \      'exec_command': ['python3', '*source*']
      \    },
      \    'go': {
      \      'build_command': ['go', 'build', '-o', '*bin*', '*source*'], 
      \      'exec_command': ['*bin*']
      \    }
      \  }
      \}
" }}}
" colorscheme {{{
" original is https://github.com/colepeters/spacemacs-theme.vim
" but I use https://github.com/NoahOrberg/spacemacs-theme.vim
if (has("termguicolors"))
  set termguicolors
endif
set background=dark
colorscheme spacemacs-theme
" }}}
" LSP {{{
let g:lsp_auto_enable = 1
let g:asyncomplete_smart_completion = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_remove_duplicates = 1

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1

" to enable omni comp
autocmd FileType go setlocal omnifunc=lsp#complete

if executable('go-langserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'go-langserver',
        \ 'cmd': {server_info->['go-langserver', '-mode', 'stdio', '-gocodecompletion']},
        \ 'whitelist': ['go'],
        \ })
endif

if executable('protobuf_langserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'protobuf_langserver',
        \ 'cmd': {server_info->['protobuf_langserver']},
        \ 'whitelist': ['proto'],
        \ })
endif

if executable('cquery')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'cquery',
      \ 'cmd': {server_info->['cquery']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': { 'cacheDirectory': '/tmp/cquery/cache' },
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
endif

let g:lsp_signs_enabled = 1         " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
let g:lsp_diagnostics_enabled = 0

let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼'}

let g:asyncomplete_completion_delay=10

nmap <silent> gd :<C-u>LspDefinition <CR>
nmap <silent> gr :<C-u>LspRename<CR>
" }}}
" ALE {{{
let g:ale_fixers = {'go': ['goimports']}
let g:ale_fix_on_save = 1 " enable Run fmt(goimports) when save it
" }}}
" dart-vim-plugin {{{
let dart_format_on_save = 1
" }}}
" fzf.vim {{{
nnoremap <C-f> :Files<CR>
" }}}
" cquery {{{
autocmd FileType c,cc,cpp,cxx,h,hpp nnoremap <leader>fv :LspCqueryDerived<CR>
autocmd FileType c,cc,cpp,cxx,h,hpp nnoremap <leader>fc :LspCqueryCallers<CR>
autocmd FileType c,cc,cpp,cxx,h,hpp nnoremap <leader>fb :LspCqueryBase<CR>
autocmd FileType c,cc,cpp,cxx,h,hpp nnoremap <leader>fi :LspCqueryVars<CR>

function MakeCquery()
  let filename = expand('%:p')
  let d = join(split(filename, '/')[0:-2], '/')

  echo system('echo ''[{"directory": "' . d . '","command": "/usr/bin/c++  ' . filename . ' -std=c++17","file": "' . filename . '"}]'' > compile_commands.json')
endfunction

autocmd FileType c,cc,cpp,cxx,h,hpp call MakeCquery()
" }}}
