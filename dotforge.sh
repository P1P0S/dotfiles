#!/usr/bin/env bash

# ============================================================================
# Dotfiles Installer
# ============================================================================

set -e

# ============================================================================
# Configuration
# ============================================================================

DOTFILES_URL="https://github.com/P1P0S/dotfiles.git"
DOTFILES_DIR="$HOME/dotfiles"

# ============================================================================
# Colors
# ============================================================================

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

# ============================================================================
# Utility Functions
# ============================================================================

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_step() {
    echo -e "${CYAN}[STEP]${NC} $1"
}

clear_screen() {
    clear
    echo ""
    echo "========================================"
    echo "       DOTFILES INSTALLER"
    echo "========================================"
}

confirm() {
    local prompt="$1"
    local choice
    
    read -p "$prompt [Y/n]: " choice
    choice=${choice,,}
    
    # Default to yes if empty
    [[ -z "$choice" || "$choice" == "y" || "$choice" == "yes" ]]
}

# ============================================================================
# Package Manager Detection and Installation
# ============================================================================

detect_pkg_manager() {
    if command -v apt >/dev/null 2>&1; then
        echo "apt"
    elif command -v dnf >/dev/null 2>&1; then
        echo "dnf"
    elif command -v pacman >/dev/null 2>&1; then
        echo "pacman"
    elif command -v brew >/dev/null 2>&1; then
        echo "brew"
    else
        echo "none"
    fi
}

install_package() {
    local pkg="$1"
    local pm
    pm=$(detect_pkg_manager)

    print_step "Installing $pkg using $pm..."

    case "$pm" in
        apt)
            sudo apt update -qq && sudo apt install -y "$pkg" || return 1
            ;;
        dnf)
            sudo dnf install -y "$pkg" || return 1
            ;;
        pacman)
            sudo pacman -Syu --noconfirm "$pkg" || return 1
            ;;
        brew)
            brew install "$pkg" || return 1
            ;;
        none)
            print_error "Could not detect a supported package manager"
            print_info "Please install $pkg manually"
            return 1
            ;;
    esac
    
    print_success "$pkg installed successfully"
}

# ============================================================================
# Dotfiles Management
# ============================================================================

ensure_dotfiles() {
    # Clone or update dotfiles repo
    if [ -d "$DOTFILES_DIR/.git" ]; then
        print_step "Updating dotfiles repository..."
        git -C "$DOTFILES_DIR" pull --rebase || {
            print_error "Failed to update dotfiles repository"
            return 1
        }
        print_success "Dotfiles repository updated"
    else
        print_step "Cloning dotfiles repository..."
        git clone "$DOTFILES_URL" "$DOTFILES_DIR" || {
            print_error "Failed to clone dotfiles repository"
            return 1
        }
        print_success "Dotfiles repository cloned successfully"
    fi
}

# ============================================================================
# Git Installation
# ============================================================================

install_git() {
    echo ""
    echo "========================================"
    echo "           Git Installer"
    echo "========================================"
    echo ""

    # Check if git is installed
    if ! command -v git >/dev/null 2>&1; then
        print_warning "Git not found on this system"
        if confirm "Do you want to install Git now?"; then
            install_package git || return 1
            print_success "Git installed successfully"
        else
            print_info "Skipping Git installation. Some modules may not work properly"
            return 1
        fi
    else
        print_success "Git is already installed"
    fi

    echo ""
    print_success "Git verification complete"
}

# ============================================================================
# Neovim Installation
# ============================================================================

install_nvim() {
    echo ""
    echo "========================================"
    echo "         Neovim Installer"
    echo "========================================"
    echo ""

    ensure_dotfiles || return 1

    local nvim_config_dir="$HOME/.config/nvim"

    # Ensure Neovim is installed
    if ! command -v nvim >/dev/null 2>&1; then
        print_info "Neovim not found. Installing..."
        install_package neovim || return 1
    else
        print_success "Neovim is already installed"
    fi

    # Link nvim config from dotfiles
    if [ -L "$nvim_config_dir" ] || [ -d "$nvim_config_dir" ]; then
        print_warning "Neovim config already exists at $nvim_config_dir"
        if confirm "Do you want to overwrite the existing config?"; then
            print_step "Removing existing Neovim config..."
            rm -rf "$nvim_config_dir"
            mkdir -p "$(dirname "$nvim_config_dir")"
            ln -s "$DOTFILES_DIR/astronvim" "$nvim_config_dir"
            print_success "Symlink created successfully"
        else
            print_info "Keeping existing Neovim config"
            return 1
        fi
    else
        mkdir -p "$(dirname "$nvim_config_dir")"
        ln -s "$DOTFILES_DIR/astronvim" "$nvim_config_dir"
        print_success "Symlink created successfully"
    fi

    echo ""
    print_success "Neovim setup complete"
}

