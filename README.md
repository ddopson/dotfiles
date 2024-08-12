Dave Dopson's Dotfiles
==========

Installation
----------
````bash
cd
git clone https://SECRET_TOKEN@github.com/ddopson/dotfiles.git
./dotfiles/setup.sh # symlink dotfiles, making dated backups of existing versions
````

Note that the old mechanism of password access no longer works with GitHub, so
one has to create auth tokens to be able to push to a GitHub repo from the
command-line. Microsoft has made an enormously complicated token system, but the
old "heavyweight" tokens are still supported, and the only way I've found so far
for storing that token is above, in the URL of the repo during cloning (or by
editing the "origin" afterwards, but cloning is easier).

Customization
----------

**`~/.gitconfig.local:`**
````
[user]
  user = ddopson
  name = Dave Dopson
  email = ddopson@gmail.com

[credential]
  helper = cache
````

New MacBook Checklist
----------

Add Software:
* Install Dvorak
* Install [iTerm2](https://iterm2.com/).
  * "Appearance=>Show per-pane title bar"=false
  * "Profiles=>Terminal=>Scrollback"=20000
  * "Profiles=>Terminal=>Silence Bell"=true
  * "Profiles=>Session=>Prompt Before Closing"=Always
  * "Pointer=>Focus Follows Mouse"=true
* Install [Spotify](https://www.spotify.com/de-en/download/mac/)
* Install Divvy - App Store

Map CapsLock => Escape (useful for my Vim bindings):
* "Keyboard" => "Keyboard Shortcuts..." => "Modifier Keys"

Disable trigger-happy trackpad actions:
* Trackpad => "Tap to click" = false
* Trackpad => "More Gestures" tab => "Swipe between pages" = Off
