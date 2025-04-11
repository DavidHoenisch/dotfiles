#!/bin/bash

sudo apt update && sudo apt upgrade -y

sudo apt install -y \
    build-essential \
    cmake \
    meson \
    ninja-build \
    pkg-config \
    libwayland-dev \
    wayland-protocols \
    libxkbcommon-dev \
    libinput-dev \
    libcap-dev \
    libpam0g-dev \
    libsystemd-dev \
    libjson-c-dev \
    libpcre2-dev \
    libevdev-dev \
    libudev-dev \
    libgles2-mesa-dev \
    libpixman-1-dev \
    libcairo2-dev \
    libpango1.0-dev \
    libgdk-pixbuf2.0-dev \
    libxcb1-dev \
    libxcb-composite0-dev \
    libxcb-xinput-dev \
    libxcb-xkb-dev \
    libx11-xcb-dev \
    libxcb-randr0-dev \
    libxcb-xfixes0-dev \
    libxcb-shape0-dev \
    libxcb-icccm4-dev \
    libxcb-image0-dev \
    libxcb-present-dev \
    libxcb-xinerama0-dev \
    libxcb-glx0-dev \
    libxcb-dri3-dev \
    libxcb-util0-dev \
    libxcb-cursor-dev \
    libsystemd-dev \
    libcairo2-dev \
    libpango1.0-dev \
    libgdk-pixbuf2.0-dev \
    libpixman-1-dev \
    libwayland-dev \
    wayland-protocols \
    libxkbcommon-dev \
    libinput-dev \
    libcap-dev \
    libpam0g-dev \
    libsystemd-dev \
    libjson-c-dev \
    libpcre2-dev \
    libevdev-dev \
    libudev-dev \
    libgles2-mesa-dev \
    

sudo apt install -y \
    sway \
    swaybg \
    swayidle \
    swaylock \
    xwayland \
    dmenu \
    rofi \
    waybar \
    wl-clipboard \
    grim \
    slurp \
    gdm3 \ 
    alacritty \ 
    wofi \ 
    fonts-font-awesome \
    flatpak \ 
    zsh \ 
    pipx \
    ranger \
    parallel



sudo systemctl enable gdm3

sudo -E chsh -s /bin/zsh $USER


# install webi packages
curl -sS https://webi.sh/webi | sh

