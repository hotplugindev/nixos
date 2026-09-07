{
  lib,
  config,
  ...
}:
let
  linting = config.gb.home.dev.nixvim.coding.linting;
  langs = config.gb.home.dev.languages;
in
{
  options = {
    gb.home.dev.nixvim.coding.linting = {
      enable = lib.mkEnableOption "Enable nixvim linting configuration";
    };
  };

  config = lib.mkIf linting.enable {
    programs.nixvim.plugins.lint = {
      enable = true;
      lintersByFt =
        {
          nix = [ "nix" ];
          markdown = [ "markdownlint" ];
          dockerfile = [ "hadolint" ];
        }
        // lib.optionalAttrs langs.node.enable {
          javascript = [ "eslint" ];
          typescript = [ "eslint" ];
          javascriptreact = [ "eslint" ];
          typescriptreact = [ "eslint" ];
        }
        // lib.optionalAttrs langs.python.enable {
          python = [ "pylint" ];
        }
        // lib.optionalAttrs langs.php.enable {
          php = [ "phpstan" ];
        }
        // lib.optionalAttrs langs.c.enable {
          c = [ "clang_tidy" ];
          cpp = [ "clang_tidy" ];
        }
        // lib.optionalAttrs langs.go.enable {
          go = [ "golangci_lint" ];
        }
        // lib.optionalAttrs langs.rust.enable {
          rust = [ "clippy" ];
        }
        // lib.optionalAttrs langs.flutter.enable {
          dart = [ "dart_analyze" ];
        };
    };
  };
}
