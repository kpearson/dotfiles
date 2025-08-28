Dotfiles
========

Kit Pearson 2015 - 2025

Modern macOS development environment with vim-first workflow.

------

## Quick Start

Modern shell setup with performance optimizations:
- **powerlevel10k** - Ultra-fast async prompt with instant loading
- **carapace** - Advanced completions for 1000+ commands  
- **vim-first workflow** - Preserves existing vim integrations
- **Modern CLI tools** - ripgrep, fd, bat alongside traditional tools

## Installation

These dotfiles contain everything needed to set up a Mac from scratch.

Set up a new machine by running [Thoughtbot's laptop] script.

This repo includes a Brewfile with a fairly extensive list of apps. Read it
through and edit it before running the `setup` script.

To get a handle on what is about to be changed and installed on your machine
look at Thoughtbot's laptop] project, and `.laptop.local` in the root of this
repo. There is also script (`macos`) which directly configures the MacOS
environment. By default it does not run. To enable it run the script with
`--macos-config` argument.

Before running the setup script on a new machine you'll need to manually login
to the Apple app store so that [Homebrew]'s cousin [mas] will work.

Run the whole shabang with:
```sh
curl --remote-name https://raw.githubusercontent.com/kpearson/dotfiles/master/setup && \
chmod 755 setup && \
./setup --mac-config
```

## Gotchas


### git-aliases fix

Homebrew doesn't have an option to install git *without completions*. These
completions conflict with the completions in the git-aliases plugin. To resolve
this simply remove the `_git` symlink in the *zsh_site-functions*.

Confirm the location of site_functions:

```sh
brew info git
```

Remove the file:

```sh
rm /usr/local/share/zsh/site-functions/_git
```

> The above is taken care of in the setup script(`.laptop.local`).

[Thoughtbot's laptop]: https://github.com/thoughtbot/laptop
[Homebrew]: https://brew.sh
[mas]: https://formulae.brew.sh/formula/mas

