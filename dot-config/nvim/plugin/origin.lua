-- origin conf
require('origin').setup {
  default_source = {
    c    = { "src", "lib", "test" },
    cpp  = { "src", "lib", "test" },
    rust = { "src", "test" },
    lua  = { "lua", "plugin", "after" },
    lisp = { "src", "test" },
    vim  = { "after", "autoload", "plugin", "ftdetect", "compiler" },
    css  = "css",
    scss = "scss",
  },
  prompt = false,
}
