local M = {}

---@param opts? RvimConfig
function M.setup(opts)
  require("rvim.config").setup(opts)
end

return M
