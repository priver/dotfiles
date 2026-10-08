set positional-arguments

# List available commands.
default:
  @just --list

# Install packages from the Brewfile.
brew:
  brew bundle

# Stow the macOS packages.
stow-macos: (stow "bat" "editorconfig" "ghostty" "git" "karabiner" "mc" "nano" "ssh" "zsh")

# Stow the Debian packages.
stow-debian: (stow "bat" "editorconfig" "mc" "nano-debian" "zsh")

# Stow one or more packages.
stow +packages:
  #!/usr/bin/env sh
  set -eu
  for package in "$@"; do
    if [ "$package" = ssh ]; then
      mkdir -p "$HOME/.ssh/config.d"
    fi
  done
  stow "$@"

# Preview changes for one or more packages.
preview +packages:
  stow -n -v "$@"

# Unstow one or more packages.
unstow +packages:
  stow -D "$@"
