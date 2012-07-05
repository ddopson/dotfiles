
export PATH=~/bin:/usr/local/coreutils:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/sbin


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
