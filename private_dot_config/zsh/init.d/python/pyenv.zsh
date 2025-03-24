if type pyenv &> /dev/null; then
    export PYENV_ROOT=$HOME/.pyenv
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    # which pyenv && pyenv virtualenvwrapper_lazy || source virtualenvwrapper_lazy.sh > /dev/null

    source $(pyenv prefix $(pyenv version-name))/bin/virtualenvwrapper.sh
fi
