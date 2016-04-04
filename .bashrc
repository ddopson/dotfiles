# .bashrc

####################################################################################################
## BATCH-MODE CONFIG
####################################################################################################

export COREUTILS='gnu'
export PATH="$(/bin/echo '
  /google/data/ro/users/dd/ddopson/bin
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

  ~/google-cloud-sdk/bin
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

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# Don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# Append to the history file; don't overwrite it.
shopt -s histappend

# Sync with ~/.bash_history after every command. "-a" flushes to disk and "-n" loads from disk.
# See http://superuser.com/questions/211966/how-do-i-keep-my-bash-history-across-sessions
# With sync + histappend, commands typed in one window become instantly available to CTL-R in another window.
# Actually, scratch that; full sync is driving me crazy.  Better to have per-window history with a merged view
# for reloading history on login.
PROMPT_COMMAND='history -a'

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

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

alias cdp='cd -P'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd......='cd ../../../../..'
alias cd.......='cd ../../../../../..'
alias echo_result="echo true || echo false"  # use it like "[ ... some test ... ] && echo_result"

if [ -e /usr/local/bin/gwhich ]; then
  alias which="(alias; declare -f) | /usr/local/bin/gwhich --tty-only --all --read-functions --read-alias --show-dot --show-tilde"
else
  alias which="/usr/bin/which -a"
fi
alias bashrc='source ~/.profile'
alias cuke='time bundle exec cucumber'

# Google specific creds stuff ...
if [ -x /usr/bin/prodcertstatus ]; then
  if ! /usr/bin/prodcertstatus --check_remaining_hours 2.0; then
    prodaccess
  fi
fi

if [ -d ~/google-cloud-sdk ]; then
  source ~/google-cloud-sdk/path.bash.inc
  source ~/google-cloud-sdk/completion.bash.inc
fi

# Make a nice prompt
eval $(~/bin/prompt)
