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


