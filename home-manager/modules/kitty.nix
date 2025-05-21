{ config, lib, pkgs, ... }:

let
  fontFamily = "FiraCode Nerd Font";
  fontSize = 12;
in {
  programs.kitty = {
    enable = true;

    font = {
      name = fontFamily;
      size = fontSize;
    };

    settings = {
      # Cursor configuration
      cursor_shape = "beam";     # Options: block, beam, underline
      cursor_blink_interval = 0.6;    # Seconds (0 to disable blinking)
      cursor_stop_blinking_after = 15;
      cursor_trail = 3;

      # Appearance
      background_opacity = "0.90";
      enable_audio_bell = false;
      confirm_os_window_close = 0;
      hide_window_decorations = "yes";

      # Performance tuning
      repaint_delay = 5;
      input_delay = 1;

      # Scrolling
      scrollback_lines = 10000;
      wheel_scroll_multiplier = 5.0;
    };
  };
}
