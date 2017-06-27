source $HOME/.zplug
source $HOME/.zshmac

#  language
export LANGUAGE="en_US.UTF-8"
export LANG="${LANGUAGE}"
export LC_ALL="${LANGUAGE}"
export LC_CTYPE="${LANGUAGE}"

# env
export XDG_CONFIG_HOME=$HOME/.config

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

function peco-z-search
{
  which peco z > /dev/null
  if [ $? -ne 0 ]; then
    echo "Please install peco and z"
    return 1
  fi
  local res=$(z | sort -rn | cut -c 12- | peco)
  if [ -n "$res" ]; then
    BUFFER+="cd $res"
    zle accept-line
  else
    return 1
  fi
}
zle -N peco-z-search
bindkey '^f' peco-z-search


# alias
alias rma='rm -rf'
alias la='ls -al'
alias re='exec $SHELL -l'
alias ra=rails
alias g=git
alias ga='git add .'
alias be='bundle exec'
alias r='rmtrash'
alias ss='subl .'
alias s=subl
alias c='z Code'
alias bi='bundle install'
alias rdm='rails db:migrate'
alias jn='jupyter notebook'

function chpwd() { ls -G -F}

function gacp() {
    git add .
    git commit -m "$1"
    git push
}

