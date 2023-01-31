require("rvim.config").init()

return {
  {
    "folke/lazy.nvim",
    version = "*",
  },
  {
    dir = "~/Forks/Rvim",
    priority = 9999,
    config = true,
    lazy = false,
  },
}
