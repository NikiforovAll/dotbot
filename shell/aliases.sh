# Update dotfiles
dfu() {
    (
        cd ~/.dotfiles && git pull --ff-only && ./install -q
    )
}

# Use colors in coreutils utilities output
alias ls='ls --color=auto'
alias grep='grep --color'

# ls aliases
alias la='ls -A'
alias l='ls'
# alias ll="exa -l"
alias ll='ls -lah'

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias cd..="cd .."
alias :q="exit"
alias c="clear"
alias ch="history -c && > ~/.bash_history"
alias g="git"
alias m="man"
alias map="xargs -n1"
alias path='printf "%b\n" "${PATH//:/\\n}"'
alias q="exit"
# Shorter commands for the `Advanced Packaging Tool`
alias apti="sudo apt-get install"
alias aptr="sudo apt-get remove"
alias apts="sudo apt-cache search"
alias aptu="sudo apt-get update \
                && sudo apt-get upgrade"
alias local-ip="ifconfig \
                    | grep 'inet addr' \
                    | grep -v '127.0.0.1' \
                    | cut -d: -f2 \
                    | cut -d' ' -f1"

alias fd='find . -type d -name'
alias ff='find . -type f -name'
alias pf='cd $(fd -t d | fzf)'

# Create a directory and cd into it
mcd() {
    mkdir "${1}" && cd "${1}"
}

# Jump to directory containing file
jump() {
    cd "$(dirname ${1})"
}

# cd replacement for screen to track cwd (like tmux)
scr_cd()
{
    builtin cd $1
    screen -X chdir "$PWD"
}

if [[ -n $STY ]]; then
    alias cd=scr_cd
fi

# Go up [n] directories
up()
{
    local cdir="$(pwd)"
    if [[ "${1}" == "" ]]; then
        cdir="$(dirname "${cdir}")"
    elif ! [[ "${1}" =~ ^[0-9]+$ ]]; then
        echo "Error: argument must be a number"
    elif ! [[ "${1}" -gt "0" ]]; then
        echo "Error: argument must be positive"
    else
        for ((i=0; i<${1}; i++)); do
            local ncdir="$(dirname "${cdir}")"
            if [[ "${cdir}" == "${ncdir}" ]]; then
                break
            else
                cdir="${ncdir}"
            fi
        done
    fi
    cd "${cdir}"
}

# Execute a command in a specific directory
xin() {
    (
        cd "${1}" && shift && "${@}"
    )
}

# Check if a file contains non-ascii characters
nonascii() {
    LC_ALL=C grep -n '[^[:print:][:space:]]' "${1}"
}
