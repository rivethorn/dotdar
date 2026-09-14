-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("lspconfig").clangd.setup({
  init_options = {
    fallbackFlags = { "--std=c++26" },
  },
})
