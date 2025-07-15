return {
  "zk-org/zk-nvim",
  ft = "md",
  opts = {
    picker = "fzf_lua",
  },
  keys = {
    {"<leader>fn", "<cmd>:ZkNotes<cr>", desc = "Find Notes" },

    {"<leader>nb", "<cmd>ZkBacklinks<cr>", desc = "Backlinks to Note" },
    {"<leader>nc", "<cmd>'<'>ZkNewFromContentlection<cr>", mode="x", desc = "New Note with Selected Content" },
    {"<leader>ni", "<cmd>ZkIndex<cr>", desc = "Index Notebook" },
    {"<leader>nl", "<cmd>ZkInsertLink<cr>", desc = "Insert Link" },
    {"<leader>nl", "<cmd>'<'>ZkInsertLinkAtSelection<cr>", mode="x", desc = "Insert Link at Selection" },
    {"<leader>nn", "<cmd>ZkNew<cr>", desc = "New Note" },
    {"<leader>nn", "<cmd>'<'>ZkNewFromTitleSelection<cr>", mode="x", desc = "New Note with Selected Title" },
    {"<leader>no", "<cmd>ZkLinks<cr>", desc = "Outlinks from Note" },
    {"<leader>nr", '<cmd>ZkNotes { createdAfter = "two weeks ago" }<cr>', desc = "Recent Notes" },
    {"<leader>nt", "<cmd>ZkTags<cr>", desc = "Notes by Tag" },
  },

  config = function(opts)
    require('zk').setup(opts)
  end,

  dependencies = {
    "neovim/nvim-lspconfig",
  }
}
