import vim
import re
from sys import version_info

__py_version = version_info.major == 3 and '3' or ''


class Commentor(object):
    def __init__(self, cstr):
        self._cstr = cstr + '~ '

    def all_comment(self, s, st, en):
        for i in range(st, en):
            if self._cstr not in s[i]:
                return False
        return True

    def toggle_comment(self):
        r = vim.current.range
        rlen = r.end - r.start + 1
        ac = self.all_comment(r, 0, rlen)
        for i in range(0, rlen):
            r[i] = r[i].replace(self._cstr, '')
        if not ac:
            for i in range(0, rlen):
                r[i] = re.sub(r'^(\s*)', r'\1{0}'.format(self._cstr), r[i])


class CommentorRegistry(object):
    def __init__(self, name):
        from sys import version_info
        self.__registry = {}
        self.__py_version = version_info.major == 3 and '3' or ''
        self.__name = name

    def set_commentor(self, lang, *args, commentor_cls=Commentor):
        self.__registry[lang] = commentor_cls(*args)

    def add_commentor(self, lang, *args, commentor_cls=Commentor):
        if lang not in self.__registry:
            self.set_commentor(lang, *args, commentor_cls=commentor_cls)

    def activate_commentor(self, lang):
        if lang in self.__registry:
            cmd = ("{mode}map <Leader>' :py{version} "
                   "{reg_name}['{lang}'].toggle_comment() <CR>")
            vim.command(cmd.format(mode='n', version=self.__py_version,
                                   reg_name=self.__name, lang=lang))
            vim.command(cmd.format(mode='v', version=self.__py_version,
                                   reg_name=self.__name, lang=lang))

    def set_lang(self, lang, cstr):
        self.add_commentor(lang, cstr)
        self.activate_commentor(lang)

    @property
    def registry(self):
        return self.__registry

    def __getitem__(self, lang):
        return self.__registry[lang]


if __name__ == '__main__':
    if 'commentor_reg' not in vars():
        commentor_reg = CommentorRegistry('commentor_reg')
    create_function = \
        ('if !exists("*CommentorSetLang")\n'
         '  function CommentorSetLang(lang, cstr)\n'
         '    py{v} commentor_reg.set_lang('
         'vim.eval("a:lang"), vim.eval("a:cstr"))\n'
         '  endfunction\n'
         'endif').format(v=__py_version)
    vim.command(create_function)