# ============================================================================
# Fish Shell Installation
# ============================================================================

install_fish() {
    echo ""
    echo "========================================"
    echo "        Fish Shell Installer"
    echo "========================================"
    echo ""

    ensure_dotfiles || return 1

    local fish_config_dir="$HOME/.config/fish"

    # Ensure Fish is installed
    if ! command -v fish >/dev/null 2>&1; then
        print_info "Fish not found. Installing..."
        install_package fish || return 1
    else
        print_success "Fish is already installed"
    fi

    # Ensure Starship is installed before linking Fish config
    print_step "Verifying Starship installation..."
    install_starship || return 1

    # Ensure zoxide is installed
    if ! command -v zoxide >/dev/null 2>&1; then
        print_info "zoxide not found. Installing..."
        install_package zoxide || return 1
    else
        print_success "zoxide is already installed"
    fi

    # Ensure lsd is installed
    if ! command -v lsd >/dev/null 2>&1; then
        print_info "lsd not found. Installing..."
        install_package lsd || return 1
    else
        print_success "lsd is already installed"
    fi

    # Ensure asdf is installed
    if [ ! -d "$HOME/.asdf" ]; then
        print_info "asdf not found. Installing..."
        git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0 || return 1
        print_success "asdf installed successfully"
    else
        print_success "asdf is already installed"
    fi

    # Link Fish config from dotfiles
    if [ -L "$fish_config_dir" ] || [ -d "$fish_config_dir" ]; then
        print_warning "Fish config already exists at $fish_config_dir"
        if confirm "Do you want to overwrite the existing config?"; then
            print_step "Removing existing Fish config..."
            rm -rf "$fish_config_dir"
            mkdir -p "$(dirname "$fish_config_dir")"
            ln -s "$DOTFILES_DIR/fish" "$fish_config_dir"
            print_success "Symlink created successfully"
        else
            print_info "Keeping existing Fish config"
            return 1
        fi
    else
        mkdir -p "$(dirname "$fish_config_dir")"
        ln -s "$DOTFILES_DIR/fish" "$fish_config_dir"
        print_success "Symlink created successfully"
    fi

    echo ""
    print_success "Fish setup complete"
}

# ============================================================================
# Tmux Installation
# ============================================================================

install_tmux() {
    echo ""
    echo "========================================"
    echo "           Tmux Installer"
    echo "========================================"
    echo ""

    ensure_dotfiles || return 1

    local tmux_config="$HOME/.tmux.conf"
    local tpm_dir="$HOME/.tmux/plugins/tpm"

    # Ensure tmux is installed
    if ! command -v tmux >/dev/null 2>&1; then
        print_info "Tmux not found. Installing..."
        install_package tmux || return 1
    else
        print_success "Tmux is already installed"
    fi

    # Link tmux config from dotfiles
    if [ -L "$tmux_config" ] || [ -f "$tmux_config" ]; then
        print_warning "Tmux config already exists at $tmux_config"
        if confirm "Do you want to overwrite the existing config?"; then
            print_step "Removing existing tmux config..."
            rm -f "$tmux_config"
            ln -s "$DOTFILES_DIR/tmux/.tmux.conf" "$tmux_config"
            print_success "Symlink created successfully"
        else
            print_info "Keeping existing tmux config"
            return 1
        fi
    else
        ln -s "$DOTFILES_DIR/tmux/.tmux.conf" "$tmux_config"
        print_success "Symlink created successfully"
    fi

    # Install TPM if missing
    if [ ! -d "$tpm_dir" ]; then
        print_step "Installing TPM (Tmux Plugin Manager)..."
        git clone https://github.com/tmux-plugins/tpm "$tpm_dir" || {
            print_error "Failed to clone TPM"
            return 1
        }
        print_success "TPM installed successfully"
    else
        print_success "TPM is already installed"
    fi

    # Install plugins via TPM
    print_step "Installing tmux plugins..."
    tmux start-server 2>/dev/null
    tmux new-session -d -s temp_install_session 2>/dev/null
    tmux source-file "$tmux_config" 2>/dev/null
    
    if [ -f "$tpm_dir/bin/install_plugins" ]; then
        "$tpm_dir/bin/install_plugins" || {
            print_warning "Some plugins may not have been installed"
        }
    fi
    
    tmux kill-session -t temp_install_session 2>/dev/null

    echo ""
    print_success "Tmux setup complete"
    print_info "Run 'tmux' and press prefix + I to install plugins"
}

