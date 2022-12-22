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
      sudo apt-get install git-all curl
      ;;
  esac
else
  echo "Git already installed - nice!"
fi

# Install tmux
if ! [ -x "$(command -v tmux)" ]; then
  echo "Installing tmux"

  case $OS in
    "Darwin")
      brew install tmux
      ;;

    "Linux")
      # Considering just Ubuntu for now
      sudo apt-get install tmux
      ;;
  esac

  echo "Installing tpm (tmux plugin manager)"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  echo "tmux already installed - nice!"
fi

# Install Node & Yarn (volta)
if ! [ -x "$(command -v volta)" ]; then
  echo "Installing volta"

  curl https://get.volta.sh | bash
  volta install node
  volta install yarn
else
  echo "volta already installed - nice!"
fi

# Install Ruby (rbenv)
if ! [ -x "$(command -v rbenv)" ]; then
  echo "Installing rbenv"

  case $OS in
    "Darwin")
      brew install rbenv ruby-build sqlite3
      echo 'eval "$(rbenv init - zsh)"' >> ~.zshrc
      ;;

    "Linux")
      # Considering just Ubuntu for now
      git clone https://github.com/rbenv/rbenv.git ~/.rbenv
      echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
      echo 'eval "$(rbenv init -)"' >> ~/.zshrc
      exec $SHELL

      git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
      echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.zshrc
      exec $SHELL
      ;;
  esac

  echo "Installing Ruby 3.1.3"
  rbenv install 3.1.3
  rbenv global 3.1.3

  echo "Installing Rails 7.0.4"
  gem install rails -v 7.0.4
  rbenv rehash
else
  echo "rbenv & ruby & rails already installed - nice!"
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

echo "Copying .tmux.conf to ~/.tmux.conf"
cp ./.tmux.conf ~/.tmux.conf

echo
echo "--"
echo "Close and re-open this terminal or run"
echo "$ source ~/.zshrc"
echo "to start configuring Powerlevel10k or run"
echo "$ p10k configure"
