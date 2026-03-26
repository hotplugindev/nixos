{
  lib,
  config,
  ...
}:
let
  optionsCfg = config.gb.home.dev.nixvim.core.options;
in
{
  options = {
    gb.home.dev.nixvim.core.options.enable = lib.mkEnableOption "Enable nixvim core options";
  };

  config = lib.mkIf optionsCfg.enable {
    programs.nixvim = {
    opts = {
      number = true;
      relativenumber = true;
      mouse = "a";
      showmode = false;
      termguicolors = true;
      wrap = false;
      linebreak = true;

      breakindent = true;
      undofile = true;
      swapfile = false;
      backup = false;
      writebackup = false;

      ignorecase = true;
      smartcase = true;
      infercase = true;

      signcolumn = "yes";
      updatetime = 200;
      timeoutlen = 400;
      splitright = true;
      splitbelow = true;
      inccommand = "split";
      cursorline = true;
      scrolloff = 8;
      sidescrolloff = 8;
      completeopt = "menu,menuone,noselect";
      pumheight = 10;

      tabstop = 2;
      shiftwidth = 2;
      softtabstop = 2;
      expandtab = true;
      smartindent = true;
      shiftround = true;
      autoindent = true;

      laststatus = 3;
      cmdheight = 0;
      confirm = true;
      hidden = true;
    };

      globals = {
        loaded_netrw = 1;
        loaded_netrwPlugin = 1;
      };
    };
  };
}