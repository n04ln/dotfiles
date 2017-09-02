language C
syntax on
filetype plugin indent on
set background=dark
colorscheme tender
" use pyenv python3
let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'
" set clipboard=unnamed
set number
set hidden
set cursorline
" set cursorcolumn
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
inoremap <silent><C-j> <C-n>
tnoremap <silent> jj <C-\><C-n>
inoremap <silent> jj <ESC>
" Window size
nnoremap <silent><C-w>- s-
nnoremap <silent><C-w>+ s+
" *** buffer control
nnoremap <silent><C-b>p :bprevious<CR>
nnoremap <silent><C-b>n :bnext<CR>
nnoremap <silent>bn :bnext<CR>
nnoremap <silent><C-b>b :b#<CR>
" WANTED :: Smart Solution...
nnoremap <silent><C-b>1 :b1<CR>
nnoremap <silent><C-b>2 :b2<CR>
nnoremap <silent><C-b>3 :b3<CR>
nnoremap <silent><C-b>4 :b4<CR>
nnoremap <silent><C-b>5 :b5<CR>
nnoremap <silent><C-b>6 :b6<CR>
nnoremap <silent><C-b>7 :b7<CR>
nnoremap <silent><C-b>8 :b8<CR>
nnoremap <silent><C-b>9 :b9<CR>
tnoremap <silent> <ESC> <C-\><C-n>
" *** Terminal
nnoremap <silent><C-t>t :terminal<CR>
" *** AutoCmd
" autocmd VimEnter * execute 'TagbarToggle'
" autocmd VimEnter * execute 'NERDTree'

" dein{{{
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.config/nvim/bundle/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.config/nvim/bundle')
  call dein#begin('~/.config/nvim/bundle')

  " Let dein manage dein
  " Required:
  call dein#add('~/.config/nvim/bundle/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('neovimhaskell/haskell-vim')
  call dein#add('NoahOrberg/castOfArrow.vim')
  call dein#add('NoahOrberg/hello.nvim')
  call dein#add('jacoborus/tender.vim')
  call dein#add('miyakogi/seiya.vim')
  call dein#add('tpope/vim-fugitive')
  call dein#add('NoahOrberg/vimtask2.vim')
  call dein#add('edkolev/tmuxline.vim')
  call dein#add('glidenote/memolist.vim')
  call dein#add('majutsushi/tagbar')
  call dein#add('scrooloose/nerdtree')
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  call dein#add('thinca/vim-quickrun')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('zchee/deoplete-go', {'build': 'make'})
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('Yggdroot/indentLine')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('cohama/lexima.vim')
  call dein#add('fatih/vim-go')
  call dein#add('vim-jp/vim-go-extra')
  call dein#add('mattn/emmet-vim')
  call dein#add('nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh'})
  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
 call dein#install()
endif
" }}}
" deoplete {{{
let g:deoplete#enable_at_startup = 1
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
" indentLine {{{
  let g:indentLine_char = '>'
  let g:indentLine_color_term = 200
  set list lcs=tab:\>\ 
" }}}
" airline{{{
set laststatus=2
set showtabline=2
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='tenderplus'
"}}}
" tagbar {{{
nmap <F8> :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/local/Cellar/ctags/5.8_1/bin/ctags'
" }}}
" NERDTree {{{
nnoremap <silent><C-e> :NERDTreeToggle<CR>
" }}}
" quickrun {{{
nnoremap <Leader>q :<C-u>bw! \[quickrun\ output\]<CR>
autocmd BufRead,BufNewFile *_test.go set filetype=go.test
let g:quickrun_config = {
\   '_': {
\     'split': '10',
\     'runner': 'vimproc',
\     'runner/vimproc/updatetime' : 10,
\     'outputter/buffer/close_on_empty' : 1,
\   },
\   'haskell' : { 'type' : 'haskell/stack' },
\   'haskell/stack' : {
\       'command' : 'stack',
\       'exec' : '%c %o %s %a',
\       'cmdopt' : 'runghc',
\   },
\   'python' : {
\       'command' : 'python3',
\   },
\   'go.test' : {
\       'command' : 'go',
\       'exec' : ['%c test'],
\   },
\   'java' : {
\       'command' : 'javac',
\       'exec' : ['%c -J-Duser.language=en -J-Duser.country=us %s'],
\   },
\}
set splitbelow
" }}}
" vimproc {{{
" }}}
" go-vim {{{
let g:go_fmt_command = "goimports"
" cnoremap gr GoRename<space>
" cnoremap gi GoImport<space>
" cnoremap gd GoDoc<space>
noremap <F2> :GoDef<CR>
" }}}
" seiya.vim {{{
let g:seiya_auto_enable=1
" }}}
