{
  pkgs,
  username,
  configDir,
  ...
}: {
  home-manager.users.${username} = {
    programs.zsh = {
      enable = true;
      dotDir = "/home/${username}/.config/zsh";

      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        rb = "sudo nixos-rebuild switch --flake ${configDir}";
        upd = "sudo nix flake update --flake ${configDir}";
        upg = "sudo nixos-rebuild switch --upgrade --flake ${configDir}";

        conf = "nvim ${configDir}/hosts/nixos/default.nix";
        pkgs = "nvim ${configDir}/modules/packages.nix";

        ll = "ls -l";
        vi = "vim";
        vim = "nvim";
      };

      history.size = 10000;
      history.path = "/home/${username}/.local/share/zsh/history";

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
        extraConfig = ''
          autoload -Uz compinit
            compinit
            zstyle ':completion:*:*:*:*:files' ignored-patterns '*.o' '*.d'
        '';
      };
    };

    home.file."zsh/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme".source = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
  };
}
