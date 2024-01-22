return {
  {
    "christoomey/vim-tmux-navigator",
    keys = {
      { "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", desc = "Go to the previous pane" },
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Got to the left pane" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Got to the down pane" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Got to the up pane" },
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Got to the right pane" },
    },

    init = function()
      local g = vim.g
      -- g.tmux_navigator_disable_when_zoomed = 1
      g.tmux_navigator_preserve_zoom = 1
    end,
  },
  {
    "lervag/vimtex",
    ft = {
      "tex",
      "plaintex",
    },
    config = function()
      local g = vim.g
      g.vimtex_view_method = "zathura"
      g.vimtex_indent_enabled = 0
      g.vimtex_syntax_enabled = 0
    end,
  },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    keys = {
      -- ZenMode
      vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<cr>", { silent = true }),
      desc = "Zenmode",
    },
    opts = {
      window = {
        backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
        width = 120, -- width of the Zen window
        height = 1, -- height of the Zen window
      },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    config = function()
      vim.g.mkdp_theme = "light"
    end,
  },
}
