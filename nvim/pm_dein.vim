"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.config/nvim/dein')
    " Required:
    call dein#begin('~/.config/nvim/dein')

    " Let dein manage dein
    " Required:
    call dein#add('Shougo/dein.vim')

    " Add or remove your plugins here:
    "call dein#add('eugen0329/vim-esearch')
    "~ call dein#add('Shougo/neosnippet.vim')
    "~ call dein#add('Shougo/neosnippet-snippets')
    call dein#add('Marfisc/vorange')
    "call dein#add('Shougo/denite.nvim')
    "if !has('nvim')
    "    call dein#add('roxma/nvim-yarp')
    "    call dein#add('roxma/vim-hug-neovim-rpc')
    "endif
    call dein#add('Shougo/vimproc.vim', {'build': 'make'})
    call dein#add('scrooloose/nerdtree')
    call dein#add('tpope/vim-surround')
    call dein#add('easymotion/vim-easymotion')
    call dein#add('tpope/vim-markdown')
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('benekastah/neomake')
    call dein#add('kassio/neoterm')
    call dein#add('LaTeX-Box-Team/LaTeX-Box')
    call dein#add('python-mode/python-mode')
    call dein#add('vim-scripts/argtextobj.vim')
    " call dein#add('vim-scripts/snippetsEmu')
    call dein#add('tpope/vim-fugitive')
    call dein#add('gregsexton/gitv', {'depends' : ['vim-fugitive']})
    call dein#add('xolox/vim-misc')
    call dein#add('xolox/vim-notes', {'depends' : ['vim-misc']})
    call dein#add('xolox/vim-reload', {'depends': ['vim-misc']})
    call dein#add('junegunn/limelight.vim')
    call dein#add('junegunn/goyo.vim')
    call dein#add('Rykka/InstantRst', {'build': 'pip3 install https://github.com/Rykka/instant-rst.py/archive/master.zip'})
    call dein#add('Rykka/riv.vim')
    call dein#add('vim-syntastic/syntastic')
    call dein#add('fenetikm/falcon')
    call dein#add('ycm-core/YouCompleteMe', {'build': 'python3 install.py --all --clangd-completer'})
    call dein#add('junegunn/fzf', {'path': '~/.fzf'})
    call dein#add('junegunn/fzf.vim', {'depends': 'fzf'})
    call dein#add('~/Code/SimpylFold')
    call dein#add('Konfekt/FastFold')
    call dein#add('sirver/ultisnips')
    call dein#add('igankevich/mesonic')
    call dein#add('chrisbra/unicode.vim')

    " You can specify revision/branch/tag.
    "~ call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

    " local
    call dein#local('~/.config/nvim/local')

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

"End dein Scripts------------------------- 
