#25-01-2018 10:32
# Add bin to path

export PATH="$PATH:/sbin:/usr/sbin:$HOME/bin:."

 #export PATH="$PATH:$HOME/bin"

# Dynamic resizing
shopt -s checkwinsize

# Custom prompt
#PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

#08-29-06 11:40

if [ `id -un` = root ]; then
    PS1='\[\033[38;5;11m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\h:\[$(tput sgr0)\]\[\033[38;5;10m\][\w]\[$(tput sgr0)\]\[\033[38;5;15m\]# \[$(tput sgr0)\]'
else
    PS1='\[\033[38;5;11m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\h:\[$(tput sgr0)\]\[\033[38;5;10m\][\w]\[$(tput sgr0)\]\[\033[38;5;15m\]: \[$(tput sgr0)\]'
fi
#

# Add color
eval `dircolors -b`

# User defined aliases
alias cls='clear'
alias ls='ls --color'
alias grep='grep --color'
alias cll='clear; ls'
alias l='ls'
alias ll='ls -la'
alias la='ls -A'
alias lsg='ls | grep'

#08-29-06 11:50

#To clean up and cover your tracks once you log off
#Depending on your version of BASH, you might have to use
# the other form of this command
trap "rm -f ~$LOGNAME/.bash_history" 0

#The older KSH-style form
#   trap 0 rm -f ~$LOGNAME/.bash_history
