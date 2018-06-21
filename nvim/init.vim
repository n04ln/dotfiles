"  http://patorjk.com/software/taag/#p=display&f=Slant&t=awesome
" path setting {{{
"                  __  __  
"     ____  ____ _/ /_/ /_ 
"    / __ \/ __ `/ __/ __ \
"   / /_/ / /_/ / /_/ / / /
"  / .___/\__,_/\__/_/ /_/ 
" /_/                      
set runtimepath+=/usr/local/share/nvim/runtime
set runtimepath+=~/.ghq/github.com/NoahOrberg/yoshinani.vim
set runtimepath+=~/.ghq/github.com/NoahOrberg/schoolyard.nvim
" let g:python3_host_prog = '/usr/local/bin/python3' " use pyenv python3
let g:python3_host_prog = $PYENV_ROOT . '/shims/python3' " use pyenv python3
" }}}
" other {{{
"          __  __             
"   ____  / /_/ /_  ___  _____
"  / __ \/ __/ __ \/ _ \/ ___/
" / /_/ / /_/ / / /  __/ /    
" \____/\__/_/ /_/\___/_/     
"                             
language C
syntax on
filetype plugin indent on
" set background=dark
colorscheme tender
set scrolloff=3
set number
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
" set clipboard=unnamedplus
" }}}
" indent width {{{
"     ____          __           __              _     ____  __                               
"    /  _/___  ____/ /__  ____  / /_   _      __(_)___/ / /_/ /_                              
"    / // __ \/ __  / _ \/ __ \/ __/  | | /| / / / __  / __/ __ \                             
"  _/ // / / / /_/ /  __/ / / / /_    | |/ |/ / / /_/ / /_/ / / /                             
" /___/_/ /_/\__,_/\_____/ /_/\__/    |__/|____/\__,_____/_/ /_/                              
"             ____  / __/  ___  ____ ______/ /_     / /___ _____  ____ ___  ______ _____ ____ 
"            / __ \/ /_   / _ \/ __ `/ ___/ __ \   / / __ `/ __ \/ __ `/ / / / __ `/ __ `/ _ \
"           / /_/ / __/  /  __/ /_/ / /__/ / / /  / / /_/ / / / / /_/ / /_/ / /_/ / /_/ /  __/
"           \____/_/     \___/\__,_/\___/_/ /_/  /_/\__,_/_/ /_/\__, /\__,_/\__,_/\__, /\___/ 
"                                                              /____/            /____/       
augroup fileTypeIndent
  autocmd!
  autocmd BufNewFile,BufRead *.h   setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.cpp setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.js   setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.vue   setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END
" }}}
" terminal mode {{{
"    __                      _             __                       __   
"   / /____  _________ ___  (_)___  ____ _/ /  ____ ___  ____  ____/ /__ 
"  / __/ _ \/ ___/ __ `__ \/ / __ \/ __ `/ /  / __ `__ \/ __ \/ __  / _ \
" / /_/  __/ /  / / / / / / / / / / /_/ / /  / / / / / / /_/ / /_/ /  __/
" \__/\___/_/  /_/ /_/ /_/_/_/ /_/\__,_/_/  /_/ /_/ /_/\____/\__,_/\___/ 
"                                                                        
inoremap <silent><C-j> <C-n>
tnoremap <silent> jj <C-\><C-n>
inoremap <silent> jj <ESC>
tnoremap <silent> <ESC> <C-\><C-n>
command Nt sp | terminal
" }}}
" window {{{
"            _           __             
"  _      __(_)___  ____/ /___ _      __
" | | /| / / / __ \/ __  / __ \ | /| / /
" | |/ |/ / / / / / /_/ / /_/ / |/ |/ / 
" |__/|__/_/_/ /_/\__,_/\____/|__/|__/  
"                                       
nnoremap <silent><C-w>- s-
nnoremap <silent><C-w>+ s+
" }}}
" buffer {{{
"     __          ________         
"    / /_  __  __/ __/ __/__  _____
"   / __ \/ / / / /_/ /_/ _ \/ ___/
"  / /_/ / /_/ / __/ __/  __/ /    
" /_.___/\__,_/_/ /_/  \___/_/     
"                                  
nnoremap <silent>bn :bnext<CR>
nnoremap <silent><C-b>b :b#<CR>
" }}}
" tabpage {{{
"    __        __                         
"   / /_____ _/ /_  ____  ____ _____ ____ 
"  / __/ __ `/ __ \/ __ \/ __ `/ __ `/ _ \
" / /_/ /_/ / /_/ / /_/ / /_/ / /_/ /  __/
" \__/\__,_/_.___/ .___/\__,_/\__, /\___/ 
"               /_/          /____/       
nnoremap <silent>tn :tabn<CR>
nnoremap <silent>tp :tabp<CR>
" }}}
" key mapping {{{
"     __                                             _            
"    / /_____  __  __   ____ ___  ____ _____  ____  (_)___  ____ _
"   / //_/ _ \/ / / /  / __ `__ \/ __ `/ __ \/ __ \/ / __ \/ __ `/
"  / ,< /  __/ /_/ /  / / / / / / /_/ / /_/ / /_/ / / / / / /_/ / 
" /_/|_|\___/\__, /  /_/ /_/ /_/\__,_/ .___/ .___/_/_/ /_/\__, /  
"           /____/                  /_/   /_/            /____/   
"
"  trash operate (not in any register)
nnoremap D "_d
"  to clipboard
nnoremap Y "+y
"  put current filename
nnoremap FF "%p
"  paste text in clip board
nnoremap <C-c>p "*p
"  copy text to clip board (in only visual mode)
vnoremap <C-c>c "*y

