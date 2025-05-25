{ config, pkgs, lib, ... }:

{
  programs.rofi = {
    enable = true;
    configPath = "${config.xdg.configHome}/rofi/config.rasi";
    theme = "Arc-Dark"; # Set theme to Arc-Dark
    font = "Iosevka 12";
    location = "center";
    extraConfig = {
      modi = "drun,emoji,ssh";
      kb-primary-paste = "Control+V,Shift+Insert";
      kb-secondary-paste = "Control+v,Insert";
    };
    terminal = "alacritty";
  };
}
