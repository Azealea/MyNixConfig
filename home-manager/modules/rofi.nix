{
  config,
  pkgs,
  ...
}: let
  rofiTheme = ''
    * {
        font:                        "Product Sans Bold 12";
        background:                  #0F1417;
        surface:                     #1E333C;
        primary:                     #ACC7FF;
        selected:                    #DF5296;
        active:                      #6E77FF;
        urgent:                      #8E3596;

        BGA:                         #0F1417;
    }

    /*****----- Configuration -----*****/
    configuration {
      modi:                       "drun,run,filebrowser";
      show-icons:                 true;
      display-drun:               "APPS";
      display-run:                "RUN";
      display-filebrowser:        "FILES";
      display-window:             "WINDOW";
      drun-display-format:        "{name}";
      window-format:              "{w} · {c} · {t}";
    }

    /*****----- Main Window -----*****/
    window {
      transparency:                "real";
      location:                    center;
      anchor:                      center;
      fullscreen:                  false;
      width:                       1000px;
      x-offset:                    0px;
      y-offset:                    0px;

      enabled:                     true;
      border:                      0px;
      border-color:                @BGA;
      border-radius:               15px;
      cursor:                      "default";
      background-color:            @background;
    }

    /*****----- Main Box -----*****/
    mainbox {
      enabled:                     true;
      spacing:                     0px;
      background-color:            transparent;
      orientation:                 horizontal;
      children:                    [ "imagebox", "listbox" ];
    }

    imagebox {
      padding:                     20px;
      background-color:            transparent;
      background-image:            url("~/.cache/rofi-wallpaper.jpg");
      background-size: 100%;
      orientation:                 vertical;
      children:                    [ "inputbar", "dummy", "mode-switcher" ];
    }

    listbox {
      spacing:                     20px;
      padding:                     20px;
      background-color:            transparent;
      orientation:                 vertical;
      children:                    [ "listview" ];
    }

    dummy {
      background-color:            transparent;
    }

    /*****----- Inputbar -----*****/
    inputbar {
      enabled:                     true;
      spacing:                     10px;
      padding:                     15px;
      border-radius:               10px;
      background-color:            @surface;
      text-color:                  @primary;
      children:                    [ "textbox-prompt-colon", "entry" ];
    }

    textbox-prompt-colon {
      enabled:                     true;
      expand:                      false;
      str:                         "";
      background-color:            inherit;
      text-color:                  inherit;
    }

    entry {
      enabled:                     true;
      background-color:            inherit;
      text-color:                  inherit;
      cursor:                      text;
      placeholder:                 "Search";
      placeholder-color:           inherit;
    }

    /*****----- Mode Switcher -----*****/
    mode-switcher{
      enabled:                     true;
      spacing:                     20px;
      background-color:            transparent;
      text-color:                  @primary;
    }

    button {
      padding:                     15px;
      border-radius:               10px;
      background-color:            @surface;
      text-color:                  inherit;
      cursor:                      pointer;
    }

    button selected {
      background-color:            @primary;
      text-color:                  @surface;
    }

    /*****----- Listview -----*****/
    listview {
      enabled:                     true;
      columns:                     1;
      lines:                       8;
      cycle:                       true;
      dynamic:                     true;
      scrollbar:                   false;
      layout:                      vertical;
      reverse:                     false;
      fixed-height:                true;
      fixed-columns:               true;

      spacing:                     10px;
      background-color:            transparent;
      text-color:                  @primary;
      cursor:                      "default";
    }

    /*****----- Elements -----*****/
    element {
      enabled:                     true;
      spacing:                     15px;
      padding:                     8px;
      border-radius:               10px;
      background-color:            transparent;
      text-color:                  @primary;
      cursor:                      pointer;
    }

    element normal.normal {
      background-color:            inherit;
      text-color:                  inherit;
    }

    element normal.urgent {
      background-color:            @urgent;
      text-color:                  @primary;
    }

    element normal.active {
      background-color:            @primary;
      text-color:                  @surface;
    }

    element selected.normal {
      background-color:            @primary;
      text-color:                  @surface;
    }

    element selected.urgent {
      background-color:            @urgent;
      text-color:                  @primary;
    }

    element selected.active {
      background-color:            @urgent;
      text-color:                  @primary;
    }

    element-icon {
      background-color:            transparent;
      text-color:                  inherit;
      size:                        32px;
      cursor:                      inherit;
    }

    element-text {
      background-color:            transparent;
      text-color:                  inherit;
      cursor:                      inherit;
      vertical-align:              0.5;
      horizontal-align:            0.0;
    }

    /*****----- Message -----*****/
    message {
      background-color:            transparent;
    }

    textbox {
      padding:                     15px;
      border-radius:               10px;
      background-color:            @surface;
      text-color:                  @primary;
      vertical-align:              0.5;
      horizontal-align:            0.0;
    }

    error-message {
      padding:                     15px;
      border-radius:               20px;
      background-color:            @background;
      text-color:                  @primary;
    }
  '';
in {
  programs.rofi = {
    enable = true;

    theme = "~/.config/rofi/theme.rasi";

    extraConfig = {
      modi = "drun,run,filebrowser";
      show-icons = true;
    };
  };

  xdg.configFile."rofi/theme.rasi".text = rofiTheme;

  xdg.configFile."rofi/images/.keep".text = "";

  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji
    font-awesome
  ];
}
