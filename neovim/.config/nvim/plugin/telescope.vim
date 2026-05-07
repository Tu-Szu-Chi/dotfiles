lua << EOF
require('telescope').setup{
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "yarn.lock",
    },
  },
  pickers = {
    find_files = {
      hidden = true,
      no_ignore = true,
    },
  },
}
EOF
