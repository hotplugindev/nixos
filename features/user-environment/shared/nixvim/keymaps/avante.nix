{ ... }:
{
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>aa";
      action = "<cmd>AvanteAsk<CR>";
      options.desc = "Avante ask";
    }
    {
      mode = "n";
      key = "<leader>ac";
      action = "<cmd>AvanteChat<CR>";
      options.desc = "Avante chat";
    }
    {
      mode = "v";
      key = "<leader>ae";
      action = "<cmd>AvanteEdit<CR>";
      options.desc = "Avante edit selection";
    }
    {
      mode = "n";
      key = "<leader>ar";
      action = "<cmd>AvanteRefresh<CR>";
      options.desc = "Avante refresh";
    }
    {
      mode = "n";
      key = "<leader>at";
      action = "<cmd>AvanteToggle<CR>";
      options.desc = "Avante toggle";
    }
    {
      mode = "n";
      key = "<leader>af";
      action = "<cmd>AvanteFocus<CR>";
      options.desc = "Avante focus";
    }
  ];
}
