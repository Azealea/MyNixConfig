{
  programs.nvf.settings.vim = {
    # LazyVim leaders
    globals = {
      mapleader = " ";
      maplocalleader = ",";
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>Q";
        action = "<cmd>qa<cr>";
        desc = "Quit all";
      }

      {
        mode = "n";
        key = "<M-j>";
        action = "<cmd>m +1<cr>";
        desc = "Switch lines down";
      }
      {
        mode = "n";
        key = "<M-k>";
        action = "<cmd>m -2<cr>";
        desc = "Switch lines down";
      }

      # # Buffers
      {
        mode = "n";
        key = "<S-l>";
        action = "<cmd>bn<cr>";
        desc = "Next buffer";
      }
      {
        mode = "n";
        key = "<S-h>";
        action = "<cmd>bp<cr>";
        desc = "Prev buffer";
      }
      {
        mode = "n";
        key = "<M-d>";
        action = "<cmd>bd<cr>";
        desc = "Delete buffer";
      }
      # # lsp
      {
        mode = "n";
        key = "gd";
        action = "<cmd>lua vim.lsp.buf.definition()<cr>";
        desc = "Go to definition";
      }
      {
        mode = "n";
        key = "gD";
        action = "<cmd>lua vim.lsp.buf.declaration()<cr>";
        desc = "Go to declaration";
      }
      {
        mode = "n";
        key = "gI";
        action = "<cmd>lua vim.lsp.buf.implementation()<cr>";
        desc = "Go to implementation";
      }
      {
        mode = "n";
        key = "gr";
        action = "<cmd>lua vim.lsp.buf.references()<cr>";
        desc = "References";
      }
      {
        mode = "n";
        key = "gy";
        action = "<cmd>lua vim.lsp.buf.type_definition()<cr>";
        desc = "Type definition";
      }
      {
        mode = "n";
        key = "K";
        action = "<cmd>lua vim.lsp.buf.hover()<cr>";
        desc = "Hover";
      }
      {
        mode = "n";
        key = "<leader>ca";
        action = "<cmd>lua vim.lsp.buf.code_action()<cr>";
        desc = "Code action";
      }
      {
        mode = "n";
        key = "<leader>cr";
        action = "<cmd>lua vim.lsp.buf.rename()<cr>";
        desc = "Rename";
      }
      {
        mode = "n";
        key = "<leader>x";
        action = "<cmd>Trouble diagnostics toggle<cr>";
        desc = "Toggle Trouble";
      }
      #      {
      #        mode = "n";
      #        key = "]x";
      #        action = "<cmd>TroubleNext<cr>";
      #        desc = "Next Trouble item";
      #      }
      #      {
      #        mode = "n";
      #        key = "[x";
      #        action = "<cmd>TroublePrevious<cr>";
      #        desc = "Previous Trouble item";
      #      }
      # # git
      {
        mode = "n";
        key = "hs";
        action = "<cmd>Gitsigns stage_hunk<cr>";
        desc = "Stage hunk";
      }
      {
        mode = "n";
        key = "hu";
        action = "<cmd>Gitsigns undo_stage_hunk<cr>";
        desc = "Undo stage hunk";
      }
      {
        mode = "n";
        key = "hr";
        action = "<cmd>Gitsigns reset_hunk<cr>";
        desc = "Reset hunk";
      }
      {
        mode = "n";
        key = "hd";
        action = "<cmd>Gitsigns preview_hunk_inline<cr>";
        desc = "Diff hunk";
      }
      {
        mode = "n";
        key = "]h";
        action = "<cmd>Gitsigns next_hunk<cr>";
        desc = "Next hunk";
      }
      {
        mode = "n";
        key = "[h";
        action = "<cmd>Gitsigns prev_hunk<cr>";
        desc = "Previous hunk";
      }
    ];
  };
}
