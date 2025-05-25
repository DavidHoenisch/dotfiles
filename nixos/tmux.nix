# Tmux configuration for Home Manager
{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    terminal = "screen-256color";
    escapeTime = 10;
    keyMode = "vi";
    prefix = "C-Space";
    mouse = true;
    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = resurrect;
        extraConfig = "set -g @resurrect-capture-pane-contents 'on'";
      }
      {
        plugin = continuum;
        extraConfig = "set -g @continuum-restore 'on'";
      }
      # Note: tmuxifier, tmux-cht-sh, tmux-fuzzback are not in nixpkgs.
      # You can add them manually or define custom derivations.
      # Example for tmux-fuzzback:
      {
        plugin = pkgs.tmuxPlugins.mkTmuxPlugin {
          pluginName = "tmux-fuzzback";
          version = "1.0.0";
          src = pkgs.fetchFromGitHub {
            owner = "roosta";
            repo = "tmux-fuzzback";
            rev = "master"; # Use specific commit or tag
            sha256 = "sha256-2UlyX5X3rlvrMJ9r8imlQzZyeaubzL0Lp3fX++VUUhQ="; # Replace with actual hash
          };
        };
        extraConfig = "set -g @fuzzback-popup 1";
      }
      # Similarly, add tmuxifier and tmux-cht-sh if needed
    ];
    extraConfig = ''
      # Terminal overrides
      set -ga terminal-overrides ",xterm-256color:Tc"

      # Status bar styling
      set -g status-style fg=white,bg=default
      set -g pane-border-style fg=green
      set -g pane-active-border-style fg=blue

      # Keybindings
      unbind C-b
      bind-key C-Space send-prefix
      unbind %
      bind | split-window -h
      unbind '"'
      bind - split-window -v
      unbind r
      bind r source-file ${config.xdg.configHome}/tmux/tmux.conf
      bind -r j resize-pane -D 5
      bind -r k resize-pane -U 5
      bind -r l resize-pane -R 5
      bind -r h resize-pane -L 5
      bind -r m resize-pane -Z
      bind-key -T copy-mode-vi 'v' send -X begin-selection
      bind-key -T copy-mode-vi 'y' send -X copy-selection
      unbind -T copy-mode-vi MouseDragEnd1Pane

      # Initialize TPM
      set -g @plugin 'tmux-plugins/tpm'
      run '${config.xdg.configHome}/tmux/plugins/tpm/tpm'
    '';
  };

  # Ensure TPM plugins directory exists
  home.file.".config/tmux/plugins/tpm".source = pkgs.fetchFromGitHub {
    owner = "tmux-plugins";
    repo = "tpm";
    rev = "v3.1.0"; # Use a specific version for reproducibility
    sha256 = "sha256-CeI9Wq6tHqV68woE11lIY4cLoNY8XWyXyMHTDmFKJKI=";
  };
}
