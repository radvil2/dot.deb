-- @desc This file is automatically loaded by rvim.plugins.config

local Util = require("rvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Base
map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Open Location List" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Open Quickfix List" })
map("n", "H", "^", { nowait = true, silent = false })
map("n", "J", "5j", { nowait = true, silent = false })
map("n", "K", "5k", { nowait = true, silent = false })
map("n", "L", "g_", { nowait = true, silent = false })
map("v", "H", "^", { nowait = true, silent = false })
map("v", "J", "5j", { nowait = true, silent = false })
map("v", "K", "5k", { nowait = true, silent = false })
map("v", "L", "$", { nowait = true, silent = false })
map("n", ";", ":", { nowait = true, silent = false })
map("v", ";", ":", { nowait = true, silent = false })
map("n", "U", "<C-r>", { nowait = true })
map("n", "+", "<Cmd>join<Cr>", { nowait = true })

-- Change forward/backward whilst in ins mode
map("i", "<C-d>", '<Esc>l"_cw')
map("i", "<A-Bs>", '<Esc>l"_cb')

-- Add ispace after cursor whilst in ins mode
map("i", "<C-i>", "<Space><Esc>i")
map("i", "<C-h>", "<Left>")
map("i", "<C-l>", "<Right>")

-- Give one space down whilst in normal mode
map("n", "<A-Cr>", "o<Esc>")

-- Center search result
map("n", "n", "nzz", { nowait = true })
map("n", "N", "Nzz", { nowait = true })

-- Test selection
map("n", "<C-g>", "ggVG", { desc = "Select all content [Normal]" })
map("i", "<C-g>", "<Esc>ggVG<Cr>", { desc = "Select all content" })
map("v", "<C-g>", "<Esc>", { desc = "Deselect all content" })

-- Better up/down
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- better indenting
map("v", "<", "<gv", { desc = "Indent Left" })
map("v", ">", ">gv", { desc = "Indent Right" })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Move Lines
map("n", "<A-j>", ":m .+1<cr>==", { desc = "Move down" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("i", "<A-j>", "<Esc>:m .+1<cr>==gi", { desc = "Move down" })
map("n", "<A-k>", ":m .-2<cr>==", { desc = "Move up" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
map("i", "<A-k>", "<Esc>:m .-2<cr>==gi", { desc = "Move up" })

-- Windows
-- TODO: search what diff window and buffer ?
-- map("n", "<Leader>bd", "<C-W>c", { desc = "Delete window" })
-- map("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
-- map("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- Buffers
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "q", "<Cmd>close<Cr>", { desc = "Close buffer" })
map("n", "Q", "<Cmd>bufdo close<Cr>", { desc = "Close all buffers" })
map("n", "<Leader>w", "<Cmd>bdelete<Cr>", { desc = "Delete buffer" })
map("n", "<Leader>W", "<Cmd>bufdo bdelete<Cr>", { desc = "Delete all buffer" }) -- TODO: set these conditionally with bufferline

-- Toggle options
map("n", "<leader>uf", function()
  require("rvim.plugins.lsp.format").toggle()
end, { desc = "Toggle format on Save" })

map("n", "<leader>us", function()
  Util.toggle("spell")
end, { desc = "Toggle Spelling" })

map("n", "<leader>uw", function()
  Util.toggle("wrap")
end, { desc = "Toggle Word Wrap" })

map("n", "<leader>ul", function()
  Util.toggle("relativenumber", true)
  Util.toggle("number")
end, { desc = "Toggle Line Numbers" })

map("n", "<leader>ud", function()
  Util.toggle_diagnostics()
end, { desc = "Toggle Diagnostics" })

-- lazygit
map("n", "<leader>gg", function()
  Util.float_term({ "lazygit" }, { cwd = Util.get_root() })
end, { desc = "Lazygit (root dir)" })

map("n", "<leader>gG", function()
  Util.float_term({ "lazygit" })
end, { desc = "Lazygit (cwd)" })

-- highlights under cursor
if vim.fn.has("nvim-0.9.0") == 1 then
  map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
end

-- floating terminal
map("n", "<leader>ft", function()
  Util.float_term(nil, { cwd = Util.get_root() })
end, { desc = "Terminal (root dir)" })

map("n", "<leader>fT", function()
  Util.float_term()
end, { desc = "Terminal (cwd)" })

-- Quit with prompt
map({ "n", "v", "x" }, "ZZ", function() -- TODO: extract function
  local get_buf_opt = function(opt)
    local okay, buf_opt = pcall(vim.api.nvim_buf_get_option, 0, opt)
    if not okay then
      return nil
    else
      return buf_opt
    end
  end
  if get_buf_opt("modified") then
    local prompt = "🚩 You have unsaved changes. Fucking quit anyway? (y/n) "
    vim.ui.input({ prompt = prompt }, function(input)
      if input == "y" then
        vim.cmd("q!")
      end
    end)
  else
    vim.cmd("q!")
  end
end)
