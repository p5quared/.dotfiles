#!/usr/bin/env bash

# Dotfiles Installation Script
# This script installs all necessary tools and configurations for a portable dotfiles setup

set -e  # Exit on error

# Color output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Helper functions
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

# Detect OS
detect_os() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        OS="macos"
        print_info "Detected macOS"
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        OS="linux"
        print_info "Detected Linux"
    else
        print_error "Unsupported OS: $OSTYPE"
        exit 1
    fi
}

# Install Homebrew (macOS/Linux)
install_homebrew() {
    if command -v brew &> /dev/null; then
        print_success "Homebrew is already installed"
    else
        print_info "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        # Add Homebrew to PATH for Linux
        if [[ "$OS" == "linux" ]]; then
            echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
            eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
        fi

        print_success "Homebrew installed successfully"
    fi
}

# Install packages from Brewfile
install_brew_packages() {
    if [[ ! -f "$DOTFILES_DIR/.config/Brewfile" ]]; then
        print_warning "Brewfile not found, skipping brew bundle install"
        return
    fi

    print_info "Installing packages from Brewfile..."
    brew bundle --file="$DOTFILES_DIR/.config/Brewfile"
    print_success "Brew packages installed successfully"
}

# Install Oh My Zsh
install_oh_my_zsh() {
    if [[ -d "$HOME/.oh-my-zsh" ]]; then
        print_success "Oh My Zsh is already installed"
    else
        print_info "Installing Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
        print_success "Oh My Zsh installed successfully"
    fi
}

# Install Powerlevel10k theme
install_powerlevel10k() {
    local P10K_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

    if [[ -d "$P10K_DIR" ]]; then
        print_success "Powerlevel10k is already installed"
    else
        print_info "Installing Powerlevel10k..."
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P10K_DIR"
        print_success "Powerlevel10k installed successfully"
    fi
}

# Install NVM (Node Version Manager)
install_nvm() {
    if [[ -d "$HOME/.nvm" ]]; then
        print_success "NVM is already installed"
    else
        print_info "Installing NVM..."
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

        # Load NVM
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

        print_success "NVM installed successfully"
    fi
}

# Setup stow symlinks
setup_stow() {
    print_info "Setting up dotfiles with stow..."

    # Navigate to dotfiles directory
    cd "$DOTFILES_DIR"

    # Backup existing config if it exists
    if [[ -d "$HOME/.config" ]] && [[ ! -L "$HOME/.config" ]]; then
        print_warning "Backing up existing .config to .config.backup"
        mv "$HOME/.config" "$HOME/.config.backup.$(date +%Y%m%d_%H%M%S)"
    fi

    # Stow .config directory
    if [[ -d "$DOTFILES_DIR/.config" ]]; then
        stow -v .config -t "$HOME"
        print_success "Config files stowed successfully"
    fi

    # Stow .zshrc
    if [[ -f "$DOTFILES_DIR/.zshrc" ]]; then
        if [[ -f "$HOME/.zshrc" ]] && [[ ! -L "$HOME/.zshrc" ]]; then
            print_warning "Backing up existing .zshrc to .zshrc.backup"
            mv "$HOME/.zshrc" "$HOME/.zshrc.backup.$(date +%Y%m%d_%H%M%S)"
        fi
        ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
        print_success ".zshrc symlinked successfully"
    fi

    cd - > /dev/null
}

# Setup macOS-specific configurations
setup_macos() {
    if [[ "$OS" != "macos" ]]; then
        return
    fi

    print_info "Setting up macOS-specific configurations..."

    # Check if yabai/skhd need special permissions
    if command -v yabai &> /dev/null; then
        print_warning "yabai requires additional setup for scripting additions"
        print_warning "Run: sudo yabai --load-sa"
        print_warning "See: https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release)"
    fi

    # Set zsh as default shell if not already
    if [[ "$SHELL" != "$(which zsh)" ]]; then
        print_info "Setting zsh as default shell..."
        chsh -s "$(which zsh)"
        print_success "Default shell changed to zsh"
    fi
}

# Main installation function
main() {
    print_info "Starting dotfiles installation..."
    echo ""

    # Get dotfiles directory
    DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    print_info "Dotfiles directory: $DOTFILES_DIR"
    echo ""

    # Detect OS
    detect_os
    echo ""

    # Install Homebrew
    install_homebrew
    echo ""

    # Install packages from Brewfile
    install_brew_packages
    echo ""

    # Install Oh My Zsh
    install_oh_my_zsh
    echo ""

    # Install Powerlevel10k
    install_powerlevel10k
    echo ""

    # Install NVM
    install_nvm
    echo ""

    # Setup stow symlinks
    setup_stow
    echo ""

    # macOS specific setup
    setup_macos
    echo ""

    print_success "Installation complete!"
    echo ""
    print_info "Next steps:"
    echo "  1. Restart your terminal or run: exec zsh"
    echo "  2. If you use Powerlevel10k, run: p10k configure"
    echo "  3. If you installed nvm, install Node: nvm install --lts"
    echo "  4. For yabai/skhd on macOS, follow the setup guide at:"
    echo "     https://github.com/koekeishiya/yabai/wiki"
}

# Run main installation
main
