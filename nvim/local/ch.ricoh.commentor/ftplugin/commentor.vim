if !has('python') && !has('python3')
    echo "Error: Requires vim compiled with +python or +python3"
    echo "  or neovim python packages installed for nvim (pip install neovim)"
    finish
endif 

let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let s:comm = s:path.'/commentor.py'

if has('python') 
    execute 'pyfile' . s:comm
elseif has('python3')
    execute 'py3file' . s:comm
endif
