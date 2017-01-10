if test -x "$(command -v verdi)"; then
    eval "$(verdi completioncommand)"
    verdi daemon start &> /dev/null
fi
