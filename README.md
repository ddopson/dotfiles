Dave Dopson's Dotfiles
==========

Installation
----------
````bash
cd
git init
git remote add origin https://github.com/ddopson/dotfiles.git
git fetch
git checkout master
````

Customization
----------

==== Add your github creds

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
````bash
WAT=google_desktop
ssh-keygen -t dsa -N '' -f ~/.ssh/${WAT}_id_dsa
cat ~/.ssh/${WAT}_id_dsa.pub
cp ~/.ssh/${WAT}_id_dsa.pub ~/.ssh_keys_pub
git add ~/.ssh_keys_pub
git commit -m "add pub key"

# open https://github.com/settings/ssh

git remote set-url --push origin git@github.com:ddopson/dotfiles.git
````
