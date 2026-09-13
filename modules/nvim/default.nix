{
  pkgs,
  username,
  ...
}: {
  home-manager.users.${username}.programs.neovim = {
    enable = true;
    viAlias = false;
    vimAlias = true;
    withRuby = false;
    withPython3 = false;

    extraPackages = with pkgs; [
      nixd
      pyright
      llvmPackages_latest.clang-tools
      alejandra
      ruff
      ripgrep
      rust-analyzer
    ];

    plugins = with pkgs.vimPlugins; [
      plenary-nvim
      nvim-web-devicons

      {
        plugin = catppuccin-nvim;
        type = "lua";
        config = ''
          require("catppuccin").setup({ flavour = "mocha" })
          vim.cmd.colorscheme("catppuccin")
        '';
      }

      {
        plugin = nvim-treesitter.withPlugins (p: with p; [c cpp python nix lua bash rust]);
        type = "lua";
        config = ''
          vim.api.nvim_create_autocmd("FileType", {
          		callback = function(ev)
          		pcall(vim.treesitter.start, ev.buf)
          		end,
          		})
        '';
      }

      luasnip
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp_luasnip

      {
        plugin = nvim-cmp;
        type = "lua";
        config = ''
          local cmp     = require("cmp")
          local luasnip = require("luasnip")

          cmp.setup({
          		snippet = {
          		expand = function(args) luasnip.lsp_expand(args.body) end,
          		},
          		mapping = cmp.mapping.preset.insert({
          				["<C-Space>"] = cmp.mapping.complete(),
          				["<CR>"]      = cmp.mapping.confirm({ select = true }),
          				["<Tab>"] = cmp.mapping(function(fallback)
          						if cmp.visible() then cmp.select_next_item()
          						elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
          						else fallback() end
          						end, { "i", "s" }),
          				["<S-Tab>"] = cmp.mapping(function(fallback)
          						if cmp.visible() then cmp.select_prev_item()
          						elseif luasnip.jumpable(-1) then luasnip.jump(-1)
          						else fallback() end
          						end, { "i", "s" }),
          				}),
          		sources = cmp.config.sources({
          				{ name = "nvim_lsp" },
          				{ name = "luasnip" },
          				{ name = "buffer" },
          				{ name = "path" },
          				}),
          })
        '';
      }

      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = ''
          	local capabilities = require("cmp_nvim_lsp").default_capabilities()

          	vim.lsp.config("*", { capabilities = capabilities })
          	vim.lsp.config("nixd", {
          			settings = {
          			nixd = {
          			formatting = { command = { "alejandra", "--quiet" } },
          			},
          			},
          			})
          vim.lsp.enable({ "clangd", "nixd", "pyright", "rust_analyzer" })

          	vim.diagnostic.config({
          			virtual_text     = true,
          			virtual_lines    = false,
          			signs            = true,
          			update_in_insert = false,
          			})

          vim.api.nvim_create_autocmd("BufWritePre", {
          		pattern = { "*.c", "*.cpp", "*.h", "*.py", "*.nix", "*.rs" },
          		callback = function()
          		vim.lsp.buf.format({ async = false, timeout_ms = 3000 })
          		end,
          		})
          vim.api.nvim_create_autocmd("LspAttach", {
          		callback = function(ev)
          		local o = { buffer = ev.buf, silent = true }
          		vim.keymap.set("n", "gd",         vim.lsp.buf.definition,     o)
          		vim.keymap.set("n", "gD",         vim.lsp.buf.declaration,    o)
          		vim.keymap.set("n", "gI",         vim.lsp.buf.implementation, o)
          		vim.keymap.set("n", "gr",         vim.lsp.buf.references,     o)
          		vim.keymap.set("n", "gy",         vim.lsp.buf.type_definition,o)
          		vim.keymap.set("n", "K",          vim.lsp.buf.hover,          o)
          		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action,    o)
          		vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename,         o)
          		end,
          		})
        '';
      }

      {
        plugin = lualine-nvim;
        type = "lua";
        config = ''require("lualine").setup({ options = { theme = "catppuccin" } })'';
      }

      {
        plugin = gitsigns-nvim;
        type = "lua";
        config = ''require("gitsigns").setup()'';
      }

      {
        plugin = trouble-nvim;
        type = "lua";
        config = ''require("trouble").setup()'';
      }

      {
        plugin = indent-blankline-nvim;
        type = "lua";
        config = ''require("ibl").setup()'';
      }

      {
        plugin = telescope-nvim;
        type = "lua";
        config = ''
          require("telescope").setup({
            defaults = {
              vimgrep_arguments = {
                "rg", "--color=never", "--no-heading", "--with-filename",
                "--line-number", "--column", "--smart-case", "--hidden",
              },
            },
          })
        '';
      }
    ];

    initLua = ''
      vim.g.mapleader = " "
      vim.g.maplocalleader = ","
      vim.opt.tabstop = 4
      vim.opt.shiftwidth = 4
      vim.opt.expandtab = false
      vim.opt.colorcolumn = "80"
      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.signcolumn = "yes"
      vim.opt.termguicolors = true
      vim.opt.scrolloff = 8
      vim.opt.mouse = "a"

      local map = function(m, k, v, d)
      vim.keymap.set(m, k, v, { silent = true, desc = d })
      end

      vim.keymap.set("x", "p", '"_dP')

      map("n", "<S-l>", "<cmd>bn<cr>", "Next buffer")
      map("n", "<S-h>", "<cmd>bp<cr>", "Prev buffer")
      map("n", "<M-d>", "<cmd>bd<cr>", "Delete buffer")
      map("n", "<M-j>", "<cmd>m +1<cr>", "Move line down")
      map("n", "<M-k>", "<cmd>m -2<cr>", "Move line up")
      map("n", "<leader>Q", "<cmd>qa<cr>", "Quit all")

      local tel = require("telescope.builtin")
      map("n", "<leader>ff", tel.find_files, "Find files")
      map("n", "<leader>fg", tel.live_grep, "Live grep")
      map("n", "<leader>fb", tel.buffers, "Buffers")

      map("n", "hs", "<cmd>Gitsigns stage_hunk<cr>", "Stage hunk")
      map("n", "hu", "<cmd>Gitsigns undo_stage_hunk<cr>", "Undo stage hunk")
      map("n", "hr", "<cmd>Gitsigns reset_hunk<cr>", "Reset hunk")
      map("n", "hd", "<cmd>Gitsigns preview_hunk_inline<cr>", "Diff hunk")
      map("n", "]h", "<cmd>Gitsigns next_hunk<cr>", "Next hunk")
      map("n", "[h", "<cmd>Gitsigns prev_hunk<cr>", "Prev hunk")
    '';
  };
}
