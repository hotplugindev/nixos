{ lib, config, ... }:

let
  requested = config.gb.requires.home.zellij != [ ];
in
{
  config = lib.mkIf requested {
    programs.zellij = {
      enable = true;

      settings = {
        mouse_mode = true;
        pane_frames = false;
        simplified_ui = true;

        copy_on_select = false;

        session_serialization = true;
        pane_viewport_serialization = true;
        scrollback_lines_to_serialize = 10000;
        scroll_buffer_size = 10000;
      };

      extraConfig = ''
        keybinds {
          normal {
            bind "Ctrl Space" {
              SwitchToMode "tmux"
            }
          }

          tmux {
            // Pane navigation
            bind "h" {
              MoveFocus "Left"
            }

            bind "j" {
              MoveFocus "Down"
            }

            bind "k" {
              MoveFocus "Up"
            }

            bind "l" {
              MoveFocus "Right"
            }

            // Create panes
            bind "n" {
              NewPane
            }

            bind "v" {
              NewPane "Down"
            }

            bind "s" {
              NewPane "Right"
            }

            // Pane management
            bind "x" {
              CloseFocus
            }

            bind "f" {
              ToggleFocusFullscreen
            }

            bind "z" {
              TogglePaneFrames
            }

            // Resize
            bind "H" {
              Resize "Increase Left"
            }

            bind "J" {
              Resize "Increase Down"
            }

            bind "K" {
              Resize "Increase Up"
            }

            bind "L" {
              Resize "Increase Right"
            }

            // Tabs
            bind "c" {
              NewTab
            }

            bind "Tab" {
              GoToNextTab
            }

            bind "b" {
              GoToPreviousTab
            }

            // Session
            bind "d" {
              Detach
            }

            // Return to normal mode
            bind "Esc" {
              SwitchToMode "Normal"
            }
          }
        }
      '';
    };
  };
}
