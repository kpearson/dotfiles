Dotfiles
========

Kit Pearson 2015

## Symlinks
The `link-rcfile` script takes care of symlinking the rc-files to the root
directory for the most part. All files with names ending in _rc_, in the same
directory and one level down will be symlinked to your root directory. The
script can be run multiple time and will not affect links, files or directories
in place in your root folder. It is important to look the script to know whats
going on and to confirm the names of the directory paths on your particular
system are correct. i.e. .dotfiles compared to dotfiles

### Zsh shell

Brew installed.

Once installed the brew version of zsh needs to
be added to `/etc/shells` file, before switching the default shell to the brew
installed version of zsh.

To do this:
Run `which zsh`. The value returned is what needs add to `/etc/shells`.

Open the `/etc/shells` with root write access.

```shell
sudo vim /etc/shells
```

Add to the end of the file:

```
/usr/local/bin/zsh
```

Now it's possible to set the brew installed version of Zsh as the default shell.

```shell
chsh -s /usr/local/bin/zsh
```

### Antigen

[Antigen] is the package manager I use to manage Zsh bundles.

Confirm the path the to `antigen.zsh` in the `zsh.rc` file.

The antigen directory is a git submodule. If the dotfiles were not cloned with
the recursive strategy run `git submodule init` and `git submodule update` form
inside the dotfiles directory.

### iTerm

Brew cask installed.

#### iTerm Settings:

- Confirm 256 color in setting / Profile tab / Terminal / Terminal Emulation /
  Report Terminal Type = xterm-256color.

- Set new session directory to reuse previous session in Settings /
  Profile tab / General / Working Directory.

### Vim

My [Vimfiles](www.github.com/kpearson/vimfiles/) are in there own repo. The
install script clones them in and creates the appropriate links. If have your
own Vim setup in place and would link to user mine, move your current `.vim`
directory to different location or rename it and run install.

### rbenv

Brew installed with: `brew install rbenv`.

Insure at least one ruby version is installed: `which ruby` should return the
brew rbenv location. ` `rbenv install 2.2.3`.

Then set that Ruby version to default: `rbenv global 2.2.3`.

Now ruby gems can be installed in the correct location.

_Already in place in the current dotfiles._
If this is your first time installing [rbenv] you'll need to include two lined
in your `.zshrc` or `.bash_profile` file (depending on your shell):

```shell
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
```

Confirm the install by opening a new session (a new tab will do it) and run:
```shell
$ type rbenv
```

You should see some version of `rbenv is a function`.

### Aliases

Most shell aliases are managed thru [Antigen] bundles. The ones I create and
manage are located in `$HOME/dotfiles/aliases` and added to the shell session
in the `.zshrc`.

### Global Key-bindings

I try to contain as many of my key-bindings in the Karabiner app as possible.
The others I try to keep track of here. While their are many ways to
go about this I like having them all in a centralized location with scriptable
interface.

With the hhkb I map _command+esc_ to _command+`_ so I can cycle beteween windows.
Set this with:

1. System Preferences, click Keyboard, then click Shortcuts.

2. Open the Shortcuts pane for me

3. Double-click the current shortcut, then press the new
   key combination you want to use.

#### Karabiner

With Karabiner installed:

To load setting from these dot files run the karabiner script with:
```shell
sh @HOME/dotfiles/karabiner`
```

To export current karabiner setting run:
```shell
/Applications/Karabiner.app/Contents/Library/bin/karabiner export > $HOME/dotfiles/karabiner-settings
```

Note: The Karabiner cli is not included in the load path. The path to where it
is installed must match your current install. Also this creates a new file at
the top level of the dotfiles directory named karabiner and will __overwright__
an existing version of same.

### Tmux

At the moment I am not using [Tmux] on a daily basis. However this set of
dotfiles contains extensive support Tmux. See the `tmux.conf`. Vim
configurations are located in `/dotfiles/vim/rcplugings/tmux`.

## New Mechine Notes

Install xcode or command line tools

## Other brew installed app

Applications I user at the moment. More uptodate list in the accompaning
_Brewfile_.

Name | Discription
--- | ---
[1password](https://agilebits.com/onepassword) | Password manager
[Atom](https://atom.io/) | Text editor
[Dash](https://kapeli.com/dash) | Offline documentation
[Google-chrome](https://www.google.com/chrome/browser/desktop/) | Web browser
[Silverlight](https://www.microsoft.com/silverlight/) | Web browser extension required for watching video
[Alfred](https://www.alfredapp.com/) | Productivity application
[Bartender](https://www.macbartender.com/) | Hide links in the menu bar
[Dropbox](https://www.dropbox.com/) | Cloud storage
[Slack](https://slack.com/) | Chat application
[spectacleapp](https://www.spectacleapp.com/) | Window management app

[Homebrew]: http://brew.sh/
[Vundle]: https://github.com/VundleVim/Vundle.vim
[Antigen]: https://github.com/zsh-users/antigen
[rbenv]: https://github.com/rbenv/rbenv
[Vim]: http://www.vim.org/
[Tmux]: https://tmux.github.io/
[iTerm2]: https://www.iterm2.com/
[Cask]: https://github.com/caskroom/homebrew-cask
[MacVim]: https://github.com/b4winckler/macvim
[Karabiner]: /Applications/Karabiner.app/Contents/Library/bin/karabiner
