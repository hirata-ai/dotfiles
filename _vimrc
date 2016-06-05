set number
set title
set showmatch
set expandtab
set tabstop=4
set shiftwidth=4
set smartindent
set autoindent
" カレント行ハイライトON
set cursorline
" アンダーラインを引く(color terminal)
" highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
" アンダーラインを引く(gui)
" highlight CursorLine gui=underline guifg=NONE guibg=NONE
syntax on
autocmd BufNewFile *.py 0r $HOME/.vim/template/python.txt
autocmd BufNewFile *.sh 0r $HOME/.vim/template/sh.txt
autocmd BufNewFile *.cpp 0r $HOME/.vim/template/cpp.txt

set nocompatible
filetype plugin indent off

if has('vim_starting')
    " 初回起動時のみruntimepathにneobundleのパスを指定する
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'
"
" ディレクトリ表示 "
NeoBundle 'The-NERD-tree'
" 閉じ括弧とかの自動で補完 "
NeoBundle 'Townk/vim-autoclose'
" ctrl+-(ハイフン)で選択した範囲をコメントアウトする "
NeoBundle 'tomtom/tcomment_vim' 
" インデントの深さを可視化する"
NeoBundle 'Yggdroot/indentLine'
" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indentLine_faster = 1
nmap <silent><Leader>i :<C-u>IndentLinesToggle<CR>

" ファイルのコンパイル、実行 "
NeoBundle 'thinca/vim-quickrun'
"vim-quickrun用設定
let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config['g++'] = {'command':'g++','cmdopt':'-std=c++11',}

" 文字補完する"
" if_luaが有効ならneocompleteを使う"
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'
if neobundle#is_installed('neocomplete')
" neocomplete用設定
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_ignore_case = 1
    let g:neocomplete#enable_smart_case = 1
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns._ = '\h\w*'
elseif neobundle#is_installed('neocomplcache')
    " neocomplete用設定
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_ignore_case = 1
    let g:neocomplcache_enable_smart_case = 1
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns._ = '\h\w*'
    let g:neocomplcache_enable_camel_case_completion = 1
    let g:neocomplcache_enable_underbar_completion = 1
endif
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

