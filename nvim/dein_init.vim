"init.vim
"Rico Häuselmann

source ~/.config/nvim/local/pmswitch.vim
if exists('use_dein_vim')
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/hauselmann/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/home/hauselmann/.config/nvim/dein')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Marfisc/vorange')
call dein#add('croaker/mustang-vim')
call dein#add('dsolstad/vim-wombat256i')
call dein#add('encody/vim-colors')
call dein#add('shougo/unite.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})
call dein#add('scrooloose/nerdtree')
call dein#add('scrooloose/nerdtree')
call dein#add('tpope/vim-surround')
call dein#add('easymotion/vim-easymotion')
call dein#add('tpope/vim-markdown')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('benekastah/neomake')
call dein#add('kassio/neoterm')
call dein#add('LaTeX-Box-Team/LaTeX-Box')
call dein#add('klen/python-mode')
call dein#add('argtextobj.vim')
call dein#add('snippetsEmu')
call dein#add('tpope/vim-fugitive')
call dein#add('gregsexton/gitv', {
\ 'depends' : 
\   [ 'tpope/vim-fugitive' ]
\})
call dein#add('xolox/vim-misc')
call dein#add('xolox/vim-notes', {
\ 'depends' : [
\   'xolox/vim-misc'
\ ]})

" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" local
call dein#local('~/.config/nvim/local')

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
endif

if has('vim_starting') && !exists('use_dein_vim')
  set runtimepath+=~/.config/nvim/bundle/neobundle.vim
endif

if !exists('use_dein_vim')
call neobundle#begin(expand('~/.config/nvim/bundle'))
call neobundle#local(expand('~/.config/nvim/local/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Marfisc/vorange'
NeoBundle 'croaker/mustang-vim'
NeoBundle 'dsolstad/vim-wombat256i'
"NeoBundle 'MPiccinato/vim-wombat256'
NeoBundle 'encody/vim-colors'

NeoBundle 'shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-surround'
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'tpope/vim-markdown'
"NeoBundle 'euclio/vim-markdown-composer', {
"\ 'build' : {
"\     'mac' : 'env LDFLAGS="$LDFLAGS -L/usr/local/opt/openssl/lib" CFLAGS="$CFLAGS -I/usr/local/opt/openssl/include" cargo build --release',
"\     'linux' : 'cargo build --release',
"\     'unix' : 'cargo build --release',
"\    },
"\}
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'benekastah/neomake'
NeoBundle 'kassio/neoterm'
NeoBundle 'LaTeX-Box-Team/LaTeX-Box'
NeoBundle 'klen/python-mode'
NeoBundle 'argtextobj.vim'
NeoBundle 'snippetsEmu'
NeoBundle 'gregsexton/gitv', {
\ 'depends' : 
\   [ 'tpope/vim-fugitive' ]
\}
NeoBundle 'xolox/vim-notes', {
\ 'depends' : [
\   'xolox/vim-misc'
\ ]}

call neobundle#end()
endif

filetype plugin indent on
set autoindent
set smartindent
set shiftwidth=4
syntax enable
autocmd Filetype python set tabstop=4|set shiftwidth=4|set expandtab
autocmd Filetype rst set tabstop=3|set shiftwidth=3|set expandtab

set incsearch
set virtualedit=all

" appearance (Terminal)
colorscheme mustang
set cursorline
hi CursorLine gui=underline guibg=black

set relativenumber
set number

"Customizing the NERDTree
let NERDChristmasTree=1
let NERDTreeHijackNetrw=1
let NERDTreeShowBookmarks=1

"easymotion
nmap , <Plug>(easymotion-prefix)

"terminal
tnoremap <C-w> <C-\><C-n><C-w>
map <Leader>tf ::<Del>TREPLSendFile<CR>
map <Leader>tl ::<Del>TREPLSendLine<CR>
map <Leader>ts ::<Del>TREPLSendSelection<CR>

"airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_powerline_fonts=1
let g:airline_theme='term'

"gui
if has('gui_macvim')
    set guifont=Meslo\ LG\ L\ DZ\ for\ Powerline:h12 "uncomment if not on macbook-pro
    set transparency=20
    colorscheme vorange
    set ghr=20
    hi FoldColumn guibg=black
endif

"latex
autocmd Filetype latex,tex imap <C-l><C-p> <Plug>LatexCloseCurEnv

"waf meta build system
autocmd BufEnter wscript set filetype=python

"ricoh.commentor2
map <Leader>' <Plug>CommentLines

"pymode
let g:pymode_rope_complete_on_dot = 0
let g:pymode_lint_on_write = 0
let g:pymode_lint_ignore = "E501"
let g:pymode_lint_checkers = ['pylint', 'pep8']

"neoterm
let g:neoterm_position="vertical"
let g:neoterm_automap_keys="\t"

"vim-notes
let g:notes_directories = ['~/Dropbox/Notes']

"vimr
if has("gui_vimr")
    colorscheme vorange
    set termguicolors
    set title
    "set transparency=20
endif

if !exists('use_dein_vim')
NeoBundleCheck
endif
