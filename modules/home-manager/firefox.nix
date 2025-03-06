{ config, ... }: {
  programs.firefox = {
    enable = true;

    policies = {
      AppAutoUpdate = false;
      BackgroundAppUpdate = false;
      DisableFirefoxStudies = true;
      DisableFirefoxAccounts = false; # Enable Firefox Sync
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      ExtensionUpdate = false;
    };
  };
}
