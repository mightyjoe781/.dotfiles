# Dotfiles Documentation

This dotfiles repository provides a comprehensive development environment setup with configurations for various tools and custom utilities.

## Installation & Setup

### Prerequisites
- Install Homebrew packages: `brew install --HEAD $(cat Brewlist)`
- Install Oh My Zsh: `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
- Install vim-plug for Neovim

### Installation
1. Clone repository: `git clone https://github.com/mightyjoe781/.dotfiles ~/.dotfiles`
2. Create necessary directories: `mkdir -p ~/bin ~/.config/nvim ~/.vim`
3. Install configurations: `bash install` (uses GNU Stow)

## Core Features

### Shell Configuration (ZSH)
- **Oh My Zsh**: Robbyrussell theme with git and fzf plugins
- **FZF Integration**: Enhanced file/directory navigation with fuzzy finding
- **Custom Key Bindings**:
  - `Ctrl+T`: File picker
  - `Ctrl+R`: History search  
  - `Alt+C`: Directory navigation

### Custom Functions & Scripts

#### File & Directory Navigation
- `dls()`: List directories in current path
- `fe [pattern]`: Open file with default editor using fzf
- `fcd`: Change to selected directory with fzf
- `fcda`: Change directory including hidden directories
- `cdf`: Change to directory of selected file

#### Git Tools
- `fcb`: Git commit browser
- `fbr`: Checkout git branch (including remote branches)
- `fcoc`: Checkout specific git commit

#### Utilities
- `ttps()`: Show processes for current tty
- `highlight()`: Highlight text patterns in output
- `notes()`: Quick access to notes directory with tmux session
- `fromhex()`, `tohex()`, `hex2dec()`: Number format conversions
- `urlencode()`: URL encoding utility

#### Tmux Integration
- `tmux-sessionizer`: Quick project switching with tmux sessions
- `tmux-cht.sh`: Access cheat.sh directly from tmux

### Application Configurations

#### Tmux
- **Prefix**: `Ctrl+A` (instead of default Ctrl+B)
- **Vim-style navigation**: h/j/k/l for pane switching
- **Split windows**: `|` (horizontal), `-` (vertical)
- **Pane resizing**: H/J/K/L with repeat capability
- **Quick reload**: `Ctrl+R` or `prefix + r`

#### Vim/Neovim
- **Basic settings**: Line numbers, smart indentation, syntax highlighting
- **Visual aids**: Color column at 72 characters, relative line numbers
- **File handling**: Undo persistence, no swap files
- **Modern Lua configuration** for Neovim (init.lua)

#### Ghostty Terminal
- **Theme**: Catppuccin Mocha
- **Transparency**: 70% opacity with 20px blur
- **Vim-style splits**: `cmd+s` prefix for window management
- **Tab navigation**: Quick switch with `cmd+s+[1-9]`

#### Git
- Personal configuration in `personal/.gitconfig`

### Bin Scripts
- `color-test.sh`: Terminal color testing utility
- `pcloud_sync.sh`: Backup utility using rclone for PCloud
- `tmux-sessionizer`: Fast project switching
- `tmux-cht.sh`: Cheat sheet integration

### Environment Features
- **Cross-platform**: Configurations for macOS, Linux, and WSL
- **Font support**: NerdFonts integration for glyphs and symbols
- **Plugin management**: Organized plugin structure for vim/neovim
- **Stow integration**: Clean symlink management

### Maintenance
- `clean-env`: Environment cleanup script
- `setup`: Quick setup script
- Git-managed with submodules for external dependencies

## Platform Support
- **macOS**: Primary development environment
- **Linux**: Full compatibility with font recommendations
- **WSL**: Separate bash configurations for Windows Subsystem for Linux

This dotfiles setup provides a unified, efficient development environment with powerful navigation tools, consistent theming, and productivity-focused shortcuts across all applications.