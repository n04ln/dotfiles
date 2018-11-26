language C
syntax on
set background=dark
colorscheme tender
filetype plugin indent on
" Open config file (~/.config/nvim/init.vim)
command! Cn :e ~/.config/nvim/init.vim
" Open config file (~/.zshrc)
command! Cz :e ~/.zshrc
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
" set clipboard=unnamed
" set clipboard+=unnamedplus
let g:python3_host_prog = $PYENV_ROOT . '/versions/3.6.6/bin/python3' " use pyenv python3
let g:python_host_prog = $PYENV_ROOT . '/versions/2.7.15/bin/python2' " use pyenv python2
" }}}
" Indent {{{
augroup fileTypeIndent
  autocmd!
  autocmd BufNewFile,BufRead *.vim  setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.h    setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.cpp  setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.java setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.js   setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.vue  setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.yml  setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END
" }}}
" KEYBINDS {{{

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
" }}}
" Plug {{{
" NOTE: INSTALL Plug Command (https://github.com/junegunn/vim-plug#neovim)
"   $ curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
Plug 'jparise/vim-graphql'
" Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins' }

Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline'
Plug 'jacoborus/tender.vim'
Plug 'leafgarland/typescript-vim'

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

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/deoplete.nvim'

Plug 'zchee/deoplete-go', {'do': 'make'}
Plug 'fatih/vim-go'
Plug 'w0rp/ale'
Plug 'dyng/ctrlsf.vim'

Plug 'NoahOrberg/AYUNiS.nvim'
Plug 'NoahOrberg/diesirae.nvim'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'jdkanani/vim-material-theme'
call plug#end()
" }}}
" NERDTree {{{
let g:NERDTreeShowHidden = 1
noremap <silent> <C-e> :NERDTreeToggle<CR>
" }}}
" deoplete {{{
let g:deoplete#enable_at_startup = 1
set completeopt+=noinsert
let g:deoplete#omni_patterns = {}
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
      \   'gitbranch': 'fugitive#head',
      \   'ayunis': 'AYUNiSGetNowPlaying'
      \ },
      \ }
let g:lightline.tabline          = {
      \ 'left': [['ayunis', 'buffers']],
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
let g:go_fmt_command = "goimports"
nnoremap gt :GoTestFunc<CR>
nnoremap gT :GoTest<CR>
" }}}
" tagbar {{{
nmap <F8> :TagbarToggle<CR>
nmap tt :TagbarToggle<CR>
nmap tc :TagbarCurrentTag<CR>
let g:tagbar_ctags_bin = '/usr/local/Cellar/ctags/5.8_1/bin/ctags'
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
