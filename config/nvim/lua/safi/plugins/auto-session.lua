return {
  "rmagatti/auto-session",
  config = function()
    local harpoon = require("harpoon")
    local auto_session = require("auto-session")

    auto_session.setup({
      auto_save = true,
      auto_restore_enabled = false,
      auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
    })
    -- Save harpoon before session is written
    vim.api.nvim_create_autocmd("User", {
      pattern = "AutoSession save", -- check exact event name below
      callback = function()
        harpoon:sync()              -- flushes in-memory list to harpoon.json
      end,
    })

    -- Load harpoon after session is restored
    vim.api.nvim_create_autocmd("User", {
      pattern = "AutoSession restore",
      callback = function()
        harpoon:sync() -- re-reads harpoon.json for the cwd
      end,
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>wr", "<cmd>AutoSession restore<CR>", { desc = "Restore session for cwd" })             -- restore last workspace session for current directory
    keymap.set("n", "<leader>ws", "<cmd>AutoSession save<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory
  end,
}
