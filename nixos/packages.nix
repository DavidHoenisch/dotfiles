# Fish shell configuration for Home Manager
{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    act
    adwaita-icon-theme # Base icon theme
    age
    alacritty
    amber-lang
    ansible
    arandr
    atuin
    bash-language-server
    bat
    bibata-cursors
    black
    brightnessctl
    btop
    cargo
    chafa
    chezmoi
    chromium
    clang
    cmatrix
    cobra-cli
    container-structure-test
    cosign
    devpod
    direnv
    dive
    doctl
    dunst
    dust
    eget
    eza
    fd
    feh
    ffmpeg
    fira-code-nerdfont
    flatpak-builder
    flyctl
    fx
    fzf
    gh
    ghostty
    git
    glibcLocales
    glow
    gnome-boxes
    go
    go-task
    gomarkdoc
    gomodifytags
    gotools
    grim
    grpcurl
    helix
    hoard
    id3v2
    jq
    k9s
    kanshi
    libgcc
    libnotify
    lua-language-server
    luarocks
    mako
    neovim
    networkmanager_dmenu
    nodejs_24
    pandoc
    papirus-icon-theme
    papirus-icon-theme # For additional icons
    pavucontrol
    pcmanfm
    pet
    portal
    prettierd
    procs
    pyright
    python314
    ripgrep
    rm-improved
    roboto
    rofi
    silicon
    slurp
    starship
    stow
    stylua
    swaybg
    swayidle
    swayimg
    swaylock
    talosctl
    tree-sitter
    typescript-language-server
    unzip
    waybar
    wget
    wl-clipboard
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman
    xwallpaper
    yamlfix
    zoxide
];

}






