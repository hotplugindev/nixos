{
  lib,
  config,
  ...
}: let

  mango = config.gb.home.desktop.mango;
  cfg = mango.dms;
  includeFiles = lib.escapeShellArgs cfg.includes.files;
in {
  config = lib.mkIf (mango.enable && mango.mangowc.enable && cfg.enable && cfg.includes.enable) {
    gb.home.desktop.mango.mangowc.settings.sourceFiles = map (
      file: "~/.config/mango/dms/${file}"
    ) cfg.includes.files;

    home.activation.mangoDmsIncludeBootstrap = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      mkdir -p "$HOME/.config/mango/dms"
      for include_file in ${includeFiles}; do
        if [ ! -e "$HOME/.config/mango/dms/$include_file" ]; then
          : > "$HOME/.config/mango/dms/$include_file"
        fi
      done

      dms_dir="$HOME/.config/mango/dms"
      if [ -f "$dms_dir/colors.conf" ]; then
        sed -i \
          -e 's/^bordercolor/border_color/' \
          -e 's/^focuscolor/focus_color/' \
          -e 's/^urgentcolor/urgent_color/' \
          "$dms_dir/colors.conf"
      fi
      if [ -f "$dms_dir/layout.conf" ]; then
        sed -i \
          -e 's/^borderpx/border_px/' \
          -e 's/^gappih/gap_inner_horizontal/' \
          -e 's/^gappiv/gap_inner_vertical/' \
          -e 's/^gappoh/gap_outer_horizontal/' \
          -e 's/^gappov/gap_outer_vertical/' \
          "$dms_dir/layout.conf"
      fi
    '';
  };
}
