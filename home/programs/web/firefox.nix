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

        ExtensionSettings = {
          "uBlock0@raymondhill.net" = {
            installation_mode = "force_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          };

          "{74145f27-f039-47ce-a470-a662b129930a}" = {
            installation_mode = "force_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/clearurls/latest.xpi";
          };

          "gdpr@cavi.au.dk" = {
            installation_mode = "force_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/consent-o-matic/latest.xpi";
          };
        };
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
        "sidebar.revamp" = true;
        "sidebar.verticalTabs" = true;
        "sidebar.position_start" = true; # false = right, true = left
      };
    };
  };
}
