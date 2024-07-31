{
  config,
  pkgs,
  ...
}: {
  home = {
    homeDirectory = "/home/dhoenisch";

    packages = with pkgs; [
      age
      alacritty
      amber-lang
      atuin
      bat
      bitwarden-desktop
      brave
      btop
      discord
      docker
      espanso
      ffmpeg
      flyctl
      gh
      go
      go-task
      gotools
      hoard
      insomnia
      jitsi-meet-electron
      k9s
      kind
      kubernetes-helm
      nodejs
      nomad
      obs-studio
      okular
      ollama
      pandoc-cli
      pet
      podman
      podman-desktop
      pyenv
      ripgrep
      signal-desktop
      skim
      sops
      telegram-desktop
      watchexec
      xsv
      yazi
      yq
      zoxide
      bat
      docker
      docker-compose
      fd
      fzf
      gh
      git
      glow
      gum
      ncdu
      neovim
      nix-direnv
      ripgrep
      ripgrep-all
    ];

    stateVersion = "22.11";
    username = "dhoenisch";
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  programs.home-manager.enable = true;
}
