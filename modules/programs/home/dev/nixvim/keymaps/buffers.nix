{
  lib,
  config,
  ...
}:
let
  buffers = config.gb.home.dev.nixvim.keymaps.buffers;
in
{
  options = {
    gb.home.dev.nixvim.keymaps.buffers.enable = lib.mkEnableOption "Enable nixvim buffer keymaps";
  };

  config = lib.mkIf buffers.enable {
    programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<S-h>";
      action = "<cmd>BufferLineCyclePrev<CR>";
      options.desc = "Previous buffer";
    }
    {
      mode = "n";
      key = "<S-l>";
      action = "<cmd>BufferLineCycleNext<CR>";
      options.desc = "Next buffer";
    }
    {
      mode = "n";
      key = "<leader>bn";
      action = "<cmd>enew<CR>";
      options.desc = "Create new buffer";
    }
    {
      mode = "n";
      key = "<leader>bx";
      action = {
        __raw = ''
          function()
            local current = vim.api.nvim_get_current_buf()
            local current_ft = vim.bo[current].filetype

            if current_ft == "neo-tree" then
              vim.cmd("close")
              return
            end

            local listed = vim.fn.getbufinfo({ buflisted = 1 })
            local target = nil
            local real_count = 0

            for _, buf in ipairs(listed) do
              if vim.bo[buf.bufnr].filetype ~= "neo-tree" then
                real_count = real_count + 1
                if buf.bufnr ~= current and target == nil then
                  target = buf.bufnr
                end
              end
            end

            if real_count > 1 and target ~= nil then
              vim.api.nvim_set_current_buf(target)
              vim.cmd("bdelete " .. current)
            else
              vim.cmd("enew")
              vim.cmd("file [No Name]")
              vim.cmd("setlocal bufhidden=wipe")
              vim.cmd("bdelete " .. current)
            end
          end
        '';
      };
      options.desc = "Close buffer";
    }
    {
      mode = "n";
      key = "<leader>bo";
      action = "<cmd>%bd|e#|bd#<CR>";
      options.desc = "Close other buffers";
    }
    {
      mode = "n";
      key = "<leader>bb";
      action = "<cmd>Telescope buffers<CR>";
      options.desc = "List buffers";
    }
    ];
  };
}
