#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# aliases
alias ls='ls --color=auto'
alias la='ls -a --color=auto'
alias grep='grep --color=auto'
alias py=python
alias py3=python3
alias i='yay -S'
alias s='yay -Ss'
alias r='yay -Rns'
alias hpe='hyprctl dispatch exec'

# basic shell prompt
PS1='[\u@\h \W]\$ '

# starship prompt
eval "$(starship init bash)"

# smarter cd command
eval "$(zoxide init --cmd cd bash)"

# pipx
export PATH="$PATH:$HOME/.local/bin"
eval "$(register-python-argcomplete pipx)"

# flutter
export PATH="$PATH:$HOME/.local/bin/flutter/bin"

# venv_wrapper - # See https://gist.github.com/dbtek/fb2ddccb18f0cf63a654ea2cc94c8f19

export VENV_HOME="$HOME/virtual_environments"
[[ -d $VENV_HOME ]] || mkdir -p $VENV_HOME

lsvenv() {
  ls -1 "$VENV_HOME"
}

venv() {
  if [ $# -eq 0 ]; then
    echo "Please provide venv name"
  elif [ -d "$VENV_HOME/$1" ]; then
    source "$VENV_HOME/$1/bin/activate"
  else
    echo "Virtual environment '$1' does not exist."
  fi
}

mkvenv() {
  if [ $# -eq 0 ]; then
    echo "Please provide venv name"
  else
    if [ -d "$VENV_HOME/$1" ]; then
      echo "Virtual environment '$1' already exists."
    else
      echo "Creating venv under $VENV_HOME/$1"
      python3 -m venv "$VENV_HOME/$1"
      echo "Activating $1"
      venv "$1"
    fi
  fi
}

rmvenv() {
  if [ $# -eq 0 ]; then
    echo "Please provide one or more venv names"
  else
    current_venv=$(basename "${VIRTUAL_ENV:-}")
    for env in "$@"; do
      if [ -d "$VENV_HOME/$env" ]; then
        if [ "$env" = "$current_venv" ]; then
          deactivate
          echo "Deactivated current virtual environment '$env'."
        fi
        rm -rf "$VENV_HOME/$env"
        echo "Virtual environment '$env' removed."
      else
        echo "Virtual environment '$env' does not exist."
      fi
    done
  fi
}

complete -C lsvenv venv
complete -C lsvenv rmvenv
