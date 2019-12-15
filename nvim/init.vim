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
    if isdirectory(expand('~/.config/nvim/dein/repos/github.com/Shougo/dein.vim'))
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

set tabstop=4
set shiftwidth=4
set expandtab

filetype plugin indent on
set autoindent
set smartindent
set shiftwidth=4
syntax enable
augroup FTtab
    autocmd! Filetype python set tabstop=4|set shiftwidth=4|set expandtab
    autocmd! Filetype rst set tabstop=3|set shiftwidth=3|set expandtab
augroup END set incsearch set virtualedit=all

function! RicohSetAppearance()
    set cursorline
    hi CursorLine cterm=underline gui=underline ctermbg=Black guibg=Black
    hi notesSingleQuoted ctermfg=LightBlue guifg=LightBlue
    hi pythonStatement ctermfg=172 cterm=bold guifg=#ff9a40 gui=bold
    hi pythonDocstring ctermfg=45 guifg=#54cddd
    hi Todo ctermfg=1 guifg=#ff0000
endfunction
augroup Appearance
    autocmd! ColorScheme call RicohSetAppearance()
augroup END

" appearance (Terminal)
if !has('gui')
    colorscheme vorange
endif

set relativenumber
set number

"Customizing the NERDTree
let NERDChristmasTree=1
let NERDTreeHijackNetrw=1
let NERDTreeShowBookmarks=1
nmap <C-u>n :NERDTreeToggle<Cr>

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
augroup LatexMaps
    autocmd! Filetype latex,tex imap <C-l><C-p> <Plug>LatexCloseCurEnv
augroup END

"waf meta build system
augroup WafFt
    autocmd! BufEnter wscript set filetype=python
augroup END

"ricoh.commentor2
map <Leader>' <Plug>CommentLines

"pymode
augroup PyMode
    autocmd! Filetype python let g:pymode_rope_complete_on_dot = 0
    autocmd! Filetype python let g:pymode_lint_ignore = "E501,E265,W0105,C0301,W0612"
    autocmd! Filetype python let g:pymode_lint_checkers = ['pylint', 'pep8']
    autocmd! Filetype python let g:pymode_lint=0 "off by default
    autocmd! Filetype python map <Leader>l :PymodeLint
augroup END

augroup Syntastic
    autocmd Filetype python let g:syntastic_python_checkers = ['flake8']
    autocmd Filetype python let g:syntastic_python_flake8_args = '--ignore=E501,E225'
    autocmd Filetype python let g:syntastic_mode_map['mode'] = 'passive'
    autocmd Filetype tex let g:syntastic_tex_checkers = ['chktex']
augroup END

"pymode
let g:pymode_lint_on_write=0

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

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

if &diff
    nnoremap <Leader>dgr :diffget REMOTE<CR> :diffup<CR>
    nnoremap <Leader>dgl :diffget LOCAL<CR> :diffup<CR>
    nnoremap <Leader>dgb :diffget BASE<CR> :diffup<CR>
    nnoremap <Leader>du :diffup<CR>
endif

"Unite
nnoremap <C-u>f :Unite file<CR>
nnoremap <C-u>b :Unite buffer<CR>

"language server
set hidden
let g:LanuageClient_serverCommands = {
    \ 'python': ['pyls'],
\ }


call RicohSetAppearance()
