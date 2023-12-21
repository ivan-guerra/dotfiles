# dotfiles

Dotfiles used on my Fedora development PC. The configuration files can be
"installed" using [GNU Stow][1]. This blog post gives a nice overview of how
GNU Stow works its magic on the dotfiles: [Using GNU Stow to manage your
dotfiles][2].

Assuming you have the `stow` program installed (`sudo dnf install stow` on
Fedora), you can tell Stow to symlink dotfiles using the command 
`stow $PKGNAME`.

For example, to link the `.bashrc` included in this repo:

```
git clone git@github.com:ivan-guerra/dotfiles.git $HOME/.dotfiles
cd $HOME/.dotfiles
stow bash
```

A number of the configurations have additional dependencies. The table below
lists dependencies grouped by application.

| Application | Dependencies                                                                  |
|-------------|-------------------------------------------------------------------------------|
| bash        | `ctags`, `evince`, `ffmpeg`, `rkhunter`, `valgrind`, `vim`, `xrandr`          |
| fish        | `ctags`, `evince`, `dnf`, `ffmpeg`, `rkhunter`, `valgrind`, `vim`, `xrandr`   |
| git         | `nvim`                                                                        |
| i3          | `compton`, `dmenu`, `google-chrome`, `lm_sensors`, `i3status`, `feh`, `slock` |
| neomutt     | `evince`, `feh`, `khard`, `pass`, `w3m`                                       |
| neovim      | `clang`, `clangd`, `npm`, `ripgrep`, `shellcheck`                             |
| xinit       | `i3`                                                                          |


[1]: https://www.gnu.org/software/stow/
[2]: https://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html
