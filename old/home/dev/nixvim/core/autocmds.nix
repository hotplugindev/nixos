{
  lib,
  config,
  ...
}:
let
  autocmds = config.gb.home.dev.nixvim.core.autocmds;
in
{
  options = {
    gb.home.dev.nixvim.core.autocmds.enable = lib.mkEnableOption "Enable nixvim autocmds";
  };

  config = lib.mkIf autocmds.enable {
    programs.nixvim = {
      autoCmd = [
        {
          event = [ "TextYankPost" ];
          callback = {
            __raw = ''
              function()
                vim.highlight.on_yank({ higroup = "IncSearch", timeout = 120 })
              end
            '';
          };
        }
        {
          event = [ "FileType" ];
          pattern = [ "nix" "lua" "json" "yaml" "toml" "markdown" ];
          command = "setlocal expandtab shiftwidth=2 tabstop=2";
        }
        {
          event = [ "FileType" ];
          pattern = [ "gitcommit" "markdown" ];
          command = "setlocal wrap spell";
        }
      ];
    };
  };
}