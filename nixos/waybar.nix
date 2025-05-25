{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        position = "top";
        height = 36; # Slightly increased for Material UI look
        spacing = 6; # Increased spacing for better visual separation
        margin-top = 6; # Add top margin for floating effect
        margin-left = 8; # Add left margin 
        margin-right = 8; # Add right margin
        modules-left = [
          "sway/workspaces"
          "sway/mode"
          "sway/scratchpad"
        ];
        modules-center = [];
        modules-right = [
          "idle_inhibitor"
          "pulseaudio"
          "network"
          "power-profiles-daemon"
          "battery"
          "clock"
        ];
        "sway/workspaces" = {
          all-outputs = true;
          warp-on-scroll = false;
          format = "{name}: {icon}";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "󰟵";
            "4" = "󰊻";
            "5" = "󰎞";
            urgent = "";
            focused = "";
            default = "";
          };
        };
        "keyboard-state" = {
          numlock = true;
          capslock = true;
          format = "{name} {icon}";
          format-icons = {
            locked = "";
            unlocked = "";
          };
        };
        "sway/mode" = {
          format = "<span style=\"italic\">{}</span>";
        };
        "sway/scratchpad" = {
          format = "{icon} {count}";
          show-empty = false;
          format-icons = [ "" "" ];
          tooltip = true;
          tooltip-format = "{app}: {title}";
        };
        "mpd" = {
          format = "{stateIcon} {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}{artist} - {album} - {title} ({elapsedTime:%M:%S}/{totalTime:%M:%S}) ⸨{songPosition}|{queueLength}⸩ {volume}% ";
          format-disconnected = "Disconnected ";
          format-stopped = "{consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped ";
          unknown-tag = "N/A";
          interval = 5;
          consume-icons = {
            on = " ";
          };
          random-icons = {
            off = "<span color=\"#f53c3c\"></span> ";
            on = " ";
          };
          repeat-icons = {
            on = " ";
          };
          single-icons = {
            on = "1 ";
          };
          state-icons = {
            paused = "";
            playing = "";
          };
          tooltip-format = "MPD (connected)";
          tooltip-format-disconnected = "MPD (disconnected)";
        };
        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };
        "clock" = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
        };
        "cpu" = {
          format = "{usage}% ";
          tooltip = false;
        };
        "memory" = {
          format = "{}% ";
        };
        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-full = "{capacity}% {icon}";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-alt = "{time} {icon}";
          format-icons = [ "" ];
        };
        "battery#bat2" = {
          bat = "BAT2";
        };
        "power-profiles-daemon" = {
          format = "{icon}";
          tooltip-format = "Power profile: {profile}\nDriver: {driver}";
          tooltip = true;
          format-icons = {
            default = "";
            performance = "";
            balanced = "";
            power-saver = "";
          };
        };
        "network" = {
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ipaddr}/{cidr} ";
          tooltip-format = "{ifname} via {gwaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
          on-click = "networkmanager_dmenu";
	  format-icons = {
		default = "";
	  };
        };
        "pulseaudio" = {
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "󰋋";
            hands-free = "";
            headset = "";
            phone = "󱆩";
            portable = "󰄜";
            car = "";
            default = "󰗅";
          };
          on-click = "pavucontrol";
        };
        "custom/media" = {
          format = "{icon} {}";
          return-type = "json";
          max-length = 40;
          format-icons = {
            spotify = "";
            default = "🎜";
          };
          escape = true;
          exec = "$HOME/.config/waybar/mediaplayer.py 2> /dev/null";
        };
      };
    };
    style = ''
    /* Material UI-inspired Kanagawa theme for Waybar */
    
    /* Kanagawa palette */
    /* 
      fujiWhite: #DCD7BA
      oldWhite: #C8C093
      sumiInk0: #16161D
      sumiInk1: #1F1F28
      sumiInk2: #2A2A37
      sumiInk3: #363646
      sumiInk4: #54546D
      waveBlue1: #223249
      waveBlue2: #2D4F67
      winterGreen: #2B3328
      winterYellow: #49443C
      winterRed: #43242B
      winterBlue: #252535
      autumnGreen: #76946A
      autumnRed: #C34043
      autumnYellow: #DCA561
      samuraiRed: #E82424
      roninYellow: #FF9E3B
      waveAqua1: #6A9589
      dragonBlue: #658594
      fujiGray: #727169
      springViolet1: #938AA9
      oniViolet: #957FB8
      crystalBlue: #7E9CD8
      springViolet2: #9CABCA
      springBlue: #7FB4CA
      lightBlue: #A3D4D5
      waveAqua2: #7AA89F
      springGreen: #98BB6C
      boatYellow1: #938056
      boatYellow2: #C0A36E
      carpYellow: #E6C384
      sakuraPink: #D27E99
      waveRed: #E46876
      peachRed: #FF5D62
      surimiOrange: #FFA066
      katanaGray: #717C7C
    */
    
    * {
        font-family: 'FiraCode Nerd Font Mono', 'Font Awesome 6 Free', 'Font Awesome 6 Brands', sans-serif;
        font-size: 14px;
        font-weight: 400;
        border-radius: 4px;  /* Material UI uses more subtle rounded corners */
        color: #DCD7BA;  /* fujiWhite */
        transition: all 0.3s ease-in-out;  /* Slightly smoother transitions */
    }
    
    window#waybar {
        background-color: rgba(22, 22, 29, 0.85);  /* Slightly darker, semi-transparent sumiInk0 */
        color: #DCD7BA;  /* fujiWhite */
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.5);  /* Enhanced Material design elevation */
        margin: 8px 8px 0;  /* Add margins for floating effect */
        border-radius: 12px;  /* Rounded corners for floating appearance */
        border: 1px solid rgba(122, 168, 159, 0.08);  /* Very subtle border */
    }
    
    window#waybar.hidden {
        opacity: 0.2;
    }
    
    /* Material UI uses subtle hover effects */
    button {
        border: none;
        background: transparent;
        padding: 0 10px;
        margin: 4px 2px;
        min-height: 28px;  /* Ensures buttons have consistent height */
        transition: all 0.2s ease;
    }
    
    button:hover {
        background: rgba(122, 168, 159, 0.15);  /* waveAqua2 with low opacity */
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12);  /* Subtle elevation on hover */
    }
    
    #pulseaudio:hover {
        background: rgba(149, 127, 184, 0.15);  /* oniViolet with low opacity */
    }
    
    #workspaces button {
        padding: 0 8px;
        background: transparent;
        color: #C8C093;  /* oldWhite - slightly dimmer for inactive */
        border-radius: 8px;  /* More rounded corners */
        margin: 4px 2px;
        min-width: 36px;  /* Ensures consistent width for workspace buttons */
        transition: all 0.2s ease;
    }
    
    #workspaces button:hover {
        background: rgba(122, 168, 159, 0.2);  /* waveAqua2 with low opacity */
        color: #DCD7BA;  /* fujiWhite */
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.15);  /* Enhanced elevation on hover */
    }
    
    /* Active workspace - primary color with elevation */
    #workspaces button.focused {
        background: #7AA89F;  /* waveAqua2 */
        color: #16161D;  /* sumiInk0 - dark text on light background for contrast */
        box-shadow: 0 3px 6px rgba(0, 0, 0, 0.2);  /* Enhanced Material elevation */
        font-weight: 500;  /* Slightly bolder */
    }
    
    #workspaces button.urgent {
        background: #C34043;  /* autumnRed */
        color: #DCD7BA;  /* fujiWhite */
        box-shadow: 0 2px 4px rgba(195, 64, 67, 0.4);  /* Colored shadow for emphasis */
    }
    
    #mode {
        background: #957FB8;  /* oniViolet */
        color: #16161D;  /* sumiInk0 */
        padding: 0 12px;
        margin: 4px;
        border-radius: 4px;
        box-shadow: 0 2px 4px rgba(149, 127, 184, 0.4);  /* Colored shadow */
    }
    
    /* Common module styling - Material card-like appearance */
    #clock,
    #battery,
    #cpu,
    #memory,
    #disk,
    #temperature,
    #backlight,
    #network,
    #pulseaudio,
    #wireplumber,
    #custom-media,
    #tray,
    #mode,
    #idle_inhibitor,
    #scratchpad,
    #power-profiles-daemon,
    #mpd {
        padding: 0 12px;
        margin: 4px 3px;
        background: #2A2A37;  /* sumiInk2 */
        border-radius: 8px;  /* More rounded for modules */
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.12);  /* Material card shadow */
        min-height: 28px;  /* Consistent height */
        transition: all 0.2s ease;
    }
    
    /* Module hover effects */
    #clock:hover,
    #battery:hover,
    #cpu:hover,
    #memory:hover,
    #network:hover,
    #pulseaudio:hover,
    #power-profiles-daemon:hover,
    #idle_inhibitor:hover {
        background: #363646;  /* sumiInk3 - slightly lighter on hover */
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);  /* Increased elevation */
    }
    
    #window,
    #workspaces {
        margin: 0 8px;
    }
    
    .modules-left > widget:first-child > #workspaces {
        margin-left: 4px;
    }
    
    .modules-right > widget:last-child > #workspaces {
        margin-right: 4px;
    }
    
    /* Clock - special accent */
    #clock {
        background: #54546D;  /* sumiInk4 - slightly distinctive */
        color: #DCD7BA;  /* fujiWhite */
        font-weight: 500;  /* Slightly bolder for readability */
    }
    
    /* Battery states */
    #battery {
        background: #2A2A37;  /* sumiInk2 */
        color: #DCD7BA;  /* fujiWhite */
        transition: all 0.3s ease;
    }
    
    #battery.charging, #battery.plugged {
        background: #98BB6C;  /* springGreen */
        color: #16161D;  /* sumiInk0 */
        box-shadow: 0 2px 4px rgba(152, 187, 108, 0.4);  /* Colored shadow */
    }
    
    /* Battery warning animation */
    @keyframes blink {
        to {
            background: #C34043;  /* autumnRed */
            color: #DCD7BA;  /* fujiWhite */
            box-shadow: 0 2px 8px rgba(195, 64, 67, 0.6);  /* Brighter shadow during warning */
        }
    }
    
    #battery.critical:not(.charging) {
        background: #C34043;  /* autumnRed */
        color: #DCD7BA;  /* fujiWhite */
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: ease-in-out;  /* Smoother animation */
        animation-iteration-count: infinite;
        animation-direction: alternate;
        box-shadow: 0 2px 8px rgba(195, 64, 67, 0.4);  /* Colored shadow */
    }
    
    /* Power profile styles */
    #power-profiles-daemon {
        background: #2A2A37;  /* sumiInk2 */
        color: #DCD7BA;  /* fujiWhite */
    }
    
    #power-profiles-daemon.performance {
        background: #957FB8;  /* oniViolet */
        color: #16161D;  /* sumiInk0 */
        box-shadow: 0 2px 4px rgba(149, 127, 184, 0.4);  /* Colored shadow */
    }
    
    #power-profiles-daemon.balanced {
        background: #7AA89F;  /* waveAqua2 */
        color: #16161D;  /* sumiInk0 */
        box-shadow: 0 2px 4px rgba(122, 168, 159, 0.4);  /* Colored shadow */
    }
    
    #power-profiles-daemon.power-saver {
        background: #98BB6C;  /* springGreen */
        color: #16161D;  /* sumiInk0 */
        box-shadow: 0 2px 4px rgba(152, 187, 108, 0.4);  /* Colored shadow */
    }
    
    label:focus {
        background: #54546D;  /* sumiInk4 */
        color: #DCD7BA;  /* fujiWhite */
    }
    
    /* System resource modules */
    #cpu {
        background: #2A2A37;  /* sumiInk2 */
        color: #DCD7BA;  /* fujiWhite */
        border-left: 2px solid rgba(122, 168, 159, 0.5);  /* waveAqua2 accent */
    }
    
    #memory {
        background: #2A2A37;  /* sumiInk2 */
        color: #DCD7BA;  /* fujiWhite */
        border-left: 2px solid rgba(149, 127, 184, 0.5);  /* oniViolet accent */
    }
    
    #disk {
        background: #2A2A37;  /* sumiInk2 */
        color: #DCD7BA;  /* fujiWhite */
    }
    
    #backlight {
        background: #2A2A37;  /* sumiInk2 */
        color: #DCD7BA;  /* fujiWhite */
    }
    
    /* Network states */
    #network {
        background: #2A2A37;  /* sumiInk2 */
        color: #DCD7BA;  /* fujiWhite */
        transition: all 0.3s ease;
    }
    
    #network.disconnected {
        background: #C34043;  /* autumnRed */
        color: #DCD7BA;  /* fujiWhite */
        box-shadow: 0 2px 4px rgba(195, 64, 67, 0.4);  /* Colored shadow */
    }
    
    /* Audio modules */
    #pulseaudio {
        background: #2A2A37;  /* sumiInk2 */
        color: #DCD7BA;  /* fujiWhite */
    }
    
    #pulseaudio.muted {
        background: #54546D;  /* sumiInk4 */
        color: #C8C093;  /* oldWhite - dimmer when muted */
        font-style: italic;
    }
    
    #wireplumber {
        background: #2A2A37;  /* sumiInk2 */
        color: #DCD7BA;  /* fujiWhite */
    }
    
    #wireplumber.muted {
        background: #C34043;  /* autumnRed */
        color: #DCD7BA;  /* fujiWhite */
    }
    
    /* Media player */
    #custom-media {
        background: #98BB6C;  /* springGreen */
        color: #16161D;  /* sumiInk0 */
        min-width: 100px;
        box-shadow: 0 2px 4px rgba(152, 187, 108, 0.4);  /* Colored shadow */
    }
    
    #custom-media.custom-spotify {
        background: #98BB6C;  /* springGreen */
    }
    
    #custom-media.custom-vlc {
        background: #957FB8;  /* oniViolet */
    }
    
    /* Temperature module */
    #temperature {
        background: #2A2A37;  /* sumiInk2 */
        color: #DCD7BA;  /* fujiWhite */
    }
    
    #temperature.critical {
        background: #C34043;  /* autumnRed */
        color: #DCD7BA;  /* fujiWhite */
        box-shadow: 0 2px 4px rgba(195, 64, 67, 0.4);  /* Colored shadow */
    }
    
    /* System tray */
    #tray {
        background: #2A2A37;  /* sumiInk2 */
        padding: 0 10px;
    }
    
    #tray > .passive {
        -gtk-icon-effect: dim;
    }
    
    #tray > .needs-attention {
        -gtk-icon-effect: highlight;
        background: #C34043;  /* autumnRed */
    }
    
    /* Idle inhibitor */
    #idle_inhibitor {
        background: #2A2A37;  /* sumiInk2 */
        color: #DCD7BA;  /* fujiWhite */
    }
    
    #idle_inhibitor.activated {
        background: #7AA89F;  /* waveAqua2 */
        color: #16161D;  /* sumiInk0 */
        box-shadow: 0 2px 4px rgba(122, 168, 159, 0.4);  /* Colored shadow */
    }
    
    /* Music player daemon */
    #mpd {
        background: #98BB6C;  /* springGreen */
        color: #16161D;  /* sumiInk0 */
        box-shadow: 0 2px 4px rgba(152, 187, 108, 0.4);  /* Colored shadow */
    }
    
    #mpd.disconnected {
        background: #C34043;  /* autumnRed */
        color: #DCD7BA;  /* fujiWhite */
    }
    
    #mpd.stopped {
        background: #54546D;  /* sumiInk4 */
        color: #DCD7BA;  /* fujiWhite */
    }
    
    #mpd.paused {
        background: #7AA89F;  /* waveAqua2 */
        color: #16161D;  /* sumiInk0 */
        font-style: italic;
    }
    
    /* Language indicator */
    #language {
        background: #7AA89F;  /* waveAqua2 */
        color: #16161D;  /* sumiInk0 */
        padding: 0 8px;
        margin: 4px;
        min-width: 16px;
        box-shadow: 0 2px 4px rgba(122, 168, 159, 0.4);  /* Colored shadow */
    }
    
    /* Keyboard state */
    #keyboard-state {
        background: #957FB8;  /* oniViolet */
        color: #16161D;  /* sumiInk0 */
        padding: 0;
        margin: 4px;
        min-width: 16px;
        box-shadow: 0 2px 4px rgba(149, 127, 184, 0.4);  /* Colored shadow */
    }
    
    #keyboard-state > label {
        padding: 0 8px;
    }
    
    #keyboard-state > label.locked {
        background: rgba(22, 22, 29, 0.3);  /* sumiInk0 with opacity */
    }
    
    /* Scratchpad */
    #scratchpad {
        background: rgba(31, 31, 40, 0.3);  /* Semi-transparent */
    }
    
    #scratchpad.empty {
        background: transparent;
    }
    
    /* Privacy indicators */
    #privacy {
        padding: 0;
    }
    
    #privacy-item {
        padding: 0 8px;
        color: #DCD7BA;  /* fujiWhite */
        margin: 4px 2px;
        border-radius: 4px;
    }
    
    #privacy-item.screenshare {
        background: #957FB8;  /* oniViolet */
        color: #16161D;  /* sumiInk0 */
        box-shadow: 0 2px 4px rgba(149, 127, 184, 0.4);  /* Colored shadow */
    }
    
    #privacy-item.audio-in {
        background: #98BB6C;  /* springGreen */
        color: #16161D;  /* sumiInk0 */
        box-shadow: 0 2px 4px rgba(152, 187, 108, 0.4);  /* Colored shadow */
    }
    
    #privacy-item.audio-out {
        background: #7AA89F;  /* waveAqua2 */
        color: #16161D;  /* sumiInk0 */
        box-shadow: 0 2px 4px rgba(122, 168, 159, 0.4);  /* Colored shadow */
    }
    '';
  };
}
