{ ... }:
{
  programs.nixvim.keymaps = [
    # General
    { mode = "n"; key = "<Esc>"; action = "<cmd>nohlsearch<CR>"; options.desc = "Clear highlights"; }
    { mode = "n"; key = "<leader>ww"; action = "<cmd>w<CR>"; options.desc = "Save file"; }
    { mode = "n"; key = "<leader>wa"; action = "<cmd>wa<CR>"; options.desc = "Save all"; }
    { mode = "n"; key = "<leader>qq"; action = "<cmd>q<CR>"; options.desc = "Quit"; }
    { mode = "n"; key = "<leader>qa"; action = "<cmd>qa<CR>"; options.desc = "Quit all"; }
    { mode = "n"; key = "<leader>nh"; action = "<cmd>nohlsearch<CR>"; options.desc = "No highlight"; }

    # Better window movement
    { mode = "n"; key = "<C-h>"; action = "<C-w>h"; options.desc = "Window left"; }
    { mode = "n"; key = "<C-j>"; action = "<C-w>j"; options.desc = "Window down"; }
    { mode = "n"; key = "<C-k>"; action = "<C-w>k"; options.desc = "Window up"; }
    { mode = "n"; key = "<C-l>"; action = "<C-w>l"; options.desc = "Window right"; }

    # Resize
    { mode = "n"; key = "<leader>wh"; action = "<cmd>vertical resize -5<CR>"; options.desc = "Resize left"; }
    { mode = "n"; key = "<leader>wl"; action = "<cmd>vertical resize +5<CR>"; options.desc = "Resize right"; }
    { mode = "n"; key = "<leader>wj"; action = "<cmd>resize -2<CR>"; options.desc = "Resize down"; }
    { mode = "n"; key = "<leader>wk"; action = "<cmd>resize +2<CR>"; options.desc = "Resize up"; }
    { mode = "n"; key = "<leader>wv"; action = "<cmd>vsplit<CR>"; options.desc = "Vertical split"; }
    { mode = "n"; key = "<leader>ws"; action = "<cmd>split<CR>"; options.desc = "Horizontal split"; }
    { mode = "n"; key = "<leader>wx"; action = "<cmd>close<CR>"; options.desc = "Close window"; }

    # Buffers
    { mode = "n"; key = "<S-h>"; action = "<cmd>BufferLineCyclePrev<CR>"; options.desc = "Previous buffer"; }
    { mode = "n"; key = "<S-l>"; action = "<cmd>BufferLineCycleNext<CR>"; options.desc = "Next buffer"; }
    { mode = "n"; key = "<leader>bx"; action = "<cmd>bdelete<CR>"; options.desc = "Close buffer"; }
    { mode = "n"; key = "<leader>bo"; action = "<cmd>%bd|e#|bd#<CR>"; options.desc = "Close other buffers"; }
    { mode = "n"; key = "<leader>bb"; action = "<cmd>Telescope buffers<CR>"; options.desc = "List buffers"; }

    # Explorer
    { mode = "n"; key = "<leader>e"; action = "<cmd>Neotree toggle filesystem reveal left<CR>"; options.desc = "Explorer"; }

    # Telescope / Find
    { mode = "n"; key = "<leader>ff"; action = "<cmd>Telescope find_files<CR>"; options.desc = "Find files"; }
    { mode = "n"; key = "<leader>fa"; action = "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>"; options.desc = "Find all files"; }
    { mode = "n"; key = "<leader>fw"; action = "<cmd>Telescope live_grep<CR>"; options.desc = "Live grep"; }
    { mode = "n"; key = "<leader>fb"; action = "<cmd>Telescope buffers<CR>"; options.desc = "Buffers"; }
    { mode = "n"; key = "<leader>fh"; action = "<cmd>Telescope help_tags<CR>"; options.desc = "Help tags"; }
    { mode = "n"; key = "<leader>fo"; action = "<cmd>Telescope oldfiles<CR>"; options.desc = "Recent files"; }
    { mode = "n"; key = "<leader>fk"; action = "<cmd>Telescope keymaps<CR>"; options.desc = "Keymaps"; }
    { mode = "n"; key = "<leader>fc"; action = "<cmd>Telescope commands<CR>"; options.desc = "Commands"; }

    # Git
    { mode = "n"; key = "<leader>gb"; action = "<cmd>Gitsigns blame_line<CR>"; options.desc = "Blame line"; }
    { mode = "n"; key = "<leader>gd"; action = "<cmd>Gitsigns diffthis<CR>"; options.desc = "Diff this"; }
    { mode = "n"; key = "<leader>gj"; action = "<cmd>Gitsigns next_hunk<CR>"; options.desc = "Next hunk"; }
    { mode = "n"; key = "<leader>gk"; action = "<cmd>Gitsigns prev_hunk<CR>"; options.desc = "Previous hunk"; }
    { mode = "n"; key = "<leader>gp"; action = "<cmd>Gitsigns preview_hunk<CR>"; options.desc = "Preview hunk"; }
    { mode = "n"; key = "<leader>gr"; action = "<cmd>Gitsigns reset_hunk<CR>"; options.desc = "Reset hunk"; }
    { mode = "n"; key = "<leader>gs"; action = "<cmd>Git<CR>"; options.desc = "Git status"; }

    # LSP / Code
    { mode = "n"; key = "<leader>ld"; action = "<cmd>lua vim.diagnostic.open_float()<CR>"; options.desc = "Line diagnostics"; }
    { mode = "n"; key = "<leader>lj"; action = "<cmd>lua vim.diagnostic.goto_next()<CR>"; options.desc = "Next diagnostic"; }
    { mode = "n"; key = "<leader>lk"; action = "<cmd>lua vim.diagnostic.goto_prev()<CR>"; options.desc = "Prev diagnostic"; }
    { mode = "n"; key = "<leader>lr"; action = "<cmd>lua vim.lsp.buf.rename()<CR>"; options.desc = "Rename"; }
    { mode = "n"; key = "<leader>la"; action = "<cmd>lua vim.lsp.buf.code_action()<CR>"; options.desc = "Code action"; }
    { mode = "n"; key = "<leader>lf"; action = "<cmd>lua vim.lsp.buf.format({ async = true })<CR>"; options.desc = "Format"; }

    # Terminal
    { mode = "n"; key = "<leader>tf"; action = "<cmd>ToggleTerm direction=float<CR>"; options.desc = "Float terminal"; }
    { mode = "n"; key = "<leader>th"; action = "<cmd>ToggleTerm size=10 direction=horizontal<CR>"; options.desc = "Horizontal terminal"; }
    { mode = "n"; key = "<leader>tv"; action = "<cmd>ToggleTerm size=80 direction=vertical<CR>"; options.desc = "Vertical terminal"; }
    { mode = "t"; key = "<Esc>"; action = "<C-\\><C-n>"; options.desc = "Exit terminal mode"; }
  ];
}