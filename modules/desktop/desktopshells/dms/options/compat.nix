{ lib, ... }:
{
  imports = [
    (lib.mkAliasOptionModule
      [ "gb" "home" "desktopshells" "dms" "settings" ]
      [ "programs" "dank-material-shell" "settings" ]
    )

    (lib.mkAliasOptionModule
      [ "gb" "home" "desktopshells" "dms" "session" ]
      [ "programs" "dank-material-shell" "session" ]
    )

    (lib.mkAliasOptionModule
      [ "gb" "home" "desktopshells" "dms" "clipboardSettings" ]
      [ "programs" "dank-material-shell" "clipboardSettings" ]
    )

    (lib.mkAliasOptionModule
      [ "gb" "home" "desktopshells" "dms" "plugins" ]
      [ "programs" "dank-material-shell" "plugins" ]
    )

    (lib.mkAliasOptionModule
      [ "gb" "home" "desktopshells" "dms" "enableSystemMonitoring" ]
      [ "programs" "dank-material-shell" "enableSystemMonitoring" ]
    )

    (lib.mkAliasOptionModule
      [ "gb" "home" "desktopshells" "dms" "enableVPN" ]
      [ "programs" "dank-material-shell" "enableVPN" ]
    )

    (lib.mkAliasOptionModule
      [ "gb" "home" "desktopshells" "dms" "enableDynamicTheming" ]
      [ "programs" "dank-material-shell" "enableDynamicTheming" ]
    )

    (lib.mkAliasOptionModule
      [ "gb" "home" "desktopshells" "dms" "enableAudioWavelength" ]
      [ "programs" "dank-material-shell" "enableAudioWavelength" ]
    )

    (lib.mkAliasOptionModule
      [ "gb" "home" "desktopshells" "dms" "enableCalendarEvents" ]
      [ "programs" "dank-material-shell" "enableCalendarEvents" ]
    )

    (lib.mkAliasOptionModule
      [ "gb" "home" "desktopshells" "dms" "enableClipboardPaste" ]
      [ "programs" "dank-material-shell" "enableClipboardPaste" ]
    )
  ];
}
