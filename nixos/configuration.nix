# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
	home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz";
in

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      (import "${home-manager}/nixos")
      ./packages.nix
      ./gtk.nix
    ];

  environment.variables = {
    PATH = [ "$HOME/go/bin" ];
  };

  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;
  boot.kernelModules = [ "kvm-amd" "kvm-intel" ];

  environment.etc."beautiful-japanese-forest-scene.jpg".source = ./beautiful-japanese-forest-scene.jpg;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];	
  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
  home-manager.backupFileExtension = "backup";
  home-manager.users.dhoenisch = import ./home.nix;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-91510055-d97a-45c8-bf8d-477f28b11e8f".device = "/dev/disk/by-uuid/91510055-d97a-45c8-bf8d-477f28b11e8f";
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Flatpak config
  services.flatpak.enable = true;

  xdg.portal.enable = true;

  services.gnome.gnome-keyring.enable = true;
  security.polkit.enable = true;

  systemd.user.services.kanshi = {
	description = "Kanshi daemon";
	environment = {
		WAYLAND_DISPLAY = "wayland-1";
		DISPLAY = ":0";
	};
	serviceConfig = {
		Type = "simple";
		ExecStart = ''${pkgs.kanshi}/bin/kanshi -c kanshi_config_file'';
		};

  };
  services.greetd = {
	enable = true;
	settings = {
		default_session = {
			command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd sway";
		};
	};
  };



#   # Enable the X11 windowing system.
#   services.xserver = {
# 	enable = true;
# 	windowManager.qtile
# 	enable = true;
# 	displayManager.lightdm.enable = true;
# 	displayManager.sessionCommands = ''
# 		feh --bg-fill ~/Pictures/Wallpaper/forest.jpg
# 		xset r rate 200 35 &
# 	'';
# };



	#  services.picom = {  	enable = true;
	# backend = "glx";
	# fade = false;
	#  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  security.pam.services.swaylock = {};
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  programs.fish.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dhoenisch = {
    isNormalUser = true;
    shell = pkgs.fish;
    description = "David Hoenisch";
    extraGroups = [ 
		    "audio" 
		    "disk" 
		    "libvirtd" 
		    "networkmanager" 
		    "qemu-libvirtd" 
		    "video" 
		    "wheel" 
    		    "networkmanager" 
      		    "wheel" 
		    ];
  };

  fonts.fontDir.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.recursive-mono
  ];
  # Install firefox.
  programs.firefox.enable = false;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
