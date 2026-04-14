{
  lib,
  config,
  pkgs,
  ...
}:
let
  firefox = config.gb.home.programs.web.firefox;
in
{
  options.gb.home.programs.web.firefox.enable = lib.mkEnableOption "Enable firefox web browser";

  config = lib.mkIf firefox.enable {
    programs.firefox = {
      enable = true;
      package = pkgs.firefox;

      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableAccounts = false;
        DisableFirefoxAccounts = false;
        HTTPSOnlyMode = "enabled";
      };

      profiles.default.settings = {
        "identity.fxaccounts.enabled" = true;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "network.cookie.cookieBehavior" = 5;
        "privacy.partition.network_state" = true;
        "privacy.fingerprintingProtection" = true;
        "privacy.resistFingerprinting" = false;
        "dom.security.https_only_mode" = true;
        "network.dns.disablePrefetch" = true;
        "network.predictor.enabled" = false;
        "network.prefetch-next" = false;
        "browser.search.suggest.enabled" = false;
        "browser.urlbar.suggest.searches" = false;
        "toolkit.telemetry.enabled" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "geo.enabled" = false;
        "extensions.pocket.enabled" = false;
        "browser.safebrowsing.malware.enabled" = true;
        "browser.safebrowsing.phishing.enabled" = true;
      };
    };
  };
}
