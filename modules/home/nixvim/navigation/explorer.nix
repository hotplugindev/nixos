{ ... }:
{
  programs.nixvim.plugins.neo-tree = {
    enable = true;

    settings = {
      close_if_last_window = true;
      popup_border_style = "rounded";

      filesystem = {
        filtered_items = {
          hide_dotfiles = false;
          hide_gitignored = false;
        };

        follow_current_file = {
          enabled = true;
        };

        hijack_netrw_behavior = "open_default";
        use_libuv_file_watcher = true;
      };

      window = {
        width = 32;
        mappings = {
          "<space>" = "none";
          "l" = "open";
          "h" = "close_node";
        };
      };
    };
  };
}