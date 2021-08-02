" NOTE: INSTALL Plug Command (https://github.com/junegunn/vim-plug#neovim)
"   $ curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline'
Plug 'lambdalisue/gina.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'mattn/emmet-vim'
Plug 'cohama/lexima.vim'
Plug 'Yggdroot/indentLine'
Plug 'tomtom/tcomment_vim'
Plug 'majutsushi/tagbar'
Plug 'w0rp/ale'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'dyng/ctrlsf.vim'
Plug '$HOME/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'NoahOrberg/spacemacs-theme.vim'
Plug 'n04ln/transfact.nvim'
Plug 'wakatime/vim-wakatime'
Plug 'vimscript/webapi'
call plug#end()

" NERDTree {{{
let g:NERDTreeShowHidden = 1
noremap <silent> <C-e> :NERDTreeToggle<CR>
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
" ctrlsf {{{
nmap <silent><C-s> <Plug>CtrlSFCwordPath<CR>
" }}}
" tagbar {{{
nmap <F8> :TagbarToggle<CR>
nmap tt :TagbarToggle<CR>
nmap tc :TagbarCurrentTag<CR>
let g:tagbar_ctags_bin = '/usr/local/Cellar/ctags/5.8_2/bin/ctags'
" tagbar setting for golang. should install `gotags`
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

if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls']},
        \ 'whitelist': ['go'],
        \ 'workspace_config': {'gopls': {
        \     'staticcheck': v:true,
        \     'completeUnimported': v:true,
        \     'caseSensitiveCompletion': v:true,
        \     'usePlaceholders': v:true,
        \     'completionDocumentation': v:true,
        \     'watchFileChanges': v:true,
        \     'hoverKind': 'SingleLine',
        \   }},
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
let g:ale_lint_on_text_changed = 1
let g:ale_fixers = {'go': ['goimports']}
let g:ale_fix_on_save = 1 " enable Run fmt(goimports) when save it
let g:ale_echo_msg_format = '[%linter%]%code: %%s'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" }}}
" fzf.vim {{{
nnoremap <C-f> :Files<CR>
" }}}
