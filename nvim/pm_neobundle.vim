"--------------- neobundle script ---------------
if has('vim_starting')
  set runtimepath+=~/.config/nvim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.config/nvim/bundle'))
call neobundle#local(expand('~/.config/nvim/local/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'eugen0329/vim-esearch'
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
"--------------- End neobundle script ---------------
