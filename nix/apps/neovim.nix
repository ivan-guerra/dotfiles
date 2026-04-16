{ config, pkgs, ... }:

{
  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink 
    "${config.home.homeDirectory}/.dotfiles/nvim/.config/nvim";

  home.packages = with pkgs; [
    neovim

    # LSPs
    bash-language-server
    clang-tools # includes clangd + clang-format
    cmake-language-server
    dockerfile-language-server
    vscode-json-languageserver
    lua-language-server
    marksman
    pyright
    superhtml
    texlab

    # Linters 
    cmake-lint
    cpplint
    eslint
    ruff # py linter and formatter
    hadolint
    htmlhint
    shellcheck
    stylelint
    vale

    # Formatters
    cmake-format
    beautysh
    prettier

    # Tools CopilotChat can direct LLMs to use
    bash
    edit
    patchutils_0_4_2
  ];
}
