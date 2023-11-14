#!/bin/bash

# Step #1 - Homebrew
# Function to check and install Homebrew
check_and_install_homebrew() {
  # Check if Homebrew is installed
  if command -v brew >/dev/null 2>&1; then
    echo "Homebrew is installed."
    brew --version
  else
    echo "Homebrew is not installed. Installing now..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
}

# Function to install a Homebrew package
install_brew_pkg() {
  local package=$1
  local type=$2 # 'cask' or 'formula'

  echo "Checking for $package..."

  # Check if the package is installed
  if [[ $type == "cask" ]]; then
    if brew list --cask "$package" >/dev/null 2>&1; then
      echo "$package is already installed."
      return 0
    fi
  else
    if brew list "$package" >/dev/null 2>&1; then
      echo "$package is already installed."
      return 0
    fi
  fi

  # Install the package if not installed
  echo "$package is not installed. Installing now..."
  if [[ $type == "cask" ]]; then
    brew install --cask "$package"
  else
    brew install "$package"
  fi
}

# Function to check for iTerm2
check_and_install_iterm2() {
  # Check if iTerm2 is installed via Homebrew
  if brew list --cask iterm2 &>/dev/null; then
    echo "iTerm2 is installed via Homebrew."
  # Check if iTerm2 is installed in the Applications folder
  elif [ -d "/Applications/iTerm.app" ]; then
    echo "iTerm2 is installed in the Applications folder."
  else
    echo "iTerm2 is not installed. Installing now..."
    # Make sure homebrew is installed
    check_and_install_homebrew
    # Install iTerm2 using Homebrew Cask
    install_brew_pkg "iterm2" "cask"
  fi
}

# Function to check for Visual Studio Code
check_and_install_vscode() {
  # Check if VSCode is installed via Homebrew
  if brew list --cask visual-studio-code &>/dev/null; then
    echo "VSCode is installed via Homebrew."
  # Check if VSCode is installed in the Applications folder
  elif [ -d "/Applications/Visual Studio Code.app" ]; then
    echo "VSCode is installed in the Applications folder."
  else
    echo "VSCode is not installed. Installing now..."
    # Check and Install Homebrew
    check_and_install_homebrew
    # Install VSCode using Homebrew Cask
    install_brew_pkg "visual-studio-code" "cask"
  fi
}

# Function to check for Oh My Zsh installation
check_and_install_oh_my_zsh() {
  if [[ -d "$HOME/.oh-my-zsh" ]]; then
    echo "Oh My Zsh is installed."
  else
    echo "Oh My Zsh is not installed."
    # Uncomment below to install Oh My Zsh automatically
    # sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi
}

# Function to check for Powerlevel10k theme installation
check_and_install_powerlevel10k() {
  if [[ -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]]; then
    echo "Powerlevel10k theme is installed."
  else
    echo "Powerlevel10k theme is not installed."
    # Uncomment below to install Powerlevel10k automatically
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  fi
}

# Function to deploy tmux configuration
deploy_tmux_config() {
  local source_file="./.tmux.conf"
  local target_file="$HOME/.tmux.conf"

  if [[ -f "$target_file" ]]; then
    read -p ".tmux.conf exists. Overwrite? (y/N) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      cp "$source_file" "$target_file"
      echo ".tmux.conf has been updated."
    else
      echo "Skipping .tmux.conf update."
    fi
  else
    cp "$source_file" "$target_file"
    echo ".tmux.conf has been deployed."
  fi
}

# Function to deploy zsh configuration
deploy_zsh_config() {
  local zshrc_source="./.zshrc"
  local zshrc_target="$HOME/.zshrc"
  local custom_dir_source="./oh-my-zsh/custom"
  local custom_dir_target="$HOME/.oh-my-zsh/custom"

  # Deploy .zshrc
  if [[ -f "$zshrc_target" ]]; then
    read -p ".zshrc exists. Overwrite? (y/N) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      cp "$zshrc_source" "$zshrc_target"
      echo ".zshrc has been updated."
    else
      echo "Skipping .zshrc update."
    fi
  else
    cp "$zshrc_source" "$zshrc_target"
    echo ".zshrc has been deployed."
  fi

  # Deploy custom Oh My Zsh files
  if [[ ! -d "$custom_dir_target" ]]; then
    mkdir -p "$custom_dir_target"
  fi

  for file in "$custom_dir_source"/*; do
    filename=$(basename "$file")
    target_file="$custom_dir_target/$filename"

    if [[ -f "$target_file" ]]; then
      read -p "$filename exists in the custom directory. Overwrite? (y/N) " -n 1 -r
      echo
      if [[ $REPLY =~ ^[Yy]$ ]]; then
        cp "$file" "$target_file"
        echo "$filename has been updated in the custom directory."
      else
        echo "Skipping $filename update in the custom directory."
      fi
    else
      cp "$file" "$target_file"
      echo "$filename has been deployed to the custom directory."
    fi
  done
}

# Function to deploy neovim configuration
deploy_neovim_config() {
  local source_dir="./nvim"
  local target_dir="$HOME/.config/nvim"

  if [[ -d "$target_dir" ]]; then
    read -p "nvim config exists. Overwrite? (y/N) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      cp -R "$source_dir" "$target_dir"
      echo "nvim config has been updated."
    else
      echo "Skipping nvim config update."
    fi
  else
    cp -R "$source_dir" "$target_dir"
    echo "nvim config has been deployed."
  fi
}

# Main function to handle all operations
main() {
  local argument=$1

  check_and_install_homebrew

  case $argument in
    homebrew)
      check_and_install_homebrew
      ;;
    iterm2)
      check_and_install_iterm2
      ;;
    vscode)
      check_and_install_vscode
      ;;
    kubectx)
      install_brew_pkg "kubectx" "formula"
      ;;
    tmux)
      install_brew_pkg "tmux" "formula"
      ;;
    tmux-config)
      deploy_tmux_config
      ;;
    neovim)
      install_brew_pkg "neovim" "formula"
      ;;
    neovim-config)
      deploy_neovim_config
      ;;
    oh-my-zsh)
      check_and_install_oh_my_zsh
      ;;
    p10k)
      check_and_install_oh_my_zsh
      check_and_install_powerlevel10k
      ;;
    zsh-config)
      check_and_install_oh_my_zsh
      deploy_zsh_config
      ;;
    *)
      # If no (or unknown) argument is provided, check and install all
      check_and_install_homebrew
      check_and_install_iterm2
      check_and_install_vscode
      check_and_install_oh_my_zsh
      check_and_install_powerlevel10k
      install_brew_pkg "tmux" "formula"
      install_brew_pkg "neovim" "formula"
      install_brew_pkg "kubectx" "formula"
      deploy_tmux_config
      deploy_zsh_config
      deploy_neovim_config
      ;;
  esac
}

# Call the main function with the provided argument
main "$1"
