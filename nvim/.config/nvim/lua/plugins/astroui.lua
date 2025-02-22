-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    -- colorscheme = "catppuccin",
    colorscheme = "rose-pine",
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = {
      init = { -- this table overrides highlights in all themes
        -- Normal = { bg = "#000000" },
      },
      astrodark = { -- a table of overrides/changes when applying the astrotheme theme
        -- Normal = { bg = "#000000" },
      },
    },
    -- Icons can be configured throughout the interface
    icons = {
      -- configure the loading of the lsp in the status line
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
    },
  },

  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      icons = {
        ActiveLSP = "",
        ActiveTS = "",
        ArrowLeft = "",
        ArrowRight = "",
        BufferClose = "󰅖",
        DapBreakpoint = "",
        DapBreakpointCondition = "",
        DapBreakpointRejected = "",
        DapLogPoint = ".>",
        DapStopped = "󰁕",
        DefaultFile = "󰈙",
        Diagnostic = "󰒡",
        DiagnosticError = "",
        DiagnosticHint = "󰌵",
        DiagnosticInfo = "󰋼",
        DiagnosticWarn = "",
        Ellipsis = "…",
        FileModified = "",
        FileReadOnly = "",
        FoldClosed = "",
        FoldOpened = "",
        FoldSeparator = " ",
        FolderClosed = "",
        FolderEmpty = "",
        FolderOpen = "",
        Git = "󰊢",
        GitAdd = "",
        GitBranch = "",
        GitChange = "",
        GitConflict = "",
        GitDelete = "",
        GitIgnored = "◌",
        GitRenamed = "➜",
        GitStaged = "✓",
        GitUnstaged = "✗",
        GitUntracked = "★",
        LSPLoaded = "",
        LSPLoading1 = "",
        LSPLoading2 = "󰀚",
        LSPLoading3 = "",
        MacroRecording = "",
        Paste = "󰅌",
        Search = "",
        Selected = "❯",
        Spellcheck = "󰓆",
        TabClose = "󰅙",
      },
    },
  },

  {
    {
      "AstroNvim/astroui",
      ---@type AstroUIOpts
      opts = {
        icons = {
          ActiveLSP = "",
          ActiveTS = " ",
          BufferClose = "",
          DapBreakpoint = "",
          DapBreakpointCondition = "",
          DapBreakpointRejected = "",
          DapLogPoint = "",
          DapStopped = "",
          DefaultFile = "",
          Diagnostic = "",
          DiagnosticError = "",
          DiagnosticHint = "",
          DiagnosticInfo = "",
          DiagnosticWarn = "",
          Ellipsis = "",
          FileModified = "",
          FileReadOnly = "",
          FoldClosed = "",
          FoldOpened = "",
          FolderClosed = "",
          FolderEmpty = "",
          FolderOpen = "",
          Git = "",
          GitAdd = "",
          GitBranch = "",
          GitChange = "",
          GitConflict = "",
          GitDelete = "",
          GitIgnored = "",
          GitRenamed = "",
          GitStaged = "",
          GitUnstaged = "",
          GitUntracked = "",
          LSPLoaded = "",
          LSPLoading1 = "",
          LSPLoading2 = "",
          LSPLoading3 = "",
          MacroRecording = "",
          Paste = "",
          Search = "",
          Selected = "",
          TabClose = "",
        },
      },
    },
    {
      "onsails/lspkind.nvim",
      opts = function(_, opts)
        -- use codicons preset
        opts.preset = "codicons"
        opts.mode = "symbol_text"
        -- set some missing symbol types
        opts.symbol_map = {
          Array = "",
          Boolean = "",
          Key = "",
          Namespace = "",
          Null = "",
          Number = "",
          Object = "",
          Package = "",
          String = "",
        }
      end,
    },
  },
}
