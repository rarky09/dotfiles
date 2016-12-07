source $HOME/.zplug
source $HOME/.zshmac

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

#theme
export CLICOLOR=1
autoload -Uz promptinit
  promptinit
  prompt pure
zstyle ':completion:*' list-colors di=34 ln=35 ex=31

# peco
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection


# alias
alias rma='rm -rf'
alias la='ls -al'
alias re='exec $SHELL -l'
alias r=rails
alias g=git
alias ga='git add .'


function chpwd() { ls -G -F}

function gacp() {
    git add .
    git commit -m "$1"
    git push
}

