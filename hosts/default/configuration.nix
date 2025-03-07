# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, lib, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./mounts.nix

    # Modules
    ../../modules/nixos/lanzaboote.nix
    ../../modules/nixos/nvidia.nix
    ../../modules/nixos/gaming.nix
    ../../modules/nixos/services.nix
    ../../modules/nixos/vm.nix
    ../../modules/nixos/hyprland.nix
    ../../modules/nixos/fonts.nix
    # ../../modules/nixos/plasma6.nix
  ];

  # Bootloader.
  boot = {
    tmp.cleanOnBoot = true;
    supportedFilesystems = [ "ntfs" ];
    loader = {
      systemd-boot.enable = true;
      timeout = 3;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_zen;
  };

  swapDevices = [{
    device = "/var/lib/swapfile";
    size = 8 * 1024; # 32GiB
  }];

  powerManagement.cpuFreqGovernor = "performance";

  nix = {
    settings = {
      trusted-users = [ "root" "tim" ];
      # Enable nix-command and flakes
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
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
      # "-L" # print build logs
    ];
    dates = "monthly";
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
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };
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

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tim = {
    isNormalUser = true;
    description = "Tim Weissflog";
    initialPassword = "1234";
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
    # wget
    # yazi
    # zoxide
    # helix
    neofetch
    obsidian
    pavucontrol # Audio Controls (graphical)
    #nautilus # File manager by Gnome
    # arrpc # For rich presence in vesktop

    # Dowloading / Sending
    ani-cli
    yt-dlp
    localsend
    
    obs-studio
    # gcc
    # rustup
    # rustc
    # docker
    # gwe
    anki
    openjdk
    prismlauncher
    libreoffice
    # solaar # Mouse - doesn't work with Logitech
    noip
    qmk # crkbd
    blueberry # GUI bluetooth
    btop
    mpv
    # trying to get epic working on wayland:

    # kdePackages.dolphin # File manager by KDE
    xfce.thunar
    libsForQt5.qt5ct
    qt6ct
  ];


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  #programs.mtr.enable = true;
  #programs.gnupg.agent = {
  #  enable = true;
  #  enableSSHSupport = true;
  #};

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [
    # Valheim (potentially not needed)
    2456
    2457
    2458
    # Minecraft
    25565
    25566
    # LocalSend
    53317
  ];
  networking.firewall.allowedUDPPorts = [
    # Valheim
    2456
    2457
    2458
    # Minecraft
    25565
    25566
    # LocalSend
    53317
  ];
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
