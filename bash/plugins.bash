# dircolors
if [[ "$(tput colors)" == "256" ]]; then
    eval "$(dircolors ~/.shell/plugins/dircolors-solarized/dircolors.256dark)"
fi

#z
. ~/.libs/z/z.sh

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
