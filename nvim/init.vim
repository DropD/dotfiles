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
set scrolloff=10 " thanks, Ben!

filetype plugin indent on
set autoindent
set smartindent
set shiftwidth=4
syntax enable
augroup FTtab
    autocmd!
    autocmd Filetype python set tabstop=4|set shiftwidth=4|set expandtab
    autocmd Filetype rst set tabstop=3|set shiftwidth=3|set expandtab
augroup END set incsearch set virtualedit=all

function! RicohSetAppearance()
    set cursorline
    hi CursorLine cterm=underline gui=underline ctermbg=Black guibg=Black
    hi notesSingleQuoted ctermfg=LightBlue guifg=LightBlue
    hi pythonStatement ctermfg=172 cterm=bold guifg=#ff8040 gui=bold
    hi pythonDocstring ctermfg=45 guifg=#54cddd
    hi Todo ctermfg=1 guifg=#ff0000
endfunction
augroup Appearance
    autocmd!
    autocmd ColorScheme call RicohSetAppearance()
augroup END

augroup YamlTab
    autocmd!
    autocmd Filetype yaml set tabstop=2|set shiftwidth=2|set expandtab
augroup END

" completion
let g:ycm_key_list_select_completion=['<Down>']

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsEditSplit="vertical"

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

"airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_powerline_fonts=1
let g:airline_theme='badwolf'

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
    autocmd!
    autocmd Filetype latex,tex imap <C-l><C-p> <Plug>LatexCloseCurEnv
augroup END

"waf meta build system
augroup WafFt
    autocmd!
    autocmd BufEnter wscript set filetype=python
augroup END

augroup SConsFt
    autocmd!
    autocmd BufEnter SConstruct set filetype=python
    autocmd BufEnter *.scons set filetype=python
augroup END

"augroup CmakeFt
"    autocmd!
"    autocmd BufEnter CMakeLists.txt set filetype=cmake
"augroup END

augroup MesonFt
    autocmd!
    autocmd BufEnter meson.build set filetype=meson
augroup END

"ricoh.commentor2
map <Leader>' <Plug>CommentLines

"lclorlint
function LclOrLint() abort
    if len(getloclist(0))
        call setloclist(0, [])
        lcl
    else
        ":call pymode#lint#check()
        :PymodeLint
    endif
endfunction

"pymode
let g:pymode_rope=1
"call pymode#virtualenv#init()
"call pymode#virtualenv#activate("/Users/ricoh/.virtualenvs/py3.8")
augroup PyMode
    "autocmd! Filetype python call g:pymode_virtualenv_init("/Users/ricoh/.virtualenvs/py3.8")
    autocmd!
    autocmd Filetype python PymodeVirtualenv "/Users/ricoh/.virtualenvs/py3.8"
    autocmd Filetype python let g:pymode_rope = 1
    autocmd Filetype python let g:pymode_rope_lookup_project = 0
    autocmd Filetype python let g:pymode_rope_regenerate_on_write = 0
    autocmd Filetype python let g:pymode_rope_complete_on_dot = 0
    "autocmd Filetype python let g:pymode_lint_ignore = ['E265', 'W0105', 'C0301', 'W0612']
    autocmd Filetype python let g:pymode_lint_ignore = []
    autocmd Filetype python let g:pymode_lint_checkers = ['pyflakes', 'pylint', 'mccabe']
    autocmd Filetype python let g:pymode_lint_on_write = 0
    autocmd Filetype python let g:pymode_lint = 1 "on by default
    autocmd Filetype python let g:pymode_options_max_line_length = 99
    autocmd Filetype python let g:pymode_lint_options_pylint = {'max-line-length': g:pymode_options_max_line_length}
    autocmd Filetype python map <Leader>l :call LclOrLint()<CR>
    "autocmd Filetype python set foldmethod=indent
    autocmd Filetype python set foldmethod=expr
augroup END

