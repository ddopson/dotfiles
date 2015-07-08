Dave Dopson's Dotfiles
==========

Installation
----------
````bash
cd
git init
git clone https://github.com/ddopson/dotfiles.git
./dotfiles/setup.sh # symlink dotfiles, making dated backups of existing versions
````

Customization
----------

**`~/.gitconfig.local:`**
````
[user]
  user = ddopson
  name = Dave Dopson
  email = ddopson@gmail.com

[credential]
  helper = osxkeychain

[git-working-branch]
  username = ddopson
  token = a123uber456secret789ceprivate000key78
````

Pushing (for me)
----------
<h4> ssh-keygen </h4>
````bash
WAT=google_desktop
ssh-keygen -t dsa -N '' -f ~/.ssh/${WAT}_id_dsa
ln -s ${WAT}_id_dsa .ssh/id_dsa
cat ~/.ssh/${WAT}_id_dsa.pub
cp ~/.ssh/${WAT}_id_dsa.pub ~/.ssh_keys_pub
git add ~/.ssh_keys_pub
git commit -m "add pub key"
````

<h4> Add key to github </h4>
https://github.com/settings/ssh

<h4> Push </h4>
````bash
git remote set-url --push origin git@github.com:ddopson/dotfiles.git
git push
````
