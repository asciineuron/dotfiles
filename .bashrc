#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
PS1='[\[\e[0;34m\]\u\[\e[m\]@\[\e[0;32m\]\h\[\e[m\] \[\e[0;33m\]\W\[\e[m\]]\$ '
