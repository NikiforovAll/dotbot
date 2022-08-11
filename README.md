Dotfiles [![Build Status](https://github.com/nikiforovall/dotbot/workflows/CI/badge.svg)](https://github.com/nikiforovall/dotbot/actions?query=workflow%3ACI)
=================

After cloning this repo, run `install` to automatically set up the development
environment. Note that the install script is idempotent: it can safely be run
multiple times.

Dotfiles uses [Dotbot](https://github.com/anishathalye/dotbot) for installation.

Making Local Customizations
---------------------------

You can make local customizations for some programs by editing these files:

* `zsh` / `bash` : `~/.shell_local_before` run first
* `zsh` : `~/.zshrc_local_before` run before `.zshrc`
* `zsh` : `~/.zshrc_local_after` run after `.zshrc`
* `zsh` / `bash` : `~/.shell_local_after` run last
* `git` : `~/.gitconfig_local`

TODO
-----

* consider adding ripgrep
* consider adding fzf (it is not installed)

Credits 
---------

* https://github.com/anishathalye/dotfiles
