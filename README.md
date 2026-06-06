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

# Setting credentials.helper to `store` means that when `git` prompts for a
# username/password challenge, the supplied password gets saved, in plaintext,
# to ~/.git-credentials. Alternatively, `cache` causes `git` to retain the
# credential in RAM for up to 15 minutes before purging it, more like `sudo`.
[credential]
  helper = store
````

To get a GitHub access token:
 * "GitHub Settings" -> "Developer settings" -> "Personal access tokens"
 * A simple legacy token with unlimited lifetime is easiest, if less secure.
 * The token can be provided to `git` as the "password" during the command-line
   username/password challenge
 * The `git` tooling stores the secret in ~/.git-credentials, when configured
   with "helper = store".

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

Pushing to Repo
----------

From https://github.com/settings/token, "Generate new token" and create a classic token.

Running `git push` prompts for username (eg, "ddopson@gmail.com") and password. Provide the secret token as the password.

This caches the token in the repo (maybe?), such that subsequent pushes work.
