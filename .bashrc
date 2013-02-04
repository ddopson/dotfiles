# .bashrc

####################################################################################################
## BATCH-MODE CONFIG
####################################################################################################

export COREUTILS='gnu'
export PATH="$(/bin/echo '
  ~/bin
  ~/bin/coreutils

  ~/.rbenv/bin
  ~/.rbenv/shims

  /usr/local/bin
  /usr/local/sbin
  /usr/bin
  /usr/sbin
  /bin
  /sbin
  ' | /usr/bin/perl -ne 'm/([^\s]+)/ and push @a, $1; END { print join ":", @a; }')"



# If not running interactively, don't do anything past this point
[ -z "$PS1" ] && return


####################################################################################################
## INTERACTIVE CONFIG
####################################################################################################

if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# Set up some Ruby constants for 'better' performance
export RUBY_HEAP_MIN_SLOTS=500000
export RUBY_HEAP_SLOTS_INCREMENT=250000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=50000000

# Ant color support on MacOS
if [ `uname` = "Darwin" ]; then 
  alias ant=ant-wrapper.sh
fi

alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd......='cd ../../../../..'
alias cd.......='cd ../../../../../..'

if [ -e /usr/local/bin/gwhich ]; then
  alias which="(alias; declare -f) | /usr/local/bin/gwhich --tty-only --all --read-functions --read-alias --show-dot --show-tilde"
else
  alias which="/usr/bin/which -a"
fi
alias bashrc='source ~/.profile'
alias cuke='time bundle exec cucumber'


eval `prompt`
#PS1='\n\[\033[0;37;41m\]\u\[\033[0;37;41m\]@\[\033[1;93;41m\]\h\[\033[0;30;47m\]:\[\033[1;37;44m\]\w\[\033[0;m\] \[\033[0;30;47m\]#\!\[\033[0;m\] '
