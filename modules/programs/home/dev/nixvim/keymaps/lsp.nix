{
  lib,
  config,
  ...
}:
let
  lsp = config.gb.home.dev.nixvim.keymaps.lsp;
in
{
  options = {
    gb.home.dev.nixvim.keymaps.lsp.enable = lib.mkEnableOption "Enable nixvim LSP keymaps";
  };

  config = lib.mkIf lsp.enable {
    programs.nixvim.keymaps = [
      {
        mode = "n";
        key = "gd";
        action = "<cmd>lua vim.lsp.buf.definition()<CR>";
        options.desc = "Definition";
      }
      {
        mode = "n";
        key = "gr";
        action = "<cmd>lua vim.lsp.buf.references()<CR>";
        options.desc = "References";
      }
      {
        mode = "n";
        key = "gI";
        action = "<cmd>lua vim.lsp.buf.implementation()<CR>";
        options.desc = "Implementation";
      }
      {
        mode = "n";
        key = "gt";
        action = "<cmd>lua vim.lsp.buf.type_definition()<CR>";
        options.desc = "Type Definition";
      }
      {
        mode = "n";
        key = "K";
        action = "<cmd>lua vim.lsp.buf.hover()<CR>";
        options.desc = "Hover";
      }
      {
        mode = "n";
        key = "[d";
        action = "<cmd>lua vim.diagnostic.goto_prev()<CR>";
        options.desc = "Prev diagnostic";
      }
      {
        mode = "n";
        key = "]d";
        action = "<cmd>lua vim.diagnostic.goto_next()<CR>";
        options.desc = "Next diagnostic";
      }
      {
        mode = "n";
        key = "<leader>ld";
        action = "<cmd>lua vim.diagnostic.open_float()<CR>";
        options.desc = "Line diagnostics";
      }
      {
        mode = "n";
        key = "<leader>lq";
        action = "<cmd>lua vim.diagnostic.setloclist()<CR>";
        options.desc = "Diagnostics to loclist";
      }
      {
        mode = "n";
        key = "<leader>lr";
        action = "<cmd>lua vim.lsp.buf.rename()<CR>";
        options.desc = "Rename";
      }
      {
        mode = "n";
        key = "<leader>la";
        action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
        options.desc = "Code action";
      }
      {
        mode = "n";
        key = "<leader>lf";
        action = "<cmd>lua vim.lsp.buf.format({ async = true })<CR>";
        options.desc = "Format";
      }
      {
        mode = "n";
        key = "<leader>cf";
        action = "<cmd>lua vim.b.disable_autoformat = not vim.b.disable_autoformat<CR>";
        options.desc = "Toggle format on save";
      }
    ];
  };
}
