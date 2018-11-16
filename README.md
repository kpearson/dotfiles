Dotfiles
========

Kit Pearson 2015

------

Welcome to Kit Pearsons dotfiles. Theses dotfiles contain everything needed to
set up a Mac from scratch. The install/setup is broken up into a few sections,

- Initial set up and install of basic tools
- Install a complete set of applications

Set up a new machine by running the Thoughtbot `laptop/mac` script with the
`.laptop.local` inplace.

```sh
curl --remote-name https://raw.githubusercontent.com/thoughtbot/laptop/master/mac
curl --remote-name https://raw.githubusercontent.com/kpearson/Dotfiles/master/.laptop.local
sh mac 2>&1 | tee ~/laptop.log
```

Optionally install a more compleste set of application by pull down the Brewfile
and running `brew bundle`.

```sh
curl --remote-name https://raw.githubusercontent.com/kpearson/Dotfiles/master/.laptop.local
curl --remote-name https://raw.githubusercontent.com/kpearson/Dotfiles/master/Brewfile
brew bundle
```

