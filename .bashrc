# .bashrc

####################################################################################################
## BATCH-MODE CONFIG
####################################################################################################

function JOIN_WITH_COLONS() {
  /bin/echo "$@" | perl -ne '
      push @tokens, split(/\s+/);
      END { print join ":", @tokens; }'
}

export PATH="$(JOIN_WITH_COLONS '
  ~/gbin
  ~/bin
  ~/bin/coreutils

  /usr/brew/bin

  ~/.rbenv/bin
  ~/.rbenv/shims

  ~/.iterm2

  /usr/local/bin
  /usr/local/sbin
  /usr/bin
  /usr/sbin
  /bin
  /sbin

  ~/google-cloud-sdk/bin
')"

# COREUTILS is used as a flag in the ~/bin/coreutils directory to switch which version is executed
# for various command-line utilities: the BSD versions pre-installed on MacOS, or the GNU versions
# that are pre-installed on most Linux distros. The slight variations in flags and behavior can
# break scripts written for the other platform. Generally, I find the GNU versions to be superior,
# since the ary more flexible on flag ordering, and typically provide a super-set of functionality.
#
# To get the GNU tools on Mac via use this switching logic, simply install tools like "which" as
# into /usr/local/bin/gwhich. TODO(ddopson): document the Homebrew install steps, which I've long
# since forgotten; I don't really run scripts on MacOS anymore.
export COREUTILS='gnu'

# If not running interactively, don't do anything past this point
[ -z "$PS1" ] && return


####################################################################################################
## INTERACTIVE CONFIG
####################################################################################################

# Use EXECIGNORE to hide binaries from auto-complete where they alias a script prefix.
#
# For example, I want "bbo" to immediately auto-complete as "bbo-blaze-build-c-opt";
# however, if "bbox" is on the PATH, then auto-complete instead pops an ambiguity
# resolution menu, breaking my flow.
#
# Ideally, "bbox" would only be hidden from auto-complete, allowing "bbox" to still run
# as a command, but unfortunately, EXECIGNORE blocks both auto-complete *and* execution.
# For a tool like bbox, which I never use, and only discovered via auto-complete menus,
# losing easy $PATH access is a pefectly acceptable trade-off for improving my daily flow.
#
# Note that bbox is only blocked from $PATH discovery, and would run as /usr/bin/bbox.
#
# To avoid accidentally regressing scripts, EXECIGNORE is deliberately *NOT* exported.
#
EXECIGNORE="$(JOIN_WITH_COLONS '
    /usr/bin/bbox
    /usr/bin/fix-qdf
')"

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

# Ant color support on MacOS
if [ `uname` = "Darwin" ]; then
  alias ant=ant-wrapper.sh
fi

alias cdp='cd -P $(pwd)'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd......='cd ../../../../..'
alias cd.......='cd ../../../../../..'
alias echo_result="echo true || echo false"  # use it like "[ ... some test ... ] && echo_result"

alias bashrc='source ~/.profile'

if [ -x ~/refresh-creds ]; then
  # This is only used on my corporate workstation.
  ~/refresh-creds
fi

if [ -d ~/google-cloud-sdk ]; then
  source ~/google-cloud-sdk/path.bash.inc
  source ~/google-cloud-sdk/completion.bash.inc
fi

# Make a nice prompt
eval $(~/bin/prompt)

if [ "$TERM" = "screen" ]; then
  # Fix issues w/ VIM handling "screen" in bonkers ways.
  TERM=xterm-256color
fi


alias ws1='cd ${PWD/ws?/ws1}'
alias ws2='cd ${PWD/ws?/ws2}'
alias ws3='cd ${PWD/ws?/ws3}'
alias ws4='cd ${PWD/ws?/ws4}'
alias ws5='cd ${PWD/ws?/ws5}'
alias ws6='cd ${PWD/ws?/ws6}'
alias ws7='cd ${PWD/ws?/ws7}'
alias ws8='cd ${PWD/ws?/ws8}'
