-- origin conf
require('origin').setup {
  default_source = {
    c    = { "src", "lib", "test" },
    cpp  = { "src", "lib", "test" },
    rust = { "src", "tests" },
    lua  = { "lua", "plugin", "after" },
    lisp = { "src", "test" },
    vim  = { "after", "autoload", "plugin", "colors", "ftdetect", "compiler" },
    css  = "css",
    scss = "scss",
  },
  prompt = false,
}
