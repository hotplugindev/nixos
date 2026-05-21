{
  lib,
  config,
  ...
}:
let
  completion = config.gb.home.dev.nixvim.editor.completion;
in
{
  options = {
    gb.home.dev.nixvim.editor.completion.enable = lib.mkEnableOption "Enable nixvim completion";
  };

  config = lib.mkIf completion.enable {
    programs.nixvim.plugins = {
    luasnip.enable = true;
    friendly-snippets.enable = true;
    lspkind.enable = true;

    cmp = {
      enable = true;
      autoEnableSources = true;

      settings = {
        completion = {
          completeopt = "menu,menuone,noselect";
        };

        snippet = {
          expand = {
            __raw = ''
              function(args)
                require('luasnip').lsp_expand(args.body)
              end
            '';
          };
        };

        window = {
          completion = {
            border = "rounded";
          };
          documentation = {
            border = "rounded";
          };
        };

        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "path"; }
          { name = "buffer"; }
        ];

        mapping = {
          "<C-p>" = {
            __raw = "cmp.mapping.select_prev_item()";
          };
          "<C-n>" = {
            __raw = "cmp.mapping.select_next_item()";
          };
          "<C-Space>" = {
            __raw = "cmp.mapping.complete()";
          };
          "<C-e>" = {
            __raw = "cmp.mapping.abort()";
          };
          "<CR>" = {
            __raw = "cmp.mapping.confirm({ select = true })";
          };
          "<Tab>" = {
            __raw = ''
              cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                elseif require("luasnip").expand_or_jumpable() then
                  require("luasnip").expand_or_jump()
                else
                  fallback()
                end
              end, { "i", "s" })
            '';
          };
          "<S-Tab>" = {
            __raw = ''
              cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_prev_item()
                elseif require("luasnip").jumpable(-1) then
                  require("luasnip").jump(-1)
                else
                  fallback()
                end
              end, { "i", "s" })
            '';
          };
        };
      };

      cmdline = {
        "/" = {
          mapping = {
            __raw = "cmp.mapping.preset.cmdline()";
          };
          sources = [
            { name = "buffer"; }
          ];
        };

        ":" = {
          mapping = {
            __raw = "cmp.mapping.preset.cmdline()";
          };
          sources = [
            { name = "path"; }
            { name = "cmdline"; }
          ];
        };
      };
    };

    cmp-buffer.enable = true;
    cmp-path.enable = true;
    cmp-nvim-lsp.enable = true;
      cmp-cmdline.enable = true;
    };
  };
}