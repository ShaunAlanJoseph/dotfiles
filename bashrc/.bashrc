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

# basic shell prompt
PS1='[\u@\h \W]\$ '

# starship prompt
eval "$(starship init bash)"
