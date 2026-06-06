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
 * Open https://github.com/settings/personal-access-tokens/new (ie, "GitHub Settings" -> "Developer settings" -> "Personal access tokens" -> "Fine-grained tokens" -> "Generate new token")
 * Set time to unlimited, add the dotfiles repo, and add the "Contents" permission with Read/Write access. Generate the secret.

 * Running `git push` prompts for username / password.
 * Use the token as the "password".
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
