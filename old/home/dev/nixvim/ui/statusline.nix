{
  lib,
  config,
  ...
}:
let
  statusline = config.gb.home.dev.nixvim.ui.statusline;
in
{
  options = {
    gb.home.dev.nixvim.ui.statusline.enable = lib.mkEnableOption "Enable nixvim statusline";
  };

  config = lib.mkIf statusline.enable {
    programs.nixvim.plugins.lualine = {
      enable = true;
      settings = {
        options = {
          theme = "gruvbox";
          globalstatus = true;
          component_separators = { left = "|"; right = "|"; };
          section_separators = { left = ""; right = ""; };
        };

        sections = {
          lualine_a = [ "mode" ];
          lualine_b = [ "branch" "diff" "diagnostics" ];
          lualine_c = [ "filename" ];
          lualine_x = [ "encoding" "fileformat" "filetype" ];
          lualine_y = [ "progress" ];
          lualine_z = [ "location" ];
        };
      };
    };
  };
}