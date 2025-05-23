{
  programs.wofi = {
    enable = true;
    settings = {
      # You can tweak these as needed
      show = "drun";
      prompt = "Search:";
      width = 600;
      height = 400;
      lines = 10;
    };
    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 14px;
      }

      window {
        margin: 0px;
        padding: 0px;
        border: 2px solid rgba(255, 255, 255, 0.1);
        background-color: rgba(0, 0, 0, 0.6);
        border-radius: 12px;
      }

      #input {
        margin: 10px;
        padding: 10px;
        border: none;
        border-radius: 8px;
        background-color: rgba(255, 255, 255, 0.1);
        color: white;
      }

      #entry {
        padding: 10px;
        margin: 2px;
        border-radius: 8px;
        background-color: transparent;
        color: white;
      }

      #entry:selected {
        background-color: rgba(255, 255, 255, 0.2);
      }
    '';
  };
}