nnoremap <Space> <Nop>
nnoremap Q <Nop>
nnoremap q: :q<CR>
nnoremap <SPACE>Q :<C-u>Q<CR>
nnoremap <SPACE>q :<C-u>q<CR>
nnoremap <SPACE>w :<C-u>w<CR>
nnoremap <SPACE>e :<C-u>e 
nnoremap <SPACE>a :<C-u>ALEToggle<CR> :<C-u>echo g:ale_enabled<CR>
inoremap {<CR> {<CR>}<Esc>O
inoremap {, {<CR>},<Esc>O
" }}}
" custom command {{{
command! Date :r! date
command! CurrentAllDirs :r! ls -alF | grep -e '^d.*$' | awk 'BEGIN{FS=" "}{printf $9 " "}'
command! CurrentDirs :r! ls -lF | grep -e '^d.*$' | awk 'BEGIN{FS=" "}{printf $9 " "}'
" }}}
" each plugin setting 
" dein{{{
"        __     _             _         
"   ____/ /__  (_)___  _   __(_)___ ___ 
"  / __  / _ \/ / __ \| | / / / __ `__ \
" / /_/ /  __/ / / / /| |/ / / / / / / /
" \__,_/\___/_/_/ /_(_)___/_/_/ /_/ /_/ 
"                                       
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

  " made by @noah_orberg
  call dein#add('NoahOrberg/gilbert.nvim', {'rev': 'develop'}) " master is stable
  call dein#add('NoahOrberg/diesirae.nvim')
  call dein#add('NoahOrberg/castOfArrow.vim')
  call dein#add('NoahOrberg/vivid.vim')
  call dein#add('NoahOrberg/AYUNiS.nvim', {'rev': 'master'})

  " js and html and CSS
  call dein#add('mattn/emmet-vim', {'on_ft': ['html']})

  " golang
  call dein#add('fatih/vim-go')
  call dein#add('zchee/deoplete-go', {'build': 'make'})
  call dein#add('vim-jp/vim-go-extra')
  call dein#add('nsf/gocode', {'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh'})

  " git
  call dein#add('lambdalisue/gina.vim')
  call dein#add('tpope/vim-fugitive')

  " haskell
  call dein#add('neovimhaskell/haskell-vim', {'on_ft': ['haskell']})
  call dein#add('itchyny/vim-haskell-indent', {'on_ft': ['haskell']})

  " filer
  call dein#add('scrooloose/nerdtree')
  call dein#add('ctrlpvim/ctrlp.vim')

  " looks
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('jacoborus/tender.vim')
  " call dein#add('edkolev/tmuxline.vim')
  call dein#add('miyakogi/seiya.vim')
  call dein#add('Yggdroot/indentLine')

  " elixir
  call dein#add('elixir-editors/vim-elixir')
  call dein#add('mattreduce/vim-mix')

  " high speed edit
  call dein#add('easymotion/vim-easymotion', {'rev': 'v3.0.1'})
  call dein#add('haya14busa/incsearch.vim')
  call dein#add('haya14busa/incsearch-fuzzy.vim')
  call dein#add('haya14busa/incsearch-easymotion.vim')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

  "other
  call dein#add('glidenote/memolist.vim')
  call dein#add('cohama/lexima.vim')
  call dein#add('majutsushi/tagbar')
  call dein#add('thinca/vim-quickrun')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('vim-jp/vital.vim')
  call dein#add('gyim/vim-boxdraw')
  call dein#add('reedes/vim-colors-pencil')
  call dein#add('mopp/layoutplugin.vim')
  " call dein#add('takac/vim-spotifysearch')
  " You can specify revision/branch/tag.
  " call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " for vue
  call dein#add('posva/vim-vue')
  call dein#add('w0rp/ale')

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
"        __                 __     __                    _         
"   ____/ /__  ____  ____  / /__  / /____    ____ _   __(_)___ ___ 
"  / __  / _ \/ __ \/ __ \/ / _ \/ __/ _ \  / __ \ | / / / __ `__ \
" / /_/ /  __/ /_/ / /_/ / /  __/ /_/  __/ / / / / |/ / / / / / / /
" \__,_/\___/\____/ .___/_/\___/\__/\___(_)_/ /_/|___/_/_/ /_/ /_/ 
"                /_/                                               
let g:deoplete#enable_at_startup = 1
set completeopt+=noinsert
" }}}
" snippet {{{
"                                 _                  __        _         
"    ____  ___  ____  _________  (_)___  ____  ___  / /__   __(_)___ ___ 
"   / __ \/ _ \/ __ \/ ___/ __ \/ / __ \/ __ \/ _ \/ __/ | / / / __ `__ \
"  / / / /  __/ /_/ (__  ) / / / / /_/ / /_/ /  __/ /__| |/ / / / / / / /
" /_/ /_/\___/\____/____/_/ /_/_/ .___/ .___/\___/\__(_)___/_/_/ /_/ /_/ 
"                              /_/   /_/                                 
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
"     _           __           __  __    _          
"    (_)___  ____/ /__  ____  / /_/ /   (_)___  ___ 
"   / / __ \/ __  / _ \/ __ \/ __/ /   / / __ \/ _ \
"  / / / / / /_/ /  __/ / / / /_/ /___/ / / / /  __/
" /_/_/ /_/\__,_/\___/_/ /_/\__/_____/_/_/ /_/\___/ 
"                                                   
let g:indentLine_char = '>'
let g:indentLine_color_term = 200
set list lcs=tab:\>\ 
" }}}
" airline {{{
"         _                       _      ___          
"  _   __(_)___ ___        ____ _(_)____/ (_)___  ___ 
" | | / / / __ `__ \______/ __ `/ / ___/ / / __ \/ _ \
" | |/ / / / / / / /_____/ /_/ / / /  / / / / / /  __/
" |___/_/_/ /_/ /_/      \__,_/_/_/  /_/_/_/ /_/\___/ 
"                                                     
set laststatus=2
set showtabline=2
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
" let g:airline_section_x = airline#section#create(['%{AYUNiSGetNowPlaying()}'])
" let g:airline_powerline_fonts = 1
" let g:airline_theme='tenderplus'
"}}}
" tagbar {{{
"    __              __              
"   / /_____ _____ _/ /_  ____ ______
"  / __/ __ `/ __ `/ __ \/ __ `/ ___/
" / /_/ /_/ / /_/ / /_/ / /_/ / /    
" \__/\__,_/\__, /_.___/\__,_/_/     
"          /____/                    
nmap <F8> :TagbarToggle<CR>
nmap tt :TagbarToggle<CR>
nmap tc :TagbarCurrentTag<CR>
let g:tagbar_ctags_bin = '/usr/local/Cellar/ctags/5.8_1/bin/ctags'
" }}}
" NERDTree {{{
"     _   ____________  ____  ______             
"    / | / / ____/ __ \/ __ \/_  __/_______  ___ 
"   /  |/ / __/ / /_/ / / / / / / / ___/ _ \/ _ \
"  / /|  / /___/ _, _/ /_/ / / / / /  /  __/  __/
" /_/ |_/_____/_/ |_/_____/ /_/ /_/   \___/\___/ 
"                                                
let NERDTreeShowHidden=1
nnoremap <silent><C-e> :NERDTreeToggle<CR>
" }}}
" quickrun {{{
"         _                             _      __                  
"  _   __(_)___ ___        ____ ___  __(_)____/ /_________  ______ 
" | | / / / __ `__ \______/ __ `/ / / / / ___/ //_/ ___/ / / / __ \
" | |/ / / / / / / /_____/ /_/ / /_/ / / /__/ ,< / /  / /_/ / / / /
" |___/_/_/ /_/ /_/      \__, /\__,_/_/\___/_/|_/_/   \__,_/_/ /_/ 
"                          /_/                                     
" nnoremap <Leader>q :<C-u>bw! \[quickrun\ output\]<CR>
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
" vim-go {{{
"         _                           
"  _   __(_)___ ___        ____ _____ 
" | | / / / __ `__ \______/ __ `/ __ \
" | |/ / / / / / / /_____/ /_/ / /_/ /
" |___/_/_/ /_/ /_/      \__, /\____/ 
"                       /____/        
let g:go_fmt_command = "goimports"
noremap <F2> :GoDef<CR>
noremap <F3> :GoRename<CR>
noremap <F4> :GoImports<CR>
" }}}
" seiya.vim {{{
"               _                   _         
"    ________  (_)_  ______ __   __(_)___ ___ 
"   / ___/ _ \/ / / / / __ `/ | / / / __ `__ \
"  (__  )  __/ / /_/ / /_/ /| |/ / / / / / / /
" /____/\___/_/\__, /\__,_(_)___/_/_/ /_/ /_/ 
"             /____/                          
let g:seiya_auto_enable=1
" }}}
" ctrlp {{{
"         __       __    
"   _____/ /______/ /___ 
"  / ___/ __/ ___/ / __ \
" / /__/ /_/ /  / / /_/ /
" \___/\__/_/  /_/ .___/ 
"               /_/      
noremap <silent><C-p>p :CtrlP<CR>
noremap <silent><C-p>b :CtrlPBuffer<CR>
noremap <silent><C-p>m :CtrlPMRUFiles<CR>
" }}}
" easymotion {{{
"         _                                                       __  _           
"  _   __(_)___ ___        ___  ____ ________  ______ ___  ____  / /_(_)___  ____ 
" | | / / / __ `__ \______/ _ \/ __ `/ ___/ / / / __ `__ \/ __ \/ __/ / __ \/ __ \
" | |/ / / / / / / /_____/  __/ /_/ (__  ) /_/ / / / / / / /_/ / /_/ / /_/ / / / /
" |___/_/_/ /_/ /_/      \___/\__,_/____/\__, /_/ /_/ /_/\____/\__/_/\____/_/ /_/ 
"                                       /____/                                    
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 0

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
vmap s <Plug>(easymotion-bd-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
" nmap <Leader>w <Plug>(easymotion-overwin-w) " 使えない
"
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
" }}}
" AYUNiS.nvim {{{
"     _____  ____  ___   ___ _____              _         
"    /   \ \/ / / / / | / (_) ___/  ____ _   __(_)___ ___ 
"   / /| |\  / / / /  |/ / /\__ \  / __ \ | / / / __ `__ \
"  / ___ |/ / /_/ / /|  / /___/ / / / / / |/ / / / / / / /
" /_/  |_/_/\____/_/ |_/_//____(_)_/ /_/|___/_/_/ /_/ /_/ 
"
" let g:airline_section_x = airline#section#create(['%{AYUNiSGetNowPlaying()}'])
" }}}
" ALE {{{
let g:ale_linters = {
\ 'html': [],
\ 'css': ['stylelint'],
\ 'javascript': ['eslint'],
\ 'vue': ['eslint']
\ }
let g:ale_fixers = {
\ 'javascript': ['eslint']
\ }
let g:ale_fix_on_save = 1
let g:ale_linter_aliases = {'vue': 'css'}
" }}}
" yoshinani.vim {{{
let g:yoshinani_template_path = $HOME . '/.config/yoshinani'
" }}}
