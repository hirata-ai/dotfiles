set number
set title
set showmatch
set expandtab
set tabstop=4
set shiftwidth=4
set smartindent
set autoindent
set noimdisableactivate
syntax on

set nocompatible
filetype plugin indent off

if has('vim_starting')
		set runtimepath+=~/.vim/bundle/neobundle.vim
		call neobundle#rc(expand('~/.vim/bundle'))
endif 

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'The-NERD-tree'
NeoBundle 'Townk/vim-autoclose'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck
