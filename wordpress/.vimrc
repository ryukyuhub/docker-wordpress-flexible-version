" Vim configuration with Japanese support

" 文字コードの設定
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,sjis
set fileformats=unix,dos,mac

" 基本設定
set number              " 行番号を表示
set norelativenumber    " 絶対行番号を表示
set cursorline          " カーソル行をハイライト
set showmatch           " 対応する括弧を強調表示
set hlsearch            " 検索結果をハイライト
set ignorecase          " 検索時に大文字小文字を区別しない
set smartcase           " 大文字が含まれる場合は区別する
set incsearch           " インクリメンタルサーチ
set wrapscan            " 検索時にファイルの最後まで行ったら最初に戻る

" インデント設定
set expandtab           " タブを空白に変換
set tabstop=4           " タブ幅
set shiftwidth=4        " 自動インデント幅
set softtabstop=4       " 連続した空白に対してタブキーやバックスペースでカーソルが動く幅
set autoindent          " 自動インデント
set smartindent         " スマートインデント

" 表示設定
set list                " 不可視文字を表示
set listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:%
set wrap                " 長い行を折り返して表示
set linebreak           " 単語の途中で折り返さない
set showbreak=>         " 折り返し行の先頭に表示

" ステータスライン
set laststatus=2        " ステータスラインを常に表示
set showcmd             " コマンドをステータスラインに表示
set ruler               " カーソル位置を表示

" その他の設定
set clipboard=unnamed   " クリップボードを共有
set backspace=indent,eol,start  " バックスペースで削除できるものを指定
set wildmenu            " コマンドライン補完を便利に
set mouse=a             " マウスを有効化
set ttimeoutlen=50      " キーコードシーケンスのタイムアウトを短く

" 日本語入力時のカーソル色を変更
if has('multi_byte_ime') || has('xim')
  highlight CursorIM guibg=Purple guifg=NONE
endif

" シンタックスハイライト
syntax enable

" カラースキーム（利用可能な場合）
try
  colorscheme desert
catch
  " デフォルトのカラースキームを使用
endtry

" ファイルタイプ別の設定
filetype plugin indent on

" PHPファイルの設定
autocmd FileType php setlocal shiftwidth=4 tabstop=4 softtabstop=4

" 保存時に行末の空白を削除
autocmd BufWritePre * :%s/\s\+$//e

" 日本語の表示改善
set ambiwidth=double    " 全角文字の幅を正しく扱う