{ config, pkgs, ... }:
{
  services.dunst = {
    enable = true;
    package = pkgs.dunst;
    settings = {
      global = {
        font = "Roboto 12";
        width = 300;
        height = 100;
        origin = "top-right";
        offset = "10x10";
        transparency = 10;
        frame_width = 2;
        frame_color = "#54546D"; # Kanagawa muted gray border
        corner_radius = 10; # Rounded corners
        background = "#1F1F28"; # Kanagawa dark background
        foreground = "#DCD7BA"; # Kanagawa light text
        padding = 10;
        horizontal_padding = 10;
        text_icon_padding = 10;
        fade_in = 100;
        fade_out = 200;
        icon_theme = "Papirus";
        monitor = "mouse"; # Show on monitor with mouse cursor
        follow = "mouse"; # Follow mouse cursor
      };
      urgency_normal = {
        background = "#1F1F28"; # Kanagawa dark background
        foreground = "#DCD7BA"; # Kanagawa light text
        timeout = 5;
      };
      urgency_low = {
        background = "#1F1F28"; # Kanagawa dark background
        foreground = "#C0A36E"; # Kanagawa yellow for subtle highlight
        timeout = 3;
      };
      urgency_critical = {
        background = "#C34043"; # Kanagawa red for critical
        foreground = "#1F1F28"; # Dark text for contrast
        frame_color = "#C34043"; # Matching red border
        timeout = 0;
      };
      screenshot_rule = {
        appname = "Screenshot";
        summary = "Screenshot";
        urgency = "normal";
        background = "#1E1E2E";
        foreground = "#CDD6F4";
        frame_color = "#CBA6F7"; # Maps to border in dunstrc
        frame_width = 2; # Maps to border_width
        max_icon_size = 96; # Maps to icon_height
        format = "<b>%s</b>\n%i\n%b"; # Bold title, icon, body
      };
    };
  };
}
