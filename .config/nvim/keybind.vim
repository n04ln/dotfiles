" highlight off
nnoremap <silent><esc><esc> :nohlsearch<CR>

" Terminal
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

"" trash operate (not in any register)
"nnoremap D "_d
"" to clipboard
"nnoremap Y "+y
"" to clipboard
"vnoremap Y "+y
" put current filename
nnoremap FF "%p
" put now
nnoremap <silent> DD :Date<CR>
"" copy text to clip board
"noremap <C-c>y "*y
"" paste text in clip board
"nnoremap <C-c>p "*p

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
inoremap <expr><TAB> pumvisible() ? "<C-n>" : "<TAB>"

" show bufname
noremap Bn :echo bufname('%')<CR>

" move to TOP and TAIL
nnoremap H ^
nnoremap L $

" move next/prev empty line
" nnoremap <C-j> }
" nnoremap <C-k> {

