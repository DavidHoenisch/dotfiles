{ config, pkgs, ... }:

{
  imports = [
	./waybar.nix
	./tmux.nix
	./fish.nix
	./nvim.nix
	./rofi.nix
	./dunst.nix
];

  home.username = "dhoenisch";
  home.homeDirectory = "/home/dhoenisch";
  home.stateVersion = "24.11";

  home.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
  };
  xsession.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "default-web-browser" = "app.zen_browser.zen";
      "text/html" = "app.zen_browser.zen";
      "x-scheme-handler/http" = "app.zen_browser.zen";
      "x-scheme-handler/https" = "app.zen_browser.zen";
      "video/mp4" = "org.videolan.VLC";
      "audio/mpeg" = "org.videolan.VLC";
    };
  };
# Enable Git
  programs.git = {
    enable = true;

    # User information
    userName = "DavidHoenisch";
    userEmail = "dh1689@pm.me";

    # Git aliases
    aliases = {
      co = "checkout";
      ci = "commit";
      st = "status";
      br = "branch";
      lg = "log --graph --oneline --all";
    };

    # Extra Git configuration
    extraConfig = {
      core = {
        editor = "vim"; # Set your preferred editor
      };
      init = {
        defaultBranch = "main"; # Default branch name
      };
      pull = {
        rebase = true; # Use rebase on pull by default
      };
      push = {
        default = "simple"; # Push only the current branch
      };
    };

    # Include .gitignore_global
    ignores = [
      "*.swp"
      ".DS_Store"
      ".env"
    ];
  };

  # Sway configuration
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    systemd.enable = true;

    config = {
      # Basic settings
      terminal = "alacritty";
      menu = "rofi -terminal '${config.wayland.windowManager.sway.config.terminal}' -show combi -combi-modes drun#run -modes combi";
      modifier = "Mod1"; # Alt key

      # Bar configuration
      bars = [{
        command = "waybar";
      }];

      # Input configuration
      input = {
        "1267:12573:ELAN0412:00_04F3:311D_Touchpad" = {
          natural_scroll = "enabled";
        };
        "12815:8195:PixArt_OpticalMouse" = {
          natural_scroll = "enabled";
        };
      };

      # Output configuration
      output = {
	   #     "*" = {
	   # bg = "${config.home.homeDirectory}/Pictures/Wallpapers/beautiful-japanese-forest-scene.jpg fill";
	   #     };
	   };

      # Keybindings
      keybindings = let
        mod = config.wayland.windowManager.sway.config.modifier;
      in {
        # Basic window management
        "${mod}+Return" = "exec ${config.wayland.windowManager.sway.config.terminal}";
        "${mod}+Shift+q" = "kill";
        "${mod}+d" = "exec ${config.wayland.windowManager.sway.config.menu}";
        "${mod}+Shift+r" = "reload";
        "${mod}+Shift+e" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'";
        "${mod}+Shift+b" = "exec zen-browser";
        "Print" = "exec $HOME/.local/bin/custom/screenshot.sh";
        "${mod}+Shift+n" = "exec $HOME/.local/bin/custom/kscreens";
        "${mod}+Shift+w" = "exec $HOME/.local/bin/custom/wscreen";
        "${mod}+Escape" = "exec $HOME/.local/bin/custom/lockscreen";

        # Focus navigation
        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";
        "${mod}+Left" = "focus left";
        "${mod}+Down" = "focus down";
        "${mod}+Up" = "focus up";
        "${mod}+Right" = "focus right";

        # Move windows
        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";
        "${mod}+Shift+Left" = "move left";
        "${mod}+Shift+Down" = "move down";
        "${mod}+Shift+Up" = "move up";
        "${mod}+Shift+Right" = "move right";

        # Workspace navigation
        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";
        "${mod}+0" = "workspace number 10";

        # Move windows to workspace
        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5";
        "${mod}+Shift+6" = "move container to workspace number 6";
        "${mod}+Shift+7" = "move container to workspace number 7";
        "${mod}+Shift+8" = "move container to workspace number 8";
        "${mod}+Shift+9" = "move container to workspace number 9";
        "${mod}+Shift+0" = "move container to workspace number 10";

        # Move workspace to output
        "${mod}+Control+Shift+Right" = "move workspace to output right";
        "${mod}+Control+Shift+Left" = "move workspace to output left";
        "${mod}+Control+Shift+Down" = "move workspace to output down";
        "${mod}+Control+Shift+Up" = "move workspace to output up";

        # Layout toggles
        "${mod}+b" = "splith";
        "${mod}+v" = "splitv";
        "${mod}+s" = "layout stacking";
        "${mod}+w" = "layout tabbed";
        "${mod}+e" = "layout toggle split";
        "${mod}+f" = "fullscreen";
        "${mod}+Shift+space" = "floating toggle";
        "${mod}+space" = "focus mode_toggle";
        "${mod}+a" = "focus parent";

        # Scratchpad
        "${mod}+Shift+minus" = "move scratchpad";
        "${mod}+minus" = "scratchpad show";

        # Resize mode
        "${mod}+r" = "mode \"resize\"";

        # Volume controls
        "XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +5%";
        "XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -5%";
        "XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";

        # Brightness controls
        "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
        "XF86MonBrightnessUp" = "exec brightnessctl set +5%";
      };

      # Modes
      modes = {
        resize = {
          "h" = "resize shrink width 10px";
          "j" = "resize grow height 10px";
          "k" = "resize shrink height 10px";
          "l" = "resize grow width 10px";
          "Left" = "resize shrink width 10px";
          "Down" = "resize grow height 10px";
          "Up" = "resize shrink height 10px";
          "Right" = "resize grow width 10px";
          "Return" = "mode \"default\"";
          "Escape" = "mode \"default\"";
        };
      };

      # Colors
      colors = {
        background = "#332b2b";
        focused = {
          border = "#2aa198";
          background = "#332b2b";
          text = "#ffffff";
          indicator = "#2aa198";
          childBorder = "#2aa198";
        };
        focusedInactive = {
          border = "#00000000";
          background = "#332b2b";
          text = "#ffffff";
          indicator = "#ffffff";
          childBorder = "#00000000";
        };
        unfocused = {
          border = "#00000000";
          background = "#00000000";
          text = "#ffffff";
          indicator = "#2aa198";
          childBorder = "#00000000";
        };
        urgent = {
          border = "#fb4934";
          background = "#fb4934";
          text = "#fb4934";
          indicator = "#fb4934";
          childBorder = "#fb4934";
        };
      };

      # Window settings
      window = {
        border = 2;
        commands = [
          {
            command = "floating enable";
            criteria = { class = "screenkey"; };
          }
          {
            command = "floating enable";
            criteria = { class = "smile"; };
          }
          {
            command = "floating enable";
            criteria = { class = "Volume Control"; };
          }
        ];
      };

      # Floating modifier
      floating = {
        modifier = "${config.wayland.windowManager.sway.config.modifier}";
      };

      # Gaps
      gaps = {
        inner = 8;
        outer = 3;
      };

      # Startup commands
      startup = [
        # Idle configuration
        {
          command = "swayidle -w timeout 300 'swaylock -f -c 000000' timeout 600 'swaymsg \"output * power off\"' resume 'swaymsg \"output * power on\"' before-sleep 'swaylock -f -c 000000'";
        }
      ];
    };

    # Extra configuration for include directive
    extraConfig = ''
      # Note: The include directive for /usr/share/sway/config.d/*.conf, /etc/sway/config.d/*.conf,
      # and ~/.config/sway/config.d/*.conf is not directly supported in Home Manager.
      # You can manually merge these configs into this file or manage them separately
      # in ~/.config/sway/config.d/ and include them via a system-level Sway config.
      # output "*" bg /etc/beautiful-japanese-forest-scene.jpg fill
    '';
  };


  # Swaylock configuration
  programs.swaylock = {
    enable = true;
    settings = {
      color = "000000";
    };
  };


  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.9;
      font.normal = {
        family = "FiraCode Nerd Font Mono";
        style = "Regular";
      };
      font.size = 14;
    };
  };


	#  services.sxhkd = {
	#  	enable = true;
	# keybindings = {
	# 	"alt + d" = "/run/current-system/sw/bin/rofi -show drun";
	# };
	#  };

  home.file.".config/bat/config".text = ''
    --theme="Nord"
    --style="numbers,changes,grid"
    --paging=auto
  '';

  # home.file.".config/qtile".source = /home/tony/home-manager-dotfiles/qtile;

}
