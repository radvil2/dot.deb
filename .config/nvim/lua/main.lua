local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    {
      dir = "~/Forks/Rvim",
      import = "rvim.plugins",
    },
    -- {
    --   import = "rvim.plugins.extras.ui.mini-animate"
    -- },
    {
      import = "rvim.plugins.extras.lang.typescript",
    },
    {
      import = "rvim.plugins.extras.lang.json",
    },
    {
      import = "plugins",
    },
  },
  defaults = {
    lazy = true,
    version = false,
  },
  install = {
    colorscheme = {
      "tokyonight",
      "habamax",
    },
  },
  checker = {
    enabled = true,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "tarPlugin",
        "zipPlugin",
        "tohtml",
        "tutor",
        "gzip",
      },
    },
  },
})
