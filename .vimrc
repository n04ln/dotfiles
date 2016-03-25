"NeoBundle------------------
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
"---------------------------
" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'
" unite.vim
NeoBundle 'Shougo/unite.vim'
" vimfiler
NeoBundle 'Shougo/vimfiler'
" vimproc
NeoBundle 'Shougo/vimproc'
" im_control.vim
NeoBundle 'fuenor/im_control.vim'
" neat-json.vim
NeoBundle '5t111111/neat-json.vim'
" autoclose
NeoBundle 'Townk/vim-autoclose'
" Emmet
NeoBundle 'mattn/emmet-vim'
" tcmment_vim
NeoBundle 'tomtom/tcomment_vim'
" quickrun
NeoBundle 'thinca/vim-quickrun'
call neobundle#end()
" Required:
filetype plugin indent on
NeoBundleCheck
"---------------------------
"script --------------------
nnoremap <C-f> :VimFiler -buffer-name=explorer -split -winwidth=45 -toggle -no-quit<Cr>
"---------------------------
"set------------------------
syntax on
set nocompatible
set number " 行番号を表示する
set cursorline " カーソル行の背景色を変える
set cursorcolumn " カーソル位置のカラムの背景色を変える
set laststatus=2 " ステータス行を常に表示
set cmdheight=2 " メッセージ表示欄を2行確保
set showmatch " 対応する括弧を強調表示
set helpheight=999 " ヘルプを画面いっぱいに開く
set backspace=indent,eol,start " Backspaceキーの影響範囲に制限を設けない
set whichwrap=b,s,h,l,<,>,[,] " 行頭行末の左右移動で行をまたぐ
set scrolloff=8 " 上下8行の視界を確保
set sidescrolloff=16 " 左右スクロール時の視界を確保
set sidescroll=1 " 左右スクロールは一文字づつ行う
set confirm " 保存されていないファイルがあるときは終了前に保存確認
set hidden " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set autoread "外部でファイルに変更がされた場合は読みなおす
set nobackup " ファイル保存時にバックアップファイルを作らない
set noswapfile " ファイル編集中にスワップファイルを作らない
set hlsearch " 検索文字列をハイライトする
set incsearch " インクリメンタルサーチを行う
set ignorecase " 大文字と小文字を区別しない
set smartcase " 大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan " 最後尾まで検索を終えたら次の検索で先頭に移る
set gdefault " 置換の時 g オプションをデフォルトで有効にする
set expandtab " タブ入力を複数の空白入力に置き換える
set tabstop=4 " 画面上でタブ文字が占める幅
set shiftwidth=4 " 自動インデントでずれる幅
set softtabstop=4 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set showmatch
set clipboard=unnamed,unnamedplus
set mouse=a
set shellslash
set wildmenu wildmode=list:longest,full
set history=10000
set imdisable
set foldmethod=marker
