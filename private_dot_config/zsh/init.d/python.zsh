scripts_dir=${ZDOTDIR:-~}/zsh_init_scripts/python

pyenv_script=$scripts_dir/pyenv.zsh
anaconda_script=$scripts_dir/anaconda3.zsh


# load in the right order
[[ ! -f $pyenv_script ]] || source $pyenv_script
[[ ! -f $anaconda_script ]] || source $anaconda_script

# get out of conda base env :eyeroll:
if type conda &> /dev/null; then
    conda deactivate
    conda deactivate  # just to make sure
fi
