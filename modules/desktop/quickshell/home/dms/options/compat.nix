{ lib, ... }:
{
  imports = [
    (lib.mkAliasOptionModule
      [ "gb" "home" "desktop" "mango" "dms" "settings" ]
      [ "programs" "dank-material-shell" "settings" ])

    (lib.mkAliasOptionModule
      [ "gb" "home" "desktop" "mango" "dms" "session" ]
      [ "programs" "dank-material-shell" "session" ])

    (lib.mkAliasOptionModule
      [ "gb" "home" "desktop" "mango" "dms" "clipboardSettings" ]
      [ "programs" "dank-material-shell" "clipboardSettings" ])

    (lib.mkAliasOptionModule
      [ "gb" "home" "desktop" "mango" "dms" "plugins" ]
      [ "programs" "dank-material-shell" "plugins" ])

    (lib.mkAliasOptionModule
      [ "gb" "home" "desktop" "mango" "dms" "enableSystemMonitoring" ]
      [ "programs" "dank-material-shell" "enableSystemMonitoring" ])

    (lib.mkAliasOptionModule
      [ "gb" "home" "desktop" "mango" "dms" "enableVPN" ]
      [ "programs" "dank-material-shell" "enableVPN" ])

    (lib.mkAliasOptionModule
      [ "gb" "home" "desktop" "mango" "dms" "enableDynamicTheming" ]
      [ "programs" "dank-material-shell" "enableDynamicTheming" ])

    (lib.mkAliasOptionModule
      [ "gb" "home" "desktop" "mango" "dms" "enableAudioWavelength" ]
      [ "programs" "dank-material-shell" "enableAudioWavelength" ])

    (lib.mkAliasOptionModule
      [ "gb" "home" "desktop" "mango" "dms" "enableCalendarEvents" ]
      [ "programs" "dank-material-shell" "enableCalendarEvents" ])

    (lib.mkAliasOptionModule
      [ "gb" "home" "desktop" "mango" "dms" "enableClipboardPaste" ]
      [ "programs" "dank-material-shell" "enableClipboardPaste" ])
  ];
}
