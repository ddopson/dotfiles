
export PATH="$(/bin/echo '
  ~/bin
  ~/.rbenv/shims/
  /usr/local/coreutils

  /usr/local/bin
  /bin
  /usr/bin

  /usr/local/sbin
  /sbin
  /usr/sbin
  ' | /usr/bin/xargs /bin/echo | /usr/bin/sed 's/ /:/g')"

export RUBY_HEAP_MIN_SLOTS=500000
export RUBY_HEAP_SLOTS_INCREMENT=250000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=50000000

complete -Clsscript mkscript
alias ant='/workspace/SDK/ant-wrapper.sh'
alias ant=/workspace/SDK/bin/ant-wrapper.sh
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd......='cd ../../../../..'
alias cd.......='cd ../../../../../..'

if [ -e /usr/local/bin/gwhich ]; then
  alias which='alias | /usr/local/bin/gwhich --tty-only --read-alias --show-dot --show-tilde'
fi
alias bashrc='source ~/.profile'

eval `prompt`
