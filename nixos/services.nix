{
  services = {
    # Enable OpenSSH daemon
    # openssh.enable = true;

    # Enable Printer Support
    printing.enable = true;
    # Autodiscovery of Network Printers
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    # Dolphin Disk Mounting
    udisks2.enable = true;
    
    
    # Run deepseek-r1 locally
    ollama.enable = true;
    ollama.acceleration = "cuda";
    open-webui.enable = true;
        
  };
}
