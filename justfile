set positional-arguments

# List available commands.
default:
  @just --list

# Install packages from the Brewfile.
[macos]
brew:
  brew bundle

# Stow the macOS packages.
[macos]
stow-all: (stow "bat" "editorconfig" "ghostty" "git" "karabiner" "mc" "nano" "ssh" "zsh")

# Stow the Debian packages.
[linux]
stow-all: (stow "bat" "editorconfig" "mc" "nano-debian" "zsh")

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

# Install shared skills globally for Codex, Claude Code, Pi, and OpenCode.
skills: \
  (_skills-add "bborysenko/bear-skills" "bear-cli" "bear-markdown") \
  (_skills-add "casey/just" "just") \
  (_skills-add "clickhouse/agent-skills" "clickhouse-architecture-advisor" "clickhouse-best-practices") \
  (_skills-add "cursor/plugins" "unslop") \
  (_skills-add "googleworkspace/cli" "gws-shared" "gws-sheets" "gws-sheets-append" "gws-sheets-read") \
  (_skills-add "mattpocock/skills" "grill-me" "grilling" "handoff" "writing-for-agents") \
  (_skills-add "ossianhempel/things3-cli" "things") \
  (_skills-add "shadcn/ui" "shadcn") \
  (_skills-add "vercel-labs/skills" "find-skills") \
  (_skills-add "vercel/turborepo" "turborepo")

_skills-add repository +names:
  #!/usr/bin/env sh
  set -eu
  repository="$1"
  shift
  pnpx skills add "https://github.com/$repository" --skill "$@" --global --agent codex claude-code pi opencode --yes
