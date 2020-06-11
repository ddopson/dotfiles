#!/bin/bash

cd
T=$(date +%s)
BASE=dotfiles

function backup_and_link() {
  F="$1"
  TARGET="$BASE/$F"
  if [ "$(readlink $F)" = "$TARGET" ]; then
    return
  fi
  if [ -e "$F" ]; then
    echo "Backing up $F as $F.bak.$T"
    mv "$F" "$F.bak.$T"
  fi
  echo "Linking $F -> $TARGET"
  ln -snf "$TARGET" "$F"
}

backup_and_link .bashrc
backup_and_link .profile
backup_and_link .gitconfig
backup_and_link .git5rc
backup_and_link .hgrc
backup_and_link .inputrc
backup_and_link .irbrc
backup_and_link .vim
backup_and_link .vimrc
backup_and_link .selected_editor
backup_and_link bin

# Ensure .ssh dir sanity
mkdir -p ~/.ssh
chmod 755 ~/.ssh
touch ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys

# Local github files
touch ~/.gitconfig.local
chmod 600 ~/.gitconfig.local
touch ~/.gitcookies
chmod 600 ~/.gitcookies
touch ~/.netrc
chmod 600 ~/.netrc


if grep user ~/.gitconfig.local >/dev/null; then
  echo "Looks good: ~/.gitconfig.local"
else
  echo "TODO: configure ~/.gitconfig.local. For example:"
  echo "[user]"
  echo "  user = ddopson"
  echo "  name = Dave Dopson"
  echo "  email = ddopson@gmail.com"
fi

if grep machine ~/.netrc >/dev/null; then
  echo "Looks good: ~/.netrc"
else
  echo "TODO: configure ~/.gitconfig.local. For example:"
  echo "  machine github.com"
  echo "  login ddopson@gmail.com"
  echo "  password [WHAT PASSWORD?]"
fi

if grep "Checking cred status" ~/refresh-creds >/dev/null; then
  echo "Looks good: ~/refresh-creds"
else
  echo "Remember to copy ~/refresh-creds"
fi

echo
echo "To install iTerm2 integration:"
echo "curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash"
