#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Carota <quanglh1508@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# `o` with no arguments opens the current directory, otherwise opens the given
# location
function o() {
  if [ $# -eq 0 ]; then
    open .;
  else
    open "$@";
  fi;
}

### Things for Vi mode
# Remove mode switching delay
KEYTIMEOUT=1

### kitty
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[cursor]=underline


### Completions Folder
export ZSH_COMPLETIONS_DIR=/usr/local/share/zsh/site-functions
function completions-refresh() {
  rm -rf ~/.zcompcache ~/.zcompdump ~/.zcompdump.zwc
  compinit
}

### Cheat.sh
function cheat {
  if [ "$1" = ":update" ]; then
    _install_cht.sh
  else
    cht.sh "$@"
  fi
}

### fasd
eval "$(fasd --init auto)";

### PATH
# Golang
export GOPATH="$HOME/go"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$GOPATH/bin"
export GO111MODULE=on

# FoundationDB
export PATH="$PATH:/home/quangle/Documents/fdb_binaries"

PATH=$PATH:/home/quangle/.local/bin

# Java
# JAVA_HOME=/usr/java/jdk1.8.0_201-amd64/
# PATH=$PATH:$HOME/bin:$JAVA_HOME/bin
# export JAVA_HOME
# export PATH

# Using vimx as x (only linux)
case `uname` in
  Linux)
    alias vim=vimx
  ;;
esac


PROMPT='%{$fg[yellow]%}[%D{%f/%m/%y} %D{%L:%M:%S}]'$PROMPT
