{ ... }:
{
  programs.nixvim.keymaps = [
    # General
    { mode = "n"; key = "<leader>w"; action = "<cmd>w<cr>"; options.desc = "Save"; }
    { mode = "n"; key = "<leader>q"; action = "<cmd>q<cr>"; options.desc = "Quit"; }
    { mode = "n"; key = "<Esc>"; action = "<cmd>nohlsearch<CR>"; options.desc = "Clear Highlights"; }

    # NvChad-style Buffer Navigation
    { mode = "n"; key = "<S-h>"; action = "<cmd>bprevious<cr>"; options.desc = "Prev Buffer"; }
    { mode = "n"; key = "<S-l>"; action = "<cmd>bnext<cr>"; options.desc = "Next Buffer"; }
    { mode = "n"; key = "<leader>x"; action = "<cmd>bdelete<cr>"; options.desc = "Close Buffer"; }

    # File Explorer
    { mode = "n"; key = "<leader>e"; action = "<cmd>NvimTreeToggle<cr>"; options.desc = "Explorer"; }

    # Telescope (Grouped under <leader>f)
    { mode = "n"; key = "<leader>ff"; action = "<cmd>Telescope find_files<cr>"; options.desc = "Find Files"; }
    { mode = "n"; key = "<leader>fw"; action = "<cmd>Telescope live_grep<cr>"; options.desc = "Live Grep"; }
    { mode = "n"; key = "<leader>fb"; action = "<cmd>Telescope buffers<cr>"; options.desc = "Find Buffers"; }
    { mode = "n"; key = "<leader>fh"; action = "<cmd>Telescope help_tags<cr>"; options.desc = "Help Tags"; }
  ];
}