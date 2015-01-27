set number
set title
set showmatch
set expandtab
set tabstop=4
set shiftwidth=4
set smartindent
set autoindent
syntax on
autocmd BufNewFile *.py 0r $HOME/.vim/template/python.txt

let $LUA_DLL="/usr/local/Cellar/lua/5.2.3_1/lib/liblua.5.2.3.dyliba"

set nocompatible
filetype plugin indent off

set runtimepath+=~/.vim/bundle/neobundle.vim
call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

" ディレクトリ表示してくれるやつ "
NeoBundle 'The-NERD-tree'
" 閉じ括弧とか自動で補完してくれるやつ "
NeoBundle 'Townk/vim-autoclose'
" ctrl+-(ハイフン)で選択した範囲をコメントアウトするやつ "
NeoBundle 'tomtom/tcomment_vim' 
" インデントの深さを可視化してくれるやつ "
NeoBundle 'nathanaelkane/vim-indent-guides'
" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

" 文字補完してくれるやつ"
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

