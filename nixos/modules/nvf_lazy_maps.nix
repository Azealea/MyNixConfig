{
  programs.nvf.settings.vim = {
    # LazyVim leaders
    globals = {
      mapleader = " ";
      maplocalleader = ",";
    };

    keymaps = [
      # --- Basics ---
      {
        mode = "n";
        key = "<Esc>";
        action = "<cmd>noh<cr><esc>";
        desc = "Clear search highlight";
      }
      {
        mode = ["n" "i"];
        key = "<C-s>";
        action = "<cmd>w<cr>";
        desc = "Save file";
      }
      {
        mode = "n";
        key = "<leader>Q";
        action = "<cmd>qa<cr>";
        desc = "Quit all";
      }

      # --- Explorer (neo-tree) ---
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>Neotree toggle<cr>";
        desc = "Explorer";
      }

      {
        mode = "n";
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<cr>";
        desc = "Find files";
      }
      {
        mode = "n";
        key = "<leader>fg";
        action = "<cmd>Telescope live_grep<cr>";
        desc = "Grep (live)";
      }
      {
        mode = "n";
        key = "<leader>fb";
        action = "<cmd>Telescope buffers<cr>";
        desc = "Buffers";
      }
      {
        mode = "n";
        key = "<leader>fr";
        action = "<cmd>Telescope oldfiles<cr>";
        desc = "Recent files";
      }
      {
        mode = "n";
        key = "<leader>fh";
        action = "<cmd>Telescope help_tags<cr>";
        desc = "Help";
      }

      # --- Buffers (bufferline-ish feel) ---
      {
        mode = "n";
        key = "<S-l>";
        action = "<cmd>BufferLineCycleNext<cr>";
        desc = "Next buffer";
      }
      {
        mode = "n";
        key = "<S-h>";
        action = "<cmd>BufferLineCyclePrev<cr>";
        desc = "Prev buffer";
      }
      {
        mode = "n";
        key = "<leader>bd";
        action = "<cmd>bdelete<cr>";
        desc = "Delete buffer";
      }
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w>h";
        desc = "Go to left window";
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w>j";
        desc = "Go to lower window";
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w>k";
        desc = "Go to upper window";
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w>l";
        desc = "Go to right window";
      }
      {
        mode = "n";
        key = "]d";
        action = "<cmd>lua vim.diagnostic.goto_next()<cr>";
        desc = "Next diagnostic";
      }
      {
        mode = "n";
        key = "[d";
        action = "<cmd>lua vim.diagnostic.goto_prev()<cr>";
        desc = "Prev diagnostic";
      }
      {
        mode = "n";
        key = "<leader>cd";
        action = "<cmd>lua vim.diagnostic.open_float()<cr>";
        desc = "Line diagnostics";
      }
      {
        mode = "n";
        key = "<leader>xx";
        action = "<cmd>Trouble diagnostics toggle<cr>";
        desc = "Trouble: diagnostics";
      }
      {
        mode = "n";
        key = "<leader>xq";
        action = "<cmd>Trouble qflist toggle<cr>";
        desc = "Trouble: quickfix";
      }
      {
        mode = "n";
        key = "<leader>xl";
        action = "<cmd>Trouble loclist toggle<cr>";
        desc = "Trouble: loclist";
      }
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
        key = "<leader>cf";
        action = "<cmd>lua vim.lsp.buf.format({ async = true })<cr>";
        desc = "Format";
      }

      # --- Git (gitsigns) ---
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
        desc = "Prev hunk";
      }
      {
        mode = "n";
        key = "<leader>gp";
        action = "<cmd>Gitsigns preview_hunk<cr>";
        desc = "Preview hunk";
      }
      {
        mode = "n";
        key = "<leader>gs";
        action = "<cmd>Gitsigns stage_hunk<cr>";
        desc = "Stage hunk";
      }
      {
        mode = "n";
        key = "<leader>gr";
        action = "<cmd>Gitsigns reset_hunk<cr>";
        desc = "Reset hunk";
      }
      {
        mode = "n";
        key = "<leader>gb";
        action = "<cmd>Gitsigns blame_line<cr>";
        desc = "Blame line";
      }

      # --- DAP / DAP UI ---
      {
        mode = "n";
        key = "<leader>dc";
        action = "<cmd>DapContinue<cr>";
        desc = "Debug: continue";
      }
      {
        mode = "n";
        key = "<leader>db";
        action = "<cmd>DapToggleBreakpoint<cr>";
        desc = "Debug: breakpoint";
      }
      {
        mode = "n";
        key = "<leader>di";
        action = "<cmd>DapStepInto<cr>";
        desc = "Debug: step into";
      }
      {
        mode = "n";
        key = "<leader>do";
        action = "<cmd>DapStepOver<cr>";
        desc = "Debug: step over";
      }
      {
        mode = "n";
        key = "<leader>dO";
        action = "<cmd>DapStepOut<cr>";
        desc = "Debug: step out";
      }
      {
        mode = "n";
        key = "<leader>dr";
        action = "<cmd>DapToggleRepl<cr>";
        desc = "Debug: REPL";
      }
      {
        mode = "n";
        key = "<leader>du";
        action = "<cmd>DapUiToggle<cr>";
        desc = "Debug: UI";
      }
      {
        mode = ["n" "v"];
        key = "<C-M-d>";
        action = "<cmd>MCstart<cr>";
        desc = "MultiCursor: start (VSCode Ctrl+D style)";
      }
    ];
  };
}
