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
              SwitchToMode "Tmux"
            }
          }

          tmux {
            bind "h" {
              MoveFocus "Left"
              SwitchToMode "Normal"
            }

            bind "j" {
              MoveFocus "Down"
              SwitchToMode "Normal"
            }

            bind "k" {
              MoveFocus "Up"
              SwitchToMode "Normal"
            }

            bind "l" {
              MoveFocus "Right"
              SwitchToMode "Normal"
            }

            bind "n" {
              NewPane
              SwitchToMode "Normal"
            }

            bind "v" {
              NewPane "Down"
              SwitchToMode "Normal"
            }

            bind "s" {
              NewPane "Right"
              SwitchToMode "Normal"
            }

            bind "x" {
              CloseFocus
              SwitchToMode "Normal"
            }

            bind "f" {
              ToggleFocusFullscreen
              SwitchToMode "Normal"
            }

            bind "z" {
              TogglePaneFrames
              SwitchToMode "Normal"
            }

            bind "H" {
              Resize "Increase Left"
              SwitchToMode "Normal"
            }

            bind "J" {
              Resize "Increase Down"
              SwitchToMode "Normal"
            }

            bind "K" {
              Resize "Increase Up"
              SwitchToMode "Normal"
            }

            bind "L" {
              Resize "Increase Right"
              SwitchToMode "Normal"
            }

            bind "c" {
              NewTab
              SwitchToMode "Normal"
            }

            bind "Tab" {
              GoToNextTab
              SwitchToMode "Normal"
            }

            bind "b" {
              GoToPreviousTab
              SwitchToMode "Normal"
            }

            bind "d" {
              Detach
            }

            bind "Esc" {
              SwitchToMode "Normal"
            }
          }
        }
      '';
    };
  };
}
