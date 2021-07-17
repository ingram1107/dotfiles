-- projectionist conf
vim.g.projectionist_heuristics = {
  -- root project
  ["*"] = {
    --- c files
    ["*.c"] = {
      alternate = "{}.h",
      type = "source",
    },
    ["*.h"] = {
      alternate = {
        "{}.c",
        "{}.cpp",
      },
      type = "header",
    },

    --- cpp files
    ["*.cpp"] = {
      alternate = {
        "{}.hpp",
        "{}.h",
      },
      type = "source",
    },
    ["*.hpp"] = {
      alternate = "{}.cpp",
      type = "header",
    },

    --- rust files
    ["main.rs"] = {
      alternate = "lib.rs",
      type = "source",
    },
    ["lib.rs"] = {
      alternate = "main.rs",
      type = "library",
    },
    ["*.rs"] = {
      alternate = "lib.rs",
      type = "source",
    },
  },
}
