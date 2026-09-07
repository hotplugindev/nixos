{
  lib,
  config,
  pkgs,
  ...
}:
let
  formatting = config.gb.home.dev.nixvim.coding.formatting;
  langs = config.gb.home.dev.languages;
in
{
  options = {
    gb.home.dev.nixvim.coding.formatting = {
      enable = lib.mkEnableOption "Enable nixvim formatting configuration";
    };
  };

  config = lib.mkIf formatting.enable {
    programs.nixvim = {
      extraPackages =
        [ pkgs.nixfmt pkgs.stylua pkgs.shfmt ]
        ++ lib.optionals langs.node.enable [ pkgs.prettierd ]
        ++ lib.optionals langs.python.enable [ pkgs.python3Packages.black ]
        ++ lib.optionals langs.go.enable [ pkgs.go-tools ]
        ++ lib.optionals langs.rust.enable [ pkgs.rustfmt ]
        ++ lib.optionals langs.c.enable [ pkgs.clang-tools ]
        ++ lib.optionals langs.dotnet.enable [ pkgs.csharpier ]
        ++ lib.optionals langs.flutter.enable [ pkgs.dart ]
        ++ lib.optionals langs.php.enable [ pkgs.php84Packages.php-cs-fixer ];

      plugins.conform-nvim = {
        enable = true;
        settings = {
          formatters_by_ft =
            {
              lua = [ "stylua" ];
              nix = [ "nixfmt" ];
              sh = [ "shfmt" ];
              bash = [ "shfmt" ];
            }
            // lib.optionalAttrs langs.node.enable {
              javascript = [ "prettierd" ];
              typescript = [ "prettierd" ];
              javascriptreact = [ "prettierd" ];
              typescriptreact = [ "prettierd" ];
              vue = [ "prettierd" ];
              html = [ "prettierd" ];
              css = [ "prettierd" ];
              json = [ "prettierd" ];
              markdown = [ "prettierd" ];
            }
            // lib.optionalAttrs langs.python.enable {
              python = [ "black" ];
            }
            // lib.optionalAttrs langs.go.enable {
              go = [ "goimports" ];
            }
            // lib.optionalAttrs langs.rust.enable {
              rust = [ "rustfmt" ];
            }
            // lib.optionalAttrs langs.zig.enable {
              zig = [ "zigfmt" ];
            }
            // lib.optionalAttrs langs.c.enable {
              c = [ "clang_format" ];
              cpp = [ "clang_format" ];
            }
            // lib.optionalAttrs langs.dotnet.enable {
              cs = [ "csharpier" ];
            }
            // lib.optionalAttrs langs.flutter.enable {
              dart = [ "dart_format" ];
            }
            // lib.optionalAttrs langs.php.enable {
              php = [ "php_cs_fixer" ];
            };

          format_on_save = ''
            function(bufnr)
              return { timeout_ms = 2000, lsp_fallback = true }
            end
          '';
        };
      };
    };
  };
}
