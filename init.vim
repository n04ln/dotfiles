language C
"dein Scripts-----------------------------
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
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/denite.nvim')
call dein#add('bling/vim-airline')
call dein#add('mattn/emmet-vim')
call dein#add('Townk/vim-autoclose')
call dein#add('elixir-lang/vim-elixir')
call dein#add('neovimhaskell/haskell-vim')
call dein#add('tomtom/tcomment_vim')

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

"End dein Scripts-------------------------
"Start neosnippets Scripts----------------
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

"End neosnippets Script-------------------

let g:deoplete#enable_at_startup = 1
let g:python3_host_prog = expand('/Users/noahorberg/.pyenv/shims/python3')

"
syntax on
hi Comment ctermfg=darkcyan
set number
set cursorline
set cursorcolumn
set laststatus=2
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
