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
      key = "<leader>ld";
      action = "<cmd>lua vim.diagnostic.open_float()<CR>";
      options.desc = "Line diagnostics";
    }
    {
      mode = "n";
      key = "<leader>lj";
      action = "<cmd>lua vim.diagnostic.goto_next()<CR>";
      options.desc = "Next diagnostic";
    }
    {
      mode = "n";
      key = "<leader>lk";
      action = "<cmd>lua vim.diagnostic.goto_prev()<CR>";
      options.desc = "Prev diagnostic";
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
    ];
  };
}
