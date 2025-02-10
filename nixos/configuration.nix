# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, lib, inputs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./fileSystems.nix
    ./services.nix
    ./style.nix

    ./nvidia.nix
    ./games.nix
    ./plasma5.nix
    ./hyprland.nix
    ./vm.nix
  ];

  # Bootloader.
  boot = {
    tmp.cleanOnBoot = true;
    supportedFilesystems = [ "ntfs" ];
    loader = {
      timeout = 3;
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
    kernelPackages = pkgs.linuxPackages_zen;
  };

  swapDevices = [{
    device = "/var/lib/swapfile";
    size = 32 * 1024; # 32GiB
  }];

  powerManagement.cpuFreqGovernor = "performance";

  nix = {
    settings = {
      trusted-users = [ "root" "tim" ];
      # Enable nix-command and flakes
      experimental-features = [ "nix-command" "flakes" ];
      # optimising store may lead to much longer compile times
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 30d";
    };
  };
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Automatic updating, see https://nixos.wiki/wiki/Automatic_system_upgrades
  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    flags = [
      "--update-input"
      "nixpkgs"
      "-L" # print build logs
    ];
    dates = "weekly";
  };

  # Enable networking
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";
  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = [ "all" ];
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [ fcitx5-mozc fcitx5-gtk fcitx5-nord ];
  };

  # Enable Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = false;
  # Enable Sound
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
  };

  security.polkit.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # services.xserver.excludePackages = [ pkgs.xterm ];
  # Configure keymap in X11
  # services.xserver.xkb = {
  #  layout = "us";
  #  variant = "intl";
  #  options = "grp:win_space_toggle";
  #};

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tim = {
    isNormalUser = true;
    description = "Tim Weissflog";
    extraGroups = [ "networkmanager" "wheel" "video" "libvirtd" ];
    # packages = with pkgs; [ kate ];
    shell = pkgs.zsh;
  };
  security.sudo.wheelNeedsPassword = false;

  # Install programs
  programs = {
    firefox.enable = true;
    git.enable = true;
    zsh.enable = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    yazi
    zoxide
    helix
    neofetch
    obsidian
    pavucontrol # Audio Controls (graphical)
    #dolphin # File manager by KDE
    #nautilus # File manager by Gnome
    #superfile # fancy & modern terminal file manager
    qFlipper
    vesktop
    discord
    arrpc # For rich presence in vesktop

    # Dowloading / Sending
    ani-cli
    yt-dlp
    localsend
    
    obs-studio
    gcc
    rustup
    rustc
    docker
    gwe
    anki
    openjdk
    prismlauncher
    libreoffice-qt
    # solaar # Mouse - doesn't work with Logitech
    noip
    qmk # crkbd
    blueberry # GUI bluetooth
    htop
    btop
    mpv
    # trying to get epic working on wayland:
    mozc

    dolphin
    plasma-workspace
    kde-cli-tools
    udisks2
    libsForQt5.qt5ct
    qt6ct
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

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
  system.stateVersion = "24.05"; # Did you read the comment?

}
