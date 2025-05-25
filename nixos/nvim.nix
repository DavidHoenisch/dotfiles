# Neovim configuration for Home Manager
{ config, pkgs, ... }:

let
  # Path to your Neovim config directory (adjust as needed)
  nvimConfigDir = /home/dhoenisch/dotfiles/.config/nvim;
in
{
  # Install Neovim and related tools

  # Enable Neovim
  programs.neovim = {
    enable = true;
    defaultEditor = true; # Set nvim as default editor
    # viAlias = true;
    # vimAlias = true;
  };

  # Manage Neovim configuration files
  home.file = {
    # Symlink init.lua
    ".config/nvim/init.lua".source = "${nvimConfigDir}/init.lua";

    # Symlink Lua modules directory
    ".config/nvim/lua".source = "${nvimConfigDir}/lua";
    ".config/nvim/logo.png".source = "${nvimConfigDir}/logo.png";

    # Optionally, manage after/ftplugin or other dirs if needed
    # ".config/nvim/after".source = "${nvimConfigDir}/after";
  };
}
