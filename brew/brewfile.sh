#! /bin/bash

brew update
brew upgrade

brew tap homebrew/binary
brew tap homebrew/versions
brew tap caskroom/versions
brew tap phinze/homebrew-cask

brew install brew-cask
brew install composer
brew install ctags
brew install curl
brew install git
brew install jq
brew install openssl
brew install tig
brew install tree
brew install vim
brew install wget
brew install zsh

brew cask install alfred
brew cask install dash
brew cask install dropbox
brew cask install evernote
brew cask install firefox
brew cask install github
brew cask install google-chrome
brew cask install google-japanese-ime
brew cask install imageoptim
brew cask install intellij-idea
brew cask install iterm2
brew cask install java
brew cask install kobito
brew cask install onepassword
brew cask install phpstorm
brew cask install sequel-pro
brew cask install skitch
brew cask install skype
brew cask install sourcetree
brew cask install totalspaces
brew cask install vagrant
brew cask install virtualbox
brew cask install xtrafinder

brew cask alfred link

brew cleanup
brew cask cleanup
