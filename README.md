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

## Usage

Stow packages from the repo root on macOS:

```sh
cd ~/.dotfiles
mkdir -p ~/.ssh/config.d
stow bat editorconfig ghostty git karabiner mc nano ssh zsh
```

Stow packages from the repo root on Debian:

```sh
cd ~/.dotfiles
stow bat editorconfig mc nano-debian zsh
```

Stow one package:

```sh
stow bat
```

Preview changes before applying them:

```sh
stow -n -v bat
```

Unstow a package:

```sh
stow -D bat
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

Run Stow commands from the repo root. The local `.stowrc` makes Stow target `$HOME`
without passing `-t "$HOME"` every time.

Do not stow `nano` and `nano-debian` together because both manage `~/.nanorc`.

Create `~/.ssh/config.d` before stowing `ssh` so `~/.ssh` stays local and can contain
machine-specific SSH snippets and keys.

Karabiner-Elements may write changes through the symlink when settings are changed in
the UI.

Configuration is managed with GNU Stow.
