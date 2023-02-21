--
-- Lualine configuration
--
require "user.plugins.lualine"
--
-- Disable autopairs
lvim.builtin.autopairs.active = false

--
-- Additional plugins
--
lvim.plugins = {
  --
  -- Motion: Hop
  --
  {
    "phaazon/hop.nvim",
    branch = "v2",
    event = "BufRead",
    config = function()
      require("user.plugins.hop").config()
    end,
  },
  --
  -- Diagnostics
  --
  {
    "folke/trouble.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("user.plugins.trouble").config()
    end,
    event = "BufWinEnter",
    cmd = "TroubleToggle",
  },
  --
  -- The Primeagen: Harpoon
  {
    "ThePrimeagen/harpoon",
    config = function()
      require("user.plugins.harpoon").config()
    end,
    event = "BufWinEnter",
    requires = { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim" },
  },
  --
  -- Themes
  --
  {
    "andersevenrud/nordic.nvim",
    config = function()
      require("user.themes.nordic").config()
    end,
    conditions = function()
      return lvim.colorscheme == "nordic"
    end,
  },
  {
    "Hoffs/omnisharp-extended-lsp.nvim",
  },
  {
    "PasiBergman/cmp-nuget",
    event = "BufWinEnter",
    config = function()
      local cmp_nuget = require "cmp-nuget"
      cmp_nuget.setup {}
      -- Insert 'nuget' source before 'buffer'
      table.insert(lvim.builtin.cmp.sources, 6, {
        name = "nuget",
        keyword_length = 0,
      })
      lvim.builtin.cmp.formatting.source_names["nuget"] = "[NuGet]"
    end,
  },
  {
    "David-Kunz/cmp-npm",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local cmp_npm = require "cmp-npm"
      cmp_npm.setup {}
      -- Insert 'npm' source before 'buffer'
      table.insert(lvim.builtin.cmp.sources, 7, {
        name = "npm",
        keyword_length = 3,
      })
      lvim.builtin.cmp.formatting.source_names["npm"] = "[NPM]"
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("user.plugins.todo-comments").config()
    end,
  },
  {
    "jlcrochet/vim-razor",
  },

  --
  -- Github Copilot
  --[[
  {
    "github/copilot.vim",
    config = function()
      require("user.plugins.copilot").config_vim()
    end,
  },
  --]]
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "VimEnter",
    config = function()
      vim.defer_fn(function()
        require("user.plugins.copilot").config_lua()
      end, 100)
    end,
  },
  --
  -- LSP Overloads Nvim
  -- Native LSP signatureHelper handler doesn't provide an easy way to view all
  -- the possible overloads and parameter details for signatures

  -- See lua/users/lsp/init.lua for configuration
  {
    event = "BufRead",
    "Issafalcon/lsp-overloads.nvim",
  },
  --
  -- fidget.nvim: Standalone UI for nvim-lsp progress.
  --
  {
    "j-hui/fidget.nvim",
    event = "BufRead",
    config = function()
      require("fidget").setup {}
    end,
  },
  --
  -- Undotree
  --
  {
    "mbbill/undotree",
    event = "BufRead",
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end,
  },
  --
  -- EditorConfig support
  --
  {
    "gpanders/editorconfig.nvim",
    event = "BufRead",
    --[[
    config = function()
      -- Custom properties can be added through the properties table:
      require('editorconfig').properties.foo = function(bufnr, val)
        vim.b[bufnr].foo = val
      end
    end,
    --]]
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup {
        enabled = true, -- enable this plugin (the default)
        enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
        highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
        highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
        show_stop_reason = true, -- show stop reason when stopped for exceptions
        commented = false, -- prefix virtual text with comment string
        only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
        all_references = false, -- show virtual text on all all references of the variable (not only definitions)
        --- A callback that determines how a variable is displayed or whether it should be omitted
        --- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
        --- @param buf number
        --- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
        --- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
        --- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
        display_callback = function(variable, _buf, _stackframe, _node)
          return variable.name .. " = " .. variable.value
        end,

        -- experimental features:
        virt_text_pos = "eol", -- position of virtual text, see `:h nvim_buf_set_extmark()`
        all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
        virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
        virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column) ,
        -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
      }
    end,
  },
}
