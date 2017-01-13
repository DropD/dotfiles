"init.vim
"Rico Häuselmann

"--------------- try load settings, set defaults ---------------
if filereadable(expand('~/.config/nvim/local/settings.vim'))
    source ~/.config/nvim/local/settings.vim
endif

if !exists('g:settings')
    let g:settings = {
\       'plugin_manager' : ''
\   }
endif

if g:settings.plugin_manager == ''
    if filereadable(expand('~/.config/nvim/dein/repos/github.com/Shougo/dein.vim'))
        let g:settings.plugin_manager = 'dein'
    else 
	if isdirectory(expand('~/.config/nvim/bundle/neobundle.vim'))
	    let g:settings.plugin_manager = 'neobundle'
	endif
    endif
endif

if g:settings.plugin_manager == 'dein'
    source ~/.config/nvim/plugin_manager/pm_dein.vim
else 
    if g:settings.plugin_manager == 'neobundle'
	source ~/.config/nvim/plugin_manager/pm_neobundle.vim
    endif
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
tnoremap <C-w>: <C-\><C-n>:
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
let g:pymode_lint_ignore = "E501,E265"
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

if g:settings.plugin_manager == 'neobundle'
    NeoBundleCheck
endif
