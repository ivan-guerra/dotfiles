local lint = require("lint")

lint.linters_by_ft = {
  cmake = { "cmakelint" },
  cpp = { "cpplint" },
  python = { "ruff" },
  docker = { "hadolint" },
  html = { "htmlhint" },
  json = { "eslint" },
  sh = { "shellcheck" },
  bash = { "shellcheck" },
  css = { "stylelint" },
  markdown = { "vale" },
  text = { "vale" },
}
