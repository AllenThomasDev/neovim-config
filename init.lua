-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
--purple :as in clojure, need to move it to colorscheme.lua
vim.opt.termguicolors = true
--vim.cmd.colorscheme("catppuccin-frappe")
--vim.cmd("call darcula#Hi('@string.special.symbol.clojure', [ '#9876aa', 255], darcula#palette.null, 'italic')")
vim.cmd("set showtabline=0")
vim.api.nvim_create_autocmd("DiagnosticChanged", {
  pattern = { "conjure-log-*" },
  callback = function(args)
    local diagnostics = args.data.diagnostics

    if diagnostics[1] ~= nil then
      local bufnr = diagnostics[1]["bufnr"]
      local namespace = diagnostics[1]["namespace"]
      vim.diagnostic.disable(bufnr)
      vim.diagnostic.reset(namespace, bufnr)
    end
  end,
})
