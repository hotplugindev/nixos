{
  lib,
  config,
  ...
}:
let
  window = config.gb.home.dev.nixvim.keymaps.window;
in
{
  options = {
    gb.home.dev.nixvim.keymaps.window.enable = lib.mkEnableOption "Enable nixvim window keymaps";
  };

  config = lib.mkIf window.enable {
    programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
      options.desc = "Window left";
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
      options.desc = "Window down";
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
      options.desc = "Window up";
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
      options.desc = "Window right";
    }
    {
      mode = "n";
      key = "<leader>wh";
      action = "<cmd>vertical resize -5<CR>";
      options.desc = "Resize left";
    }
    {
      mode = "n";
      key = "<leader>wl";
      action = "<cmd>vertical resize +5<CR>";
      options.desc = "Resize right";
    }
    {
      mode = "n";
      key = "<leader>wj";
      action = "<cmd>resize -2<CR>";
      options.desc = "Resize down";
    }
    {
      mode = "n";
      key = "<leader>wk";
      action = "<cmd>resize +2<CR>";
      options.desc = "Resize up";
    }
    {
      mode = "n";
      key = "<leader>wv";
      action = "<cmd>vsplit<CR>";
      options.desc = "Vertical split";
    }
    {
      mode = "n";
      key = "<leader>ws";
      action = "<cmd>split<CR>";
      options.desc = "Horizontal split";
    }
    {
      mode = "n";
      key = "<leader>wx";
      action = "<cmd>close<CR>";
      options.desc = "Close window";
    }
    ];
  };
}
