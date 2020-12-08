#!/usr/bin/env bash

#######################################################################
#Script Name	:brew.sh                                             
#Description	:Install Homebrew, Packages, Applications                                 
#Author       	:Kevin Omyonga (Dr. KNO)                               
#Email         	:komyonga@gmail.com                                    
#Website        :https://kevinomyonga.com                              
#Date         	:Sun Nov  1 17:15:50 EAT 2020                          
#Version        :0.1
#######################################################################

# Import Banner Script
source ./banner.sh

# Check to see if Homebrew is installed, and install it if it is not
banner "Checking Homebrew install status"
command -v brew >/dev/null 2>&1 || { 
  banner "Installing Homebrew Now"
    echo >&2 "Installing Homebrew Now"; 
    \/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; 
}

# Install Brew Packages
banner "Installing Homebrew Packages"
# Dependency manager for Cocoa projects
brew install cocoapods
# Interpreted, interactive, object-oriented programming language
brew install python
# Display directories as trees (with optional color/HTML output)
brew install tree
# Command-line program to download videos from YouTube.com and a few more sites.
brew install youtube-dl

# Install MacOS Applications
installApps()
{
  banner "Installing MacOS Applications"

  # Helps correct any issues there may be with the cask module 
  brew cask doctor

  # Tools for building Android applications
  brew install --cask android-studio
  # Open-source electronics prototyping platform
  brew install --cask arduino
  # Tool to flash OS images to SD cards & USB drives
  brew install --cask balenaetcher
  # Voice and text chat software
  brew install --cask discord
  # Launcher for *Epic Games* games
  brew install --cask epic-games
  # Free and open-source image editor
  brew install --cask gimp
  # Desktop client for GitHub repositories
  brew install --cask github
  # Organize your projects with customizable templates
  brew install --cask post-haste
  # Collaboration platform for API development
  brew install --cask postman
  # Software sketchbook and a language for learning how to code within the context of the visual arts. 
  brew install --cask processing
  # The ultimate destination for playing, discussing, and creating games.
  brew install --cask steam
  # A powerful x86 and AMD64/Intel64 virtualization product for enterprise as well as home use
  brew install --cask virtualbox
  # Open-source code editor
  brew install --cask visual-studio-code
  # Open-source cross-platform multimedia player
  brew install --cask vlc
  # Remote desktop application focusing on security
  brew install --cask vnc-viewer
  # Wordpress client
  brew install --cask wordpresscom
  # Video communication and virtual meeting platform
  brew install --cask zoomus
}

_prompt="Do you wish to install the MacOS Applications [y/n] ?"
 
# Loop forever until the user enters a valid response (Y/N or Yes/No).
while true; do
 read -r -p "$_prompt " _response
 case "$_response" in
   [Yy][Ee][Ss]|[Yy]) # Yes or Y (case-insensitive).
     installApps
     ;;
   [Nn][Oo]|[Nn])  # No or N.
     break
     ;;
   *) # Anything else (including a blank) is invalid.
     ;;
  esac
done