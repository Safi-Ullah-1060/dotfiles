return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  event = "BufReadPost",
  config = function()
    require('nvim-treesitter-textobjects').setup {
      select = { lookahead = true },
      move = { set_jumps = true },
    }

    local select = require("nvim-treesitter-textobjects.select")
    local move = require("nvim-treesitter-textobjects.move")
    local swap = require("nvim-treesitter-textobjects.swap")

    -- select keymaps
    local select_keymaps = {
      ["a="] = "@assignment.outer",
      ["i="] = "@assignment.inner",
      ["l="] = "@assignment.lhs",
      ["r="] = "@assignment.rhs",
      ["a:"] = "@property.outer",
      ["i:"] = "@property.inner",
      ["l:"] = "@property.lhs",
      ["r:"] = "@property.rhs",
      ["aa"] = "@parameter.outer",
      ["ia"] = "@parameter.inner",
      ["ai"] = "@conditional.outer",
      ["ii"] = "@conditional.inner",
      ["al"] = "@loop.outer",
      ["il"] = "@loop.inner",
      ["af"] = "@call.outer",
      ["if"] = "@call.inner",
      ["am"] = "@function.outer",
      ["im"] = "@function.inner",
      ["ac"] = "@class.outer",
      ["ic"] = "@class.inner",
    }

    for key, query in pairs(select_keymaps) do
      vim.keymap.set({ "x", "o" }, key, function()
        select.select_textobject(query, "textobjects")
      end, { desc = "Select " .. query })
    end

    -- move keymaps
    local move_keymaps = {
      next_start = { ["]f"] = "@call.outer", ["]m"] = "@function.outer", ["]c"] = "@class.outer", ["]i"] = "@conditional.outer", ["]l"] = "@loop.outer" },
      next_end   = { ["]F"] = "@call.outer", ["]M"] = "@function.outer", ["]C"] = "@class.outer", ["]I"] = "@conditional.outer", ["]L"] = "@loop.outer" },
      prev_start = { ["[f"] = "@call.outer", ["[m"] = "@function.outer", ["[c"] = "@class.outer", ["[i"] = "@conditional.outer", ["[l"] = "@loop.outer" },
      prev_end   = { ["[F"] = "@call.outer", ["[M"] = "@function.outer", ["[C"] = "@class.outer", ["[I"] = "@conditional.outer", ["[L"] = "@loop.outer" },
    }

    for key, query in pairs(move_keymaps.next_start) do
      vim.keymap.set("n", key, function() move.goto_next_start(query, "textobjects") end)
    end
    for key, query in pairs(move_keymaps.next_end) do
      vim.keymap.set("n", key, function() move.goto_next_end(query, "textobjects") end)
    end
    for key, query in pairs(move_keymaps.prev_start) do
      vim.keymap.set("n", key, function() move.goto_previous_start(query, "textobjects") end)
    end
    for key, query in pairs(move_keymaps.prev_end) do
      vim.keymap.set("n", key, function() move.goto_previous_end(query, "textobjects") end)
    end

    -- swap keymaps
    vim.keymap.set("n", "<leader>na", function() swap.swap_next("@parameter.inner", "textobjects") end)
    vim.keymap.set("n", "<leader>n:", function() swap.swap_next("@property.outer", "textobjects") end)
    vim.keymap.set("n", "<leader>nm", function() swap.swap_next("@function.outer", "textobjects") end)
    vim.keymap.set("n", "<leader>pa", function() swap.swap_previous("@parameter.inner", "textobjects") end)
    vim.keymap.set("n", "<leader>p:", function() swap.swap_previous("@property.outer", "textobjects") end)
    vim.keymap.set("n", "<leader>pm", function() swap.swap_previous("@function.outer", "textobjects") end)

    -- repeatable move
    local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")
    vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
    vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)
    vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
    vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
    vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
    vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
  end,
}
