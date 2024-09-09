return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    config = true,
    opts = {
      terminal_colors = false,
      bold = false,
    },
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
