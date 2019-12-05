Dotfiles
========

Kit Pearson 2015 - 2020

------

Welcome to Kit Pearsons dotfiles. Theses dotfiles contain everything needed to
set up a Mac from scratch. The install/setup is broken up into a few sections.

- Initial set up and install of basic tools
- Install a complete set of applications

Set up a new machine by running [Thoughtbot's laptop] script.

This repo includes a Brewfile with a fairly extensive list of apps. Read it
thruough and edit it before running the `setup` script.

To get a handle on what is about to be changed and install on your machine look
at Thoughtbot's laptop] project, `.laptop.local` in the root of this reop, and
the `macos` file in the root of this repo.

Before running the setup script on a new machine you'll need to manually login
to the Apple app store so that [Homebrew]'s cosin [mas] will work.

```sh
curl --remote-name https://raw.githubusercontent.com/kpearson/dotfiles/master/setup && \
chmod 755 setup && \
./setup --mac-config
```

[Thoughtbot's laptop]: https://github.com/thoughtbot/laptop
[Homebrew]: https://brew.sh
[mas]: https://formulae.brew.sh/formula/mas


