---@type LazySpec
return {

  -- == Add Neo-tree ==
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    lazy = false,
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
          visible = true,
        },
      },
    },
  },

  -- == Examples of Adding Plugins ==
  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = table.concat({
            "                  -.                                  .-",
            "              _..-'(                                   )`-.._",
            "           ./'. '||\\.      _ _ /| Bombaclat Arian!  .//||` .`\\.",
            "        ./'.|'.'||||\\|..   \\'o.O' /  ..|//||||`.`|.`\\.",
            "     ./'..|'.|| |||||\\``````=(___)=''''''/||||| ||.`|..`\\.",
            "   ./'.||'.|||| ||||||||||||.  U  .|||||||||||| ||||.`||.`\\.",
            "  /'|||'.|||||| |||||||||||||     ||||||||||||| ||||||.`|||`\\",
            " '.|||'.||||||| |||||||||||||     ||||||||||||| |||||||.`|||.`",
            "'.||| ||||||||| |/'   ``\\||``     ''||/''   `\\| ||||||||| |||.`",
            "|/' \\./'     `\\./         \\!|\\   /|!/         \\./'     `\\./ `\\|",
            "V    V         V          }' `\\ /' `{          V         V    V",
            "`    `         `               V               '         '    '",
          }, "\n"),
        },
      },
    },
  },

  -- Disable a default plugin
  { "max397574/better-escape.nvim", enabled = false },

  -- Custom LuaSnip config
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require("astronvim.plugins.configs.luasnip")(plugin, opts)
      local luasnip = require("luasnip")
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  -- Custom autopairs config
  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require("astronvim.plugins.configs.nvim-autopairs")(plugin, opts)
      local npairs = require("nvim-autopairs")
      local Rule = require("nvim-autopairs.rule")
      local cond = require("nvim-autopairs.conds")
      npairs.add_rules({
        Rule("$", "$", { "tex", "latex" })
          :with_pair(cond.not_after_regex "%%")
          :with_pair(cond.not_before_regex("xxx", 3))
          :with_move(cond.none())
          :with_del(cond.not_after_regex "xx")
          :with_cr(cond.none()),
      })
    end,
  },
}

