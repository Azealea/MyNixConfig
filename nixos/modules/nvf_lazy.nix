{
  programs.nvf = {
    enable = true;

    settings.vim = {
      viAlias = true;
      vimAlias = true;

      debugMode = {
        logFile = "/tmp/nvim.log";
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

        breadcrumbs = {
          enable = false;
          navbuddy.enable = false;
        };

        smartcolumn.enable = true;
      };

      visuals = {
        nvim-web-devicons.enable = true;
        nvim-cursorline.enable = true;

        indent-blankline.enable = true;
      };

      notify.nvim-notify.enable = true;

      dashboard = {
        alpha.enable = true;
      };

      statusline.lualine.enable = true;
      tabline.nvimBufferline.enable = true;

      filetree.neo-tree.enable = true;
      telescope.enable = true;

      binds = {
        whichKey = {
          enable = true;
          setupOpts = {
          };
        };
      };

      comments.comment-nvim.enable = true;
      autopairs.nvim-autopairs.enable = true;

      lsp = {
        enable = true;
        formatOnSave = true;

        lspkind.enable = true;

        trouble.enable = true;

        lspSignature.enable = false;
      };

      autocomplete = {
        nvim-cmp.enable = true;
      };

      snippets.luasnip.enable = true;

      languages = {
        enableTreesitter = true;
        enableFormat = true;
        enableExtraDiagnostics = true;

        nix.enable = true;
        clang.enable = true;
      };

      treesitter.context.enable = true;

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

      minimap.codewindow.enable = true;

      utility = {
        ccc.enable = false;
        diffview-nvim.enable = false;
        icon-picker.enable = false;
        leetcode-nvim.enable = false;
        smart-splits.enable = false;

        suround.enable = true;

        multicursors.enable = true;
      };
    };
  };
}
