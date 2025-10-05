{
  config,
  pkgs,
  configDir,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    # enableAutosuggestions = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      rb = "sudo nixos-rebuild switch --flake ${configDir}";
      upd = "nix flake update --flake ${configDir}";
      upg = "sudo nixos-rebuild switch --upgrade --flake ${configDir}";

      hms = "home-manager switch --flake ${configDir} -b backupdeleteme";
      hmsb = "home-manager switch --flake ${configDir} -b backupdeleteme";

      conf = "nvim ${configDir}/nixos/configuration.nix";
      pkgs = "nvim ${configDir}/nixos/packages.nix";

      ll = "ls -l";
      v = "nvim";
    };

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    plugins = [
      {
        name = "powerlevel10k-config";
        src = ./p10k;
        file = "p10k.zsh";
      }
      {
        name = "zsh-powerlevel10k";
        src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/";
        file = "powerlevel10k.zsh-theme";
      }
    ];

    oh-my-zsh = {
      enable = true;
      plugins = ["git" "sudo"];
      # theme = "powerlevel10k/powerlevel10k";
    };
  };
  home.file."zsh/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme".source = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
}
