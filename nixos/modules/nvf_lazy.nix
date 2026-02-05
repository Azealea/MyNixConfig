{
  programs.nvf = {
    enable = true;

    settings.vim = {
      viAlias = true;
      vimAlias = true;

      options = {
        tabstop = 4;
        shiftwidth = 4;
        softtabstop = 0;
        expandtab = false;
      };

      theme = {
        enable = true;

        name = "catppuccin";
        style = "mocha";
      };

      ui = {
        borders.enable = true;
        noice.enable = true;
        colorizer.enable = true;
        illuminate.enable = true;
        smartcolumn.enable = true;
      };

      visuals = {
        nvim-web-devicons.enable = true;
        nvim-cursorline.enable = true;
        indent-blankline.enable = true;
      };

      dashboard = {
        alpha.enable = true;
      };

      statusline.lualine.enable = true;
      tabline.nvimBufferline.enable = true;

      telescope.enable = true;

      lsp = {
        enable = true;
        formatOnSave = true;
        trouble.enable = true;
      };

      languages = {
        enableTreesitter = true;
        enableFormat = true;
        enableExtraDiagnostics = true;

        nix.enable = true;
        clang.enable = true;
      };

      git = {
        enable = true;
        gitsigns.enable = true;
        gitsigns.codeActions.enable = true;
      };

      projects.project-nvim.enable = true;

      debugger.nvim-dap = {
        enable = true;
        ui.enable = true;
      };
    };
  };
}
