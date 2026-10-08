# dotfiles

My personal dotfiles.

## Setup

Clone the repo:

```sh
git clone git@github.com:priver/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

On macOS, install Homebrew:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install packages from the Brewfile:

```sh
brew bundle
```

On Debian, install GNU Stow and `just` before using the commands below.

## Usage

List available commands from the repo root:

```sh
cd ~/.dotfiles
just
```

Stow packages for the current OS:

```sh
just stow-all
```

This selects the macOS package set on macOS and the Debian package set on Linux.

Stow one or more packages:

```sh
just stow bat zsh
```

Preview changes before applying them:

```sh
just preview bat zsh
```

Unstow one or more packages:

```sh
just unstow bat zsh
```

Install packages from the Brewfile on macOS:

```sh
just brew
```

## Packages

- `bat`: bat configuration
- `editorconfig`: EditorConfig defaults
- `git`: Git configuration
- `ghostty`: Ghostty terminal configuration
- `karabiner`: Karabiner-Elements configuration
- `mc`: Midnight Commander configuration
- `nano`: GNU nano configuration for macOS/Homebrew
- `nano-debian`: GNU nano configuration for Debian
- `ssh`: SSH configuration
- `zsh`: Zsh, Zim, and Powerlevel10k configuration

## Notes

The recipes run from the repo root. The local `.stowrc` makes Stow target `$HOME`
without passing `-t "$HOME"` every time. Run direct Stow commands from the repo root too.

Do not stow `nano` and `nano-debian` together because both manage `~/.nanorc`.

The Stow recipes create `~/.ssh/config.d` before stowing `ssh` so `~/.ssh` stays local and
can contain machine-specific SSH snippets and keys. Create it manually when using Stow directly.

Karabiner-Elements may write changes through the symlink when settings are changed in
the UI.

Configuration is managed with GNU Stow.
