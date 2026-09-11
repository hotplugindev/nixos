{
  lib,
  config,
  ...
}:
let
  neogit = config.gb.home.dev.nixvim.tools.neogit;
in
{
  options = {
    gb.home.dev.nixvim.tools.neogit.enable =
      lib.mkEnableOption "Enable nixvim neogit for interactive git workflows";
  };

  config = lib.mkIf neogit.enable {
    programs.nixvim.plugins.neogit = {
      enable = true;
      settings = {
        auto_refresh = true;
        disable_builtin_notifications = false;
        use_telescope = true;
        kind = "tab";
        commit_popup = {
          kind = "vsplit";
        };
        preview_buffer = {
          kind = "floating";
        };
        popup = {
          kind = "floating";
        };
        signs = {
          section = { item = [ ">" "v" ]; };
          item = { item = [ ">" "v" ]; };
          hunk = { item = [ "" "" ]; };
        };
        integrations = {
          diffview = true;
          telescope = true;
        };
        sections = {
          untracked = {
            folded = false;
          };
          unstaged = {
            folded = false;
          };
          staged = {
            folded = false;
          };
          stashes = {
            folded = true;
          };
          unpulled = {
            folded = true;
          };
          unmerged = {
            folded = false;
          };
          recent = {
            folded = true;
          };
        };
      };
    };
  };
}
