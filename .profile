export COREUTILS='gnu'
export PATH="$(/bin/echo '
  ~/bin
  ~/bin/coreutils
  ~/.rbenv/bin/
  ~/.rbenv/shims/
  /usr/local/coreutils

  /usr/local/bin
  /bin
  /usr/bin

  /usr/local/sbin
  /sbin
  /usr/sbin
  ' | /usr/bin/perl -ne 'm/([^\s]+)/ and push @a, $1; END { print join ":", @a; }')"

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi


