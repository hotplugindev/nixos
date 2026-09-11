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
          component_separators = {
            left = "|";
            right = "|";
          };
          section_separators = {
            left = "";
            right = "";
          };
        };

        sections = {
          lualine_a = [ "mode" ];
          lualine_b = [
            {
              __unkeyed-1.__raw = ''
                function()
                  local head = vim.b.gitsigns_head
                  if not head or head == "" then return "" end
                  local status = vim.b.gitsigns_status_dict or {}
                  local ahead = status.ahead and status.ahead > 0 and (" ↑" .. status.ahead) or ""
                  local behind = status.behind and status.behind > 0 and (" ↓" .. status.behind) or ""
                  return " " .. head .. ahead .. behind
                end
              '';
              icon = "";
            }
            "diff"
            "diagnostics"
          ];
          lualine_c = [ "filename" ];
          lualine_x = [
            "encoding"
            "fileformat"
            "filetype"
          ];
          lualine_y = [ "progress" ];
          lualine_z = [ "location" ];
        };
      };
    };
  };
}
