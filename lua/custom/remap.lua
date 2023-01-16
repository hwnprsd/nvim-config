vim.keymap.set('n', '<leader>-', ":Neotree toggle<CR>") -- Neo Tree Toggle

local maps = { n = {}, a = {} }


if UTILS.is_available "smart-splits.nvim" then
  -- Better window navigation
  maps.a["<C-h>"] = { function() require("smart-splits").move_cursor_left() end, desc = "Move to left split" }
  maps.a["<C-j>"] = { function() require("smart-splits").move_cursor_down() end, desc = "Move to below split" }
  maps.a["<C-k>"] = { function() require("smart-splits").move_cursor_up() end, desc = "Move to above split" }
  maps.a["<C-l>"] = { function() require("smart-splits").move_cursor_right() end, desc = "Move to right split" }

  -- Resize with arrows
  maps.n["<C-Up>"] = { function() require("smart-splits").resize_up() end, desc = "Resize split up" }
  maps.n["<C-Down>"] = { function() require("smart-splits").resize_down() end, desc = "Resize split down" }
  maps.n["<C-Left>"] = { function() require("smart-splits").resize_left() end, desc = "Resize split left" }
  maps.n["<C-Right>"] = { function() require("smart-splits").resize_right() end, desc = "Resize split right" }
else
  maps.a["<C-h>"] = { "<C-w>h", desc = "Move to left split" }
  maps.a["<C-j>"] = { "<C-w>j", desc = "Move to below split" }
  maps.a["<C-k>"] = { "<C-w>k", desc = "Move to above split" }
  maps.a["<C-l>"] = { "<C-w>l", desc = "Move to right split" }
  maps.a["<C-Up>"] = { "<cmd>resize -2<CR>", desc = "Resize split up" }
  maps.a["<C-Down>"] = { "<cmd>resize +2<CR>", desc = "Resize split down" }
  maps.a["<C-Left>"] = { "<cmd>vertical resize -2<CR>", desc = "Resize split left" }
  maps.a["<C-Right>"] = { "<cmd>vertical resize +2<CR>", desc = "Resize split right" }
end


for mode, map in pairs(maps) do
  -- iterate over each keybinding set in the current mode
  for keymap, options in pairs(map) do
    -- build the options for the command accordingly
    if options then
      local cmd = options
      local keymap_opts = base or {}
      if type(options) == "table" then
        cmd = options[1]
        keymap_opts = vim.tbl_deep_extend("force", options, keymap_opts)
        keymap_opts[1] = nil
      end
      if mode == "a" then -- Set things for all modes
        vim.keymap.set("n", keymap, cmd, keymap_opts)
        vim.keymap.set("i", keymap, cmd, keymap_opts)
        vim.keymap.set("v", keymap, cmd, keymap_opts)
      else -- Set things only for the specified mode
        -- extend the keybinding options with the base provided and set the mapping
        vim.keymap.set(mode, keymap, cmd, keymap_opts)
      end
    end
  end
end
