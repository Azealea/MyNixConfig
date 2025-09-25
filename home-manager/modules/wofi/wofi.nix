{
  programs.wofi = {
    enable = true;
    settings = {
      show = "drun";
      # width = 800;
      # height = 500;
      # location = "center";
      # halign = "fill";
      # orientation = "horizontal";
      # allow_markup = true;
      # filter_rate = 100;
      # prompt = "Search";
      # hide_scroll = false;
    };
    style = builtins.readFile ./style.css;
  };
}