# ============================================================================
# Starship Installation
# ============================================================================

install_starship() {
    echo ""
    echo "========================================"
    echo "        Starship Installer"
    echo "========================================"
    echo ""

    ensure_dotfiles || return 1

    local starship_config="$HOME/.config/starship.toml"

    # Ensure starship is installed
    if ! command -v starship >/dev/null 2>&1; then
        print_info "Starship not found. Installing..."
        install_package starship || return 1
    else
        print_success "Starship is already installed"
    fi

    # Link starship config from dotfiles
    if [ -L "$starship_config" ] || [ -f "$starship_config" ]; then
        print_warning "Starship config already exists at $starship_config"
        if confirm "Do you want to overwrite the existing config?"; then
            print_step "Removing existing Starship config..."
            rm -rf "$starship_config"
            mkdir -p "$(dirname "$starship_config")"
            ln -s "$DOTFILES_DIR/starship/starship.toml" "$starship_config"
            print_success "Symlink created successfully"
        else
            print_info "Keeping existing Starship config"
            return 1
        fi
    else
        mkdir -p "$(dirname "$starship_config")"
        ln -s "$DOTFILES_DIR/starship/starship.toml" "$starship_config"
        print_success "Symlink created successfully"
    fi

    echo ""
    print_success "Starship setup complete"
}

# ============================================================================
# Menu System
# ============================================================================

show_result() {
    local exit_code=$1
    local module_name=$2
    
    echo ""
    if [ $exit_code -eq 0 ]; then
        print_success "$module_name installed successfully"
    else
        print_error "Failed to install $module_name"
    fi
}

show_menu() {
    clear_screen
    echo ""
    echo "  1) Neovim"
    echo "  2) Fish Shell"
    echo "  3) Tmux"
    echo "  4) Starship Prompt"
    echo "  5) Install All"
    echo "  6) Exit"
    echo ""
    echo "========================================"
    echo ""

    read -p "Enter your choice [1-6]: " option
    echo ""
    
    case $option in
        1) 
            install_nvim
            show_result $? "Neovim"
            ;;
        2) 
            install_fish
            show_result $? "Fish Shell"
            ;;
        3) 
            install_tmux
            show_result $? "Tmux"
            ;;
        4) 
            install_starship
            show_result $? "Starship"
            ;;
        5)
            echo "========================================"
            echo "      INSTALLING ALL MODULES"
            echo "========================================"
            echo ""
            
            local failed=0
            
            install_nvim || ((failed++))
            install_fish || ((failed++))
            install_tmux || ((failed++))
            install_starship || ((failed++))
            
            echo ""
            if [ $failed -eq 0 ]; then
                print_success "All modules installed successfully"
            else
                print_warning "Some modules failed to install ($failed errors)"
            fi
            ;;
        6) 
            echo ""
            echo "Goodbye!"
            echo ""
            exit 0 
            ;;
        *) 
            print_error "Invalid option. Please choose between 1-6"
            ;;
    esac
    
    echo ""
    read -p "Press Enter to continue..." -r
}

# ============================================================================
# Main Entry Point
# ============================================================================

main() {
    # Ensure Git is installed before continuing
    if ! command -v git >/dev/null 2>&1; then
        print_error "Git is required for this installer"
        install_git || {
            print_error "Git installation failed or was skipped. Exiting..."
            exit 1
        }
    fi

    # Main loop
    while true; do
        show_menu
    done
}

# Run main function
main
