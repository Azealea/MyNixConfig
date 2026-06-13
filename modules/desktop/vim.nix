{
  pkgs,
  username,
  ...
}: {
  home-manager.users.${username}.programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      vim-code-dark # Theme
      gruvbox
      vim-airline # Status bar
      coc-nvim # LSP & autocompletion
      vim-gitgutter
      vim-clang-format
    ];

    extraConfig = builtins.readFile ./config.vim;
  };
}
