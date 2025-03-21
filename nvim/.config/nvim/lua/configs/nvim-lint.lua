local lint = require "lint"

lint.linters_by_ft = {
  cmake = { "cmakelang" },
  cpp = { "cpplint" },
  python = { "flake8" },
  docker = { "hadolint" },
  html = { "htmlhint" },
  json = { "jsonlint" },
  sh = { "shellcheck" },
  bash = { "shellcheck" },
  css = { "stylelint" },
  markdown = { "vale" },
  text = { "vale" },
}
