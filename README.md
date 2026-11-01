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

Install the selected agent skills globally for Codex, Claude Code, Pi, and OpenCode:

```sh
just skills
```

Requires Node.js 22.20 or later and pnpm (`pnpx`), both included in the Brewfile.
The recipe installs without prompts and stops on the first failed command.
Skills live in `~/.agents/skills`, which Codex, Pi, and OpenCode read directly.
The installer creates per-skill symlinks in `~/.claude/skills` for Claude Code.
Other agents that read the shared directory can also discover these skills.

Maintain the skill list in the `skills` recipe's dependencies in `justfile`.
Each `_skills-add` entry takes a repository URL followed by one or more skill names.

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
