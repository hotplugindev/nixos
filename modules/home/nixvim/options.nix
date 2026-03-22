{ ... }:
{
  programs.nixvim = {
    opts = {
      number = true;
      relativenumber = true;
      mouse = "a";
      showmode = false;

      breakindent = true;
      undofile = true;
      ignorecase = true;
      smartcase = true;
      signcolumn = "yes";
      updatetime = 250;
      timeoutlen = 300;

      splitright = true;
      splitbelow = true;
      inccommand = "split";
      cursorline = true;
      scrolloff = 10;

      tabstop = 2;
      shiftwidth = 2;
      softtabstop = 2;
      expandtab = true;
      smartindent = true;

      termguicolors = true;
      wrap = false;
    };
  };
}
