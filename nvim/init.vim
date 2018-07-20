language C
syntax on
filetype plugin indent on
" set background=dark
colorscheme tender
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
" set clipboard=unnamedplus

" set runtimepath+=/usr/local/share/nvim/runtime
let g:python3_host_prog = $PYENV_ROOT . '/shims/python3' " use pyenv python3

augroup fileTypeIndent
  autocmd!
  autocmd BufNewFile,BufRead *.vim   setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.h   setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.cpp setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.js   setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.vue   setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.yaml   setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.yml   setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" KEYBINDS{{{
inoremap <silent><C-j> <C-n>
tnoremap <silent> jj <C-\><C-n>
inoremap <silent> jj <ESC>
tnoremap <silent> <ESC> <C-\><C-n>
command Nt sp | terminal

nnoremap <silent>Bn :bnext<CR>
nnoremap <silent>Bb :b#<CR>

nnoremap <silent>tn :tabn<CR>
nnoremap <silent>tp :tabp<CR>

"  trash operate (not in any register)
nnoremap D "_d
"  to clipboard
nnoremap Y "+y
"  put current filename
nnoremap FF "%p
"  put now
nnoremap <silent> DD :Date<CR>
"  paste text in clip board
nnoremap <C-c>p "*p
"  copy text to clip board (in only visual mode)
vnoremap <C-c>c "*y

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
nnoremap <SPACE>ss :<C-u>CtrlSF<CR>
function! InteractiveCtrlSFCmd() abort
  let s = input("plz input word: ")
  if (s != "") 
    execute ":CtrlSF " . s
  endif
endfunction
nnoremap <SPACE>sf :<C-u>call InteractiveCtrlSFCmd()<CR>

" vimgrep
function! VimGrep() abort
  let str = input("grep word: ")
  execute(":vim " . str . " `git ls-files` | cw")
endfunction
nnoremap <SPACE>gc :call VimGrep()<CR>

" multiple lines -> oneline
vnoremap <silent><SPACE>1 :<C-u>'<,'>s/\n//g<CR>
vnoremap <silent><SPACE>; :<C-u>'<,'>s/\n/; /g<CR>

" oneline -> multiple lines
vnoremap <silent><SPACE>! :<C-u>'<,'>s/,/,\r/g<CR>

" Ex mode
noremap <C-x><SPACE> :
" }}}
" Plug {{{
" NOTE: INSTALL Plug Command (https://github.com/junegunn/vim-plug#neovim)
"   $ curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline'
Plug 'jacoborus/tender.vim'

Plug 'lambdalisue/gina.vim'
Plug 'tpope/vim-fugitive'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'mattn/emmet-vim'
Plug 'cohama/lexima.vim'
Plug 'Yggdroot/indentLine'
Plug 'tomtom/tcomment_vim'
Plug 'thinca/vim-quickrun'
Plug 'majutsushi/tagbar'
Plug 'glidenote/memolist.vim'

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/deoplete.nvim'

Plug 'zchee/deoplete-go', {'do': 'make'}
Plug 'fatih/vim-go'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
call plug#end()
" }}}
" NERDTree {{{
noremap <silent> <C-e> :NERDTreeToggle<CR>
" }}}
" deoplete {{{
let g:deoplete#enable_at_startup = 1
set completeopt+=noinsert
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
let g:lightline = {
      \ 'colorscheme': 'tender',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
"}}}
" indentLine {{{
let g:indentLine_char = '¦'
set list lcs=tab:\¦\ 
" }}}
" ctrlp {{{
noremap <silent><C-P> :CtrlP<CR>
noremap <silent><C-b> :CtrlPBuffer<CR>
noremap <silent><C-m> :CtrlPMRUFiles<CR>
" }}}
" vim-go {{{
let g:go_fmt_command = "goimports"
" }}}
