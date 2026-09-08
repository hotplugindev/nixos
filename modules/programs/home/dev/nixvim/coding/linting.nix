{
  lib,
  config,
  pkgs,
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
    programs.nixvim = {
      extraPackages =
        lib.optionals langs.java.enable [ pkgs.checkstyle ]
        ++ lib.optionals langs.kotlin.enable [ pkgs.detekt ]
        ++ lib.optionals langs.ruby.enable [ pkgs.rubyPackages.rubocop ]
        ++ lib.optionals langs.haskell.enable [ pkgs.hlint ]
        ++ lib.optionals langs.clojure.enable [ pkgs.clj-kondo ]
        ++ lib.optionals langs.perl.enable [ pkgs.perlcritic ];

      plugins.lint = {
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
          }
          // lib.optionalAttrs langs.java.enable {
            java = [ "checkstyle" ];
          }
          // lib.optionalAttrs langs.kotlin.enable {
            kotlin = [ "detekt" ];
          }
          // lib.optionalAttrs langs.ruby.enable {
            ruby = [ "rubocop" ];
          }
          // lib.optionalAttrs langs.haskell.enable {
            haskell = [ "hlint" ];
          }
          // lib.optionalAttrs langs.clojure.enable {
            clojure = [ "clj_kondo" ];
          };
      };
    };
  };
}
