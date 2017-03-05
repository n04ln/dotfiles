language C
" dein{{{
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/noahorberg/.config/nvim/bundle/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/Users/noahorberg/.config/nvim/bundle')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('mopp/layoutplugin.vim')
call dein#add('NoahOrberg/vimtask2.vim')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/denite.nvim')
" call dein#add('davidhalter/jedi-vim')
" call dein#add('zchee/deoplete-jedi')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('mattn/emmet-vim')
call dein#add('Townk/vim-autoclose')
call dein#add('elixir-lang/vim-elixir')
call dein#add('neovimhaskell/haskell-vim')
call dein#add('tomtom/tcomment_vim')
call dein#add('Yggdroot/indentLine')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('thinca/vim-quickrun')
call dein#add('derekwyatt/vim-scala')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"}}}
" neosnippets{{{
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.config/nvim/bundle/repos/github.com/Shougo/neosnippet-snippets/neosnippets/'

"}}}
" deoplete{{{
let g:deoplete#enable_at_startup = 1
let g:python3_host_prog = expand('/Users/noahorberg/.pyenv/shims/python3')
" }}}
" vimproc{{{
" }}}
" jedi-vim{{{
" let g:jedi#rename_command = "<leader>R" " default: \r (because Conflict with quickrun)
" }}}
" deoplete-jedi{{{
" }}}
" airline{{{
set laststatus=2
set showtabline=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='laederon'
"}}}
" indentLine {{{
  let g:indentLine_char = '>'
  let g:indentLine_color_term = 239
  set list lcs=tab:\>\ 
" }}}
" NERDTree {{{
  " nnoremap <silent><C-e> :NERDTreeToggle<CR>
" }}}
" quickrun.vim{{{
nnoremap <Leader>q :<C-u>bw! \[quickrun\ output\]<CR>
let g:quickrun_config = {
\   '_': {
\     'split': '5',
\     'runner': 'vimproc',
\     'runner/vimproc/updatetime' : 10,
\     'outputter/buffer/close_on_empty' : 1,
\   },
\   'haskell' : { 'type' : 'haskell/stack' },
\   'haskell/stack' : {
\       'command' : 'stack',
\       'exec' : '%c %o %s %a',
\       'cmdopt' : 'runghc',
\   }
\}
set splitbelow
" }}}
" other setting{{{
syntax on
colorscheme railscasts
hi Comment ctermfg=darkcyan
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
set tabstop=2
set shiftwidth=2
set softtabstop=2
set foldmethod=marker
set noswapfile
set shortmess+=A
" *** quote complete
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
" *** buffer control
nnoremap <silent><C-b>p :bprevious<CR>
nnoremap <silent><C-b>n :bnext<CR>
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

"}}}

