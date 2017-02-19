execute 'so' . fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/commentor.vim'
call CommentorSetLang('c', '//')
