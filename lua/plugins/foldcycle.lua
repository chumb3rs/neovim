return {
  "jghauser/fold-cycle.nvim",
  keys = {
    {
      "<tab>",
      function()
        return require("fold-cycle").open()
      end,
      mode = "n",
      desc = "Open folds"
    },
    {
      "<s-tab>",
      function()
        require("fold-cycle").close()
      end,
      mode = "n",
      desc = "Close folds"
    },
    {
      "zC",
      function()
        require("fold-cycle").close_all()
      end,
      mode = "n",
      desc = "Close all folds"
    }
  }
}