augroup Syntastic
    autocmd! 
    autocmd Filetype python let g:syntastic_python_checkers = ['prospector']
    autocmd Filetype python let g:syntastic_python_flake8_args = '--ignore=E501,E225'
    autocmd Filetype python let g:syntastic_mode_map['mode'] = 'passive'
    autocmd Filetype tex let g:syntastic_tex_checkers = ['chktex']
    autocmd FileType c call ConsiderMesonForLinting()
    function ConsiderMesonForLinting()
        if filereadable('meson.build')
            let g:syntastic_c_checkers = ['meson']
        endif
    endfunction
augroup END

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

"neoterm
let g:neoterm_default_mod="vertical"
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
"language server
set hidden
let g:LanuageClient_serverCommands = {
    \ 'python': ['pyls'],
\ }

"Goyo
let g:goyo_width = 140


call RicohSetAppearance()

"--misc mappings

if &diff
    nnoremap <Leader>dgr :diffget REMOTE<CR> :diffup<CR>
    nnoremap <Leader>dgl :diffget LOCAL<CR> :diffup<CR>
    nnoremap <Leader>dgb :diffget BASE<CR> :diffup<CR>
    nnoremap <Leader>du :diffup<CR>
endif

"Denite
nnoremap <C-u>f :Denite file<CR>
nnoremap <C-u>b :Denite buffer<CR>
" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
    \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> d
    \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
    \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q
    \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> i
    \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space>
    \ denite#do_map('toggle_select').'j'
endfunction

"edit vimrc
nnoremap <Leader>ev :drop ~/.config/nvim/init.vim<CR>
nnoremap <Leader>evt :tabedit ~/.config/nvim/init.vim<CR>
nnoremap <Leader>evs :split ~/.config/nvim/init.vim<CR>
nnoremap <Leader>evv :vsplit ~/.config/nvim/init.vim<CR>

"edit plugins
nnoremap <Leader>ep :drop ~/.config/nvim/plugin_manager/pm_dein.vim<CR>
nnoremap <Leader>ept :tabedit ~/.config/nvim/plugin_manager/pm_dein.vim<CR>
nnoremap <Leader>eps :split ~/.config/nvim/plugin_manager/pm_dein.vim<CR>
nnoremap <Leader>epv :vsplit ~/.config/nvim/plugin_manager/pm_dein.vim<CR>

"edit local settings
nnoremap <Leader>es :drop ~/.config/nvim/local/settings.vim<CR>
nnoremap <Leader>est :tabedit ~/.config/nvim/local/settings.vim<CR>
nnoremap <Leader>ess :split ~/.config/nvim/local/settings.vim<CR>
nnoremap <Leader>esv :vsplit ~/.config/nvim/local/settings.vim<CR>

"un-highlight search
nnoremap <Leader><Space> :nohlsearch<CR>

"Toggle Goyo
nnoremap <Leader>g :Goyo<CR>

"easymotion
nmap , <Plug>(easymotion-prefix)

"terminal
tnoremap <C-w> <C-\><C-n><C-w>
tnoremap <C-w>: <C-\><C-n>:
map <Leader>tf ::<Del>TREPLSendFile<CR>
map <Leader>tl ::<Del>TREPLSendLine<CR>
map <Leader>ts ::<Del>TREPLSendSelection<CR>

"line numbers
nnoremap <Leader>nn :set number! number?<CR>
nnoremap <Leader>nr :set relativenumber! relativenumber?<CR>

"fzf
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fl :Lines<CR>
nnoremap <Leader>flb :BLines<CR>
nnoremap <Leader>fa :Ag<CR>
nnoremap <Leader>fc :Commits<CR>
nnoremap <Leader>fcb :BCommits<CR>
nnoremap <Leader>fh :History:<CR>
nnoremap <Leader>fhf :History<CR>
nnoremap <Leader>fhs :History/<CR>
nnoremap <Leader>fm :Maps<CR>
nnoremap <Leader>fg :GFiles?<CR>
