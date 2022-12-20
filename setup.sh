#!/bin/bash

OS=$(uname)

# -------------------------
# Installing stuff
# -------------------------

echo "-- Applications & Plugins --"

# Check if it is macOS
if [ $OS == "Darwin" ]; then
  # Install Homebrew
  if ! [ -x "$(command -v brew)" ]; then
    echo "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    echo "Homebrew already installed - nice!"
  fi

  # Install iTerm2 
  if ! brew list --cask | grep -q iterm2 ; then
    echo "Installing iTerm2"
    brew install --cask iterm2
  else
    echo "iTerm2 already installed - nice!"
  fi
fi

# Install Git 
if ! [ -x "$(command -v git)" ]; then
  echo "Installing Git"

  case $OS in
    "Darwin")
      brew install git
      ;;

    "Linux")
      # Considering just Ubuntu for now
      sudo apt-get install git-all
      ;;
  esac
else
  echo "Git already installed - nice!"
fi

# Install neovim
if ! [ -x "$(command -v nvim)" ]; then
  echo "Installing Neovim"

  case $OS in
    "Darwin")
      brew install neovim 
      ;;

    "Linux")
      # Considering just Ubuntu for now
      sudo apt-get install neovim 
      ;;
  esac
else
  echo "Neovim already installed - nice!"
fi

# Install oh-my-zsh
if ! [ -d ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "oh-my-zsh already installed - nice!"
fi

# Install zsh-autosuggestions plugin
if ! [ -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
else
  echo "zsh-autosuggestions already installed - nice!"
fi

# Install zsh-syntax-highlighting plugin
if ! [ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
else
  echo "zsh-syntax-highlighting already installed - nice!"
fi

# Install Powerlevel10k theme
if ! [ -d ~/.oh-my-zsh/custom/themes/powerlevel10k ]; then
  git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
else
  echo "Powerlevel10k already installed - nice!"
fi

# -----------------------------------------
# Copying files to their specific locations 
# -----------------------------------------

echo 
echo "-- Copying dotfiles --"
echo "Copying .zshrc to ~/.zshrc"
cp ./.zshrc ~/.zshrc

echo "Copying .nvim folder to ~/.config/nvm"
cp -R ./nvim ~/.config
