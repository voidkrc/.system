{ ... }: {

  programs.nixvim = {

    extraConfigLuaPost = ''
      vim.diagnostic.config({ virtual_text = true })
    '';

    plugins.lsp = {
      enable = true;
      keymaps = {
        silent = true;
        lspBuf = {
          "K" = "hover";
          "gd" = "definition";
          "<leader>ca" = "code_action";
          "<leader>r" = "rename";
          "<leader>rr" = "references";
        };

        diagnostic = {
          "[d" = "goto_next";
          "]d" = "goto_prev";
          "<leader>e" = "open_float";
        };
      };

      servers = {
        # Always have
        nil_ls.enable = true;

        # Use with nix develop
        clangd = {
          enable = true;
          package = null;
          settings = { init_options = { clangdFileStatus = true; }; };
        };
        gopls = {
          enable = true;
          package = null;
        };
        zls = {
          enable = true;
          package = null;
          settings = { build_on_save = true; };
        };
        rust_analyzer = {
          enable = true;
          package = null;
          installCargo = false;
          installRustc = false;
        };
        jsonls = {
          enable = true;
          package = null;
        };
      };
    };
  };
}
