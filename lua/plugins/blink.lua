return {
  "saghen/blink.cmp",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  version = "*",
  opts = {
    completion = {
      menu = {
        border = "none",
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
    },

    keymap = {
      preset = "default",
      ["<C-y>"] = { "accept", "fallback" },
      ["<C-n>"] = { "select_next", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback" },
    },

    sources = {
      default = {
        "lsp",
        "snippets",
        "buffer",
      },

      providers = {
        lsp = {
          name = "LSP",
          module = "blink.cmp.sources.lsp",
          score_offset = 1000, -- authority
        },

        snippets = {
          name = "Snippets",
          module = "blink.cmp.sources.snippets",
          score_offset = 500,
        },

        buffer = {
          name = "Buffer",
          module = "blink.cmp.sources.buffer",
          score_offset = 0, -- desperate last resort
          min_keyword_length = 3,
        },
      },
    },
  },
}
