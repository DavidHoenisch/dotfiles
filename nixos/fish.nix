# Fish shell configuration for Home Manager
{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;

    # Interactive shell initialization
    interactiveShellInit = ''
      # Set up Starship prompt
      starship init fish | source

      # Initialize zoxide for fast directory navigation
      zoxide init fish | source

      # Set up fzf keybindings
      fzf --fish | source

      # Setup atuin shell history
      atuin init fish | source

      # Disable Fish greeting
      set fish_greeting

      # Set editor to Neovim
      set -gx EDITOR nvim

      # Add custom paths (e.g., for user binaries)
      fish_add_path $HOME/.local/bin

      # Cyberpunk-themed variables
      set -gx FISH_CYBERPUNK_MODE 1
    '';

    # Shell aliases for productivity and flair
    shellAliases = {
      # General shortcuts
      ll = "eza --long --git --icons";
      la = "eza --long --all --git --icons";
      tree = "eza --tree --icons";
      cat = "bat";
      grep = "rg";
      find = "fd";
      du = "dust";
      ps = "procs";
      top = "btop";

      # Git shortcuts
      gs = "git status";
      ga = "git add";
      gc = "git commit -m";
      gp = "git push";
      gd = "git diff";
      gl = "git log --oneline --graph --all";

      # NixOS shortcuts
      nrs = "sudo nixos-rebuild switch";
      hms = "home-manager switch";
      ncg = "nix-collect-garbage";
      nsp = "nix-shell -p";

      # Navigation with zoxide
      cd = "z";
      j = "z";

      # Fun and flair
      hack = "echo 'Initializing cyberpunk matrix...' && cmatrix -C magenta";
      neon = "echo 'Activating neon glow...' && glow $HOME/.config/fish/config.fish";
    };

    # Fish functions
    functions = {
      # Quick function to create and enter a new directory
      mkcd = ''
        function mkcd
          mkdir -p $argv[1]
          cd $argv[1]
        end
      '';

      # Function to update NixOS and Home Manager
      update-system = ''
        function update-system
          echo "Updating NixOS..."
          sudo nix-channel --update
          sudo nixos-rebuild switch --upgrade
          echo "Updating Home Manager..."
          home-manager switch
          echo "Cleaning up old generations..."
          nix-collect-garbage -d
        end
      '';

      # Function for a cyberpunk-themed greeting
      cyberpunk-welcome = ''
        function cyberpunk-welcome
          set -l neon_colors magenta cyan green
          set -l random_color (random choice $neon_colors)
          echo -e "\e[1;35mWelcome to the Neon Grid, $USER!\e[0m"
          echo -e "\e[0;36mSystem ready. Hack the planet!\e[0m"
        end
        cyberpunk-welcome
      '';
    };

    # Plugins for enhanced functionality
    plugins = [
      {
        name = "done";
        src = pkgs.fishPlugins.done;
      }
      {
        name = "fzf-fish";
        src = pkgs.fishPlugins.fzf-fish;
      }
      {
        name = "sponge";
        src = pkgs.fishPlugins.sponge;
      }
      {
        name = "pisces";
        src = pkgs.fishPlugins.pisces;
      }
    ];
  };

  # Starship configuration for a cyberpunk-themed prompt
  # programs.starship = {
  #   enable = true;
  #   settings = {
  #     add_newline = true;
  #     format = ''
  #       [┌───────────────────](bold cyan)
  #       [│](bold cyan)$username$hostname$directory$git_branch$git_status
  #       [└─](bold cyan)$character
  #     '';
  #     username = {
  #       style_user = "magenta bold";
  #       style_root = "red bold";
  #       format = "[$user]($style)@";
  #       show_always = true;
  #     };
  #     hostname = {
  #       ssh_only = false;
  #       format = "[$hostname](cyan bold) ";
  #     };
  #     directory = {
  #       style = "blue bold";
  #       truncate_to_repo = true;
  #       truncation_length = 3;
  #     };
  #     git_branch = {
  #       format = "[$symbol$branch]($style) ";
  #       style = "green bold";
  #       symbol = " ";
  #     };
  #     git_status = {
  #       format = "[$all_status$ahead_behind]($style) ";
  #       style = "yellow bold";
  #     };
  #     character = {
  #       success_symbol = "[➜](green bold)";
  #       error_symbol = "[✗](red bold)";
  #     };
  #     palette = "cyberpunk";
  #     palettes.cyberpunk = {
  #       magenta = "#ff00ff";
  #       cyan = "#00ffff";
  #       green = "#00ff00";
  #       yellow = "#ffff00";
  #       red = "#ff0000";
  #       blue = "#0000ff";
  #       white = "#ffffff";
  #       black = "#000000";
  #     };
  #   };
  # };
  #
  # # Ensure Fish is the default shell
  # programs.fish.loginShellInit = ''
  #   if status is-login
  #     and test -z "$DISPLAY"
  #     and test (tty) = "/dev/tty1"
  #       exec sway
  #   end
  # '';
}
