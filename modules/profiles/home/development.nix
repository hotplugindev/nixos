{ lib, config, ... }:
let
  enabled = lib.elem "development" config.gb.host.roles;
  requester = "profiles.home.development";
in
{
  config = lib.mkIf enabled {
    gb.requires.home.git = [ requester ];
    gb.requires.home.shell = [ requester ];

    gb.home.dev.nixvim.enable = lib.mkDefault true;
    gb.home.dev.tooling.git.enable = lib.mkDefault true;
    gb.home.dev.tooling.shell.enable = lib.mkDefault true;
    gb.home.dev.tooling.base.enable = lib.mkDefault true;
    gb.home.dev.editors.vscode.enable = lib.mkDefault true;
    gb.home.dev.editors.zed.enable = lib.mkDefault true;
    gb.home.dev.languages.node.enable = lib.mkDefault true;
    gb.home.dev.languages.c.enable = lib.mkDefault true;
    gb.home.dev.languages.rust.enable = lib.mkDefault true;
    gb.home.dev.languages.python.enable = lib.mkDefault true;
  };
}
