{ ... }: {

  programs.nixvim.plugins.treesitter = {
    enable = true;

    nixvimInjections = true;
    settings = {
      highlight = {
        enable = true;
        additional_vim_regex_highlighting = false;
      };
      parser_install_dir = "~/.config/nvim/treesitter";
      ensure_installed =
        [ "nix" "c" "rust" "go" "zig" "markdown" "markdown_inline" ];
    };
  };
}
