
#prompt...

PS1='\w#>'

#aliases...

alias LS='ls'
alias ls='ls -AG'



#/scripts setup stuff...

export PATH=~/bin:/usr/local/bin:/usr/local/coreutils:$PATH:/scripts:/usr/local/mysql/bin:

if [[ -f ~/.scripts-aliases ]]; then
	. ~/.scripts-aliases;
fi;

complete -Clsscript mkscript
alias ant='/workspace/SDK/ant-wrapper.sh'
alias ant=/workspace/SDK/bin/ant-wrapper.sh
alias cd.='cd ..'
alias cd..='cd ../..'
alias cd...='cd ../../..'
alias cd....='cd ../../../..'
alias cd.....='cd ../../../../..'
alias cd......='cd ../../../../../..'

alias bashrc='source ~/.bashrc'

eval `prompt`

source ~/.npm-completions
