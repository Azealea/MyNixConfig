{pkgs, ...}: {
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      vim-code-dark # Theme
      gruvbox
      vim-airline # Status bar
      coc-nvim # LSP & autocompletion
      vim-gitgutter
      vim-clang-format
    ];

    extraConfig = ''
      " General settings
      set nocompatible
      set number
      set scrolloff=999
      set wildmenu
      set shiftwidth=4
      set softtabstop=4
      set expandtab
      set signcolumn=yes
      set updatetime=300
      set ignorecase
      set smartcase
      set incsearch
      set hlsearch
      set splitright
      set background=dark
      let g:gruvbox_contrast_dark='hard'
      colorscheme gruvbox

      " ======= Keybindings =======
      nnoremap * m`:keepjumps normal! *``<cr>
      nnoremap <A-k> :m-2<CR>
      nnoremap <A-j> :m+1<CR>
      nnoremap <A-h> :bp<CR>
      nnoremap <A-d> :bd<CR>
      nnoremap <A-l> :bn<CR>
      nnoremap <A-Left> :bp<CR>
      nnoremap <A-Right> :bn<CR>
      nnoremap <A-w> :w<CR>
      nnoremap <A-x> :wq<CR>

      " ======= GitGutter Settings =======
      let g:gitgutter_enabled = 1
      highlight GitGutterAdd guifg=#009900 ctermfg=Green
      highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
      highlight GitGutterDelete guifg=#ff2222 ctermfg=Red

      " Navigate between hunks
      nnoremap <A-g>n :GitGutterNextHunk<CR>
      nnoremap <A-g>p :GitGutterPrevHunk<CR>

      " Stage hunk (adds change to index)
      nnoremap <A-g>s :GitGutterStageHunk<CR>

      " Undo hunk (revert change back to last commit)
      nnoremap <A-g>u :GitGutterUndoHunk<CR>

      " Preview hunk (see original vs modified)
      nnoremap <A-g>e :GitGutterPreviewHunk<CR>

      " ======= Airline Settings =======
      let g:airline#extensions#tabline#enabled = 1
      let g:airline_symbols_ascii = 1
      let g:airline_left_sep = '\'
      let g:airline_right_sep = '\'
      let g:airline_symbols = {}

      " ======= Coc.nvim Configuration =======
      set completeopt=longest,menuone,popuphidden
      set completepopup=highlight:Pmenu,border:off
      inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1) :
            \ CheckBackspace() ? "\<Tab>" :
            \ coc#refresh()
      inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
      inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                                  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
      function! CheckBackspace() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
      endfunction
      inoremap <silent><expr> <c-@> coc#refresh()
      autocmd CursorHold * silent call CocActionAsync('highlight')
      highlight CocHintSign guifg=#555555
      highlight CocHintText guifg=#777777
      nmap <F2> <Plug>(coc-rename)
      xmap <F4>  <Plug>(coc-format-selected)
      nmap <F4>  <Plug>(coc-format-selected)

      nmap <silent> gd <Plug>(coc-definition)
      nmap <silent> gD <Plug>(coc-implementation)
      nmap <silent> gr <Plug>(coc-references)


      autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
      highlight ExtraWhitespace ctermbg=red guibg=red
      match ExtraWhitespace /\s\+$/

    '';
  };
}
