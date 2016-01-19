Dave Dopson's Dotfiles
==========

Installation
----------
````bash
cd
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

**`~/.netrc:`**
````
machine github.com
login ddopson@gmail.com
password SECRET_PASSWORD
````

Pushing (for me)
----------
**`~/.netrc:`**
````
machine github.com
login ddopson@gmail.com
password 1234567891
````
