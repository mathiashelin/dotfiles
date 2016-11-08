#!/bin/sh
echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle

# Make ZSH the default shell environment
chsh -s $(which zsh)

# Install some gems
for gem in "bundler" "sumodev" ; do
    gem install "${gem}"
done

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos
