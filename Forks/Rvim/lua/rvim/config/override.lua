-- undercurl
vim.cmd('let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"')
vim.cmd('let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"')

local function map(mode, lhs, rhs)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    vim.keymap.set(mode, lhs, rhs, { silent = true, noremap = true })
  end
end

-- reset key
map("n", "<A-Cr>", "<Nop>")
map("i", "<A-Bs>", "<Nop>")
map("i", "<C-D>", "<Nop>")
map({ "n", "x", "v" }, "q", "<Nop>")
map({ "n", "x", "v" }, "Q", "<Nop>")
map({ "n", "x", "v" }, "<NL>", "<Nop>")
map({ "n", "x", "v" }, "<C-w>", "<Nop>")
map({ "n", "x", "v" }, "<C-F>", "<Nop>")
map({ "n", "x", "v" }, "<C-B>", "<Nop>")
