{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    nixvim.url = "github:nix-community/nixvim";
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = {
    self,
    nixpkgs,
    nixvim,
    flake-parts,
    fenix,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem = {
        pkgs,
        system,
        ...
      }: let
      overlays = [fenix.overlays.default];
      pkgs = import nixpkgs {
        inherit system;
        overlays = overlays;
      };
  mkdp_css =
    pkgs.writeText "markdown.css"
    ''
      /*
       * github like style
       * https://github.com/iamcco/markdown.css/blob/master/dest/github/markdown.css
       */

      :root {
          --color-text-primary: #333;
          --color-text-tertiary: #777;
          --color-text-link: #4078c0;
          --color-bg-primary: #fff;
          --color-bg-secondary: #fafbfc;
          --color-bg-tertiary: #f8f8f8;
          --color-border-primary: #ddd;
          --color-border-secondary: #eaecef;
          --color-border-tertiary: #d1d5da;
          --color-kbd-foreground: #444d56;
          --color-markdown-blockquote-border: #dfe2e5;
          --color-markdown-table-border: #dfe2e5;
          --color-markdown-table-tr-border: #c6cbd1;
          --color-markdown-code-bg: #1b1f230d;
      }
      [data-theme="dark"] {
          --color-text-primary: #c9d1d9;
          --color-text-tertiary: #8b949e;
          --color-text-link: #58a6ff;
          --color-bg-primary: #0d1117;
          --color-bg-secondary: #0d1117;
          --color-bg-tertiary: #161b22;
          --color-border-primary: #30363d;
          --color-border-secondary: #21262d;
          --color-border-tertiary: #6e7681;
          --color-kbd-foreground: #b1bac4;
          --color-markdown-blockquote-border: #3b434b;
          --color-markdown-table-border: #3b434b;
          --color-markdown-table-tr-border: #272c32;
          --color-markdown-code-bg: #f0f6fc26;
      }

      .markdown-body ol ol,
      .markdown-body ul ol,
      .markdown-body ol ul,
      .markdown-body ul ul,
      .markdown-body ol ul ol,
      .markdown-body ul ul ol,
      .markdown-body ol ul ul,
      .markdown-body ul ul ul {
        margin-top: 0;
        margin-bottom: 0;
      }
      .markdown-body {
        font-family: "Helvetica Neue", Helvetica, "Segoe UI", Arial, freesans, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
        font-size: 16px;
        color: var(--color-text-primary);
        line-height: 1.6;
        word-wrap: break-word;
        padding: 45px;
        background: var(--color-bg-primary);
        border: 1px solid var(--color-border-primary);
        -webkit-border-radius: 0 0 3px 3px;
        border-radius: 0 0 3px 3px;
      }
      .markdown-body > *:first-child {
        margin-top: 0 !important;
      }
      .markdown-body > *:last-child {
        margin-bottom: 0 !important;
      }
      .markdown-body .table-of-contents ol {
        list-style: none;
      }
      .markdown-body .table-of-contents > ol {
        padding-left: 0;
      }
      .markdown-body * {
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
      }
      .markdown-body h1,
      .markdown-body h2,
      .markdown-body h3,
      .markdown-body h4,
      .markdown-body h5,
      .markdown-body h6 {
        margin-top: 1em;
        margin-bottom: 16px;
        font-weight: bold;
        line-height: 1.4;
      }
      .markdown-body h1 .anchor,
      .markdown-body h2 .anchor,
      .markdown-body h3 .anchor,
      .markdown-body h4 .anchor,
      .markdown-body h5 .anchor,
      .markdown-body h6 .anchor {
        margin-left: -24px;
        visibility: hidden;
      }
      .markdown-body h1:hover .anchor,
      .markdown-body h2:hover .anchor,
      .markdown-body h3:hover .anchor,
      .markdown-body h4:hover .anchor,
      .markdown-body h5:hover .anchor,
      .markdown-body h6:hover .anchor {
        visibility: visible;
      }
      .markdown-body p,
      .markdown-body blockquote,
      .markdown-body ul,
      .markdown-body ol,
      .markdown-body dl,
      .markdown-body table,
      .markdown-body pre {
        margin-top: 0;
        margin-bottom: 16px;
      }
      .markdown-body h1 {
        margin: 0.67em 0;
        padding-bottom: 0.3em;
        font-size: 2.25em;
        line-height: 1.2;
        border-bottom: 1px solid var(--color-border-secondary);
      }
      .markdown-body h2 {
        padding-bottom: 0.3em;
        font-size: 1.75em;
        line-height: 1.225;
        border-bottom: 1px solid var(--color-border-secondary);
      }
      .markdown-body h3 {
        font-size: 1.5em;
        line-height: 1.43;
      }
      .markdown-body h4 {
        font-size: 1.25em;
      }
      .markdown-body h5 {
        font-size: 1em;
      }
      .markdown-body h6 {
        font-size: 1em;
        color: var(--color-text-tertiary);
      }
      .markdown-body hr {
        margin-top: 20px;
        margin-bottom: 20px;
        height: 0;
        border: 0;
        border-top: 1px solid var(--color-border-primary);
      }
      .markdown-body ol,
      .markdown-body ul {
        padding-left: 2em;
      }
      .markdown-body ol ol,
      .markdown-body ul ol {
        list-style-type: lower-alpha;
      }
      .markdown-body ol ul,
      .markdown-body ul ul {
        list-style-type: circle;
      }
      .markdown-body ol ul ul,
      .markdown-body ul ul ul {
        list-style-type: square;
      }
      .markdown-body ol ol ol,
      .markdown-body ul ol ol,
      .markdown-body ol ul ol,
      .markdown-body ul ul ol {
        list-style-type: lower-roman;
      }
      .markdown-body ol {
        list-style-type: decimal;
      }
      .markdown-body ul {
        list-style-type: disc;
      }
      .markdown-body dl {
        margin-bottom: 1.3em
      }
      .markdown-body dl dt {
        font-weight: 700;
      }
      .markdown-body dl dd {
        margin-left: 0;
      }
      .markdown-body dl dd p {
        margin-bottom: 0.8em;
      }
      .markdown-body blockquote {
        margin-left: 0;
        margin-right: 0;
        padding: 0 15px;
        color: var(--color-text-tertiary);
        border-left: 4px solid var(--color-markdown-blockquote-border);
      }
      .markdown-body table {
        display: block;
        width: 100%;
        overflow: auto;
        word-break: normal;
        word-break: keep-all;
        border-collapse: collapse;
        border-spacing: 0;
      }
      .markdown-body table tr {
        background-color: var(--color-bg-primary);
        border-top: 1px solid var(--color-markdown-table-tr-border);
      }
      .markdown-body table tr:nth-child(2n) {
        background-color: var(--color-bg-tertiary);
      }
      .markdown-body table th,
      .markdown-body table td {
        padding: 6px 13px;
        border: 1px solid var(--color-markdown-table-border);
        vertical-align: top;
      }
      .markdown-body kbd {
        display: inline-block;
        padding: 5px 6px;
        font: 14px SFMono-Regular,Consolas,Liberation Mono,Menlo,monospace;
        line-height: 10px;
        color: var(--color-kbd-foreground);
        vertical-align: middle;
        background-color: var(--color-bg-secondary);
        border: 1px solid var(--color-border-tertiary);
        border-radius: 3px;
        box-shadow: inset 0 -1px 0 var(--color-border-tertiary);
      }
      .markdown-body pre {
        word-wrap: normal;
        padding: 16px;
        overflow: auto;
        font-size: 85%;
        line-height: 1.45;
        background-color: var(--color-bg-tertiary);
        -webkit-border-radius: 3px;
        border-radius: 3px;
      }
      .markdown-body pre code {
        display: inline;
        max-width: initial;
        padding: 0;
        margin: 0;
        overflow: initial;
        font-size: 100%;
        line-height: inherit;
        word-wrap: normal;
        white-space: pre;
        border: 0;
        -webkit-border-radius: 3px;
        border-radius: 3px;
        background-color: transparent;
      }
      .markdown-body pre code:before,
      .markdown-body pre code:after {
        content: normal;
      }
      .markdown-body code {
        font-family: Consolas, "Liberation Mono", Menlo, Courier, monospace;
        padding: 0;
        padding-top: 0.2em;
        padding-bottom: 0.2em;
        margin: 0;
        font-size: 85%;
        background-color: var(--color-markdown-code-bg);
        -webkit-border-radius: 3px;
        border-radius: 3px;
      }
      .markdown-body code:before,
      .markdown-body code:after {
        letter-spacing: -0.2em;
        content: "\00a0";
      }
      .markdown-body a {
        color: var(--color-text-link);
        text-decoration: none;
        background: transparent;
      }
      .markdown-body img {
        max-width: 100%;
        max-height: 100%;
      }
      .markdown-body strong {
        font-weight: bold;
      }
      .markdown-body em {
        font-style: italic;
      }
      .markdown-body del {
        text-decoration: line-through;
      }
      .task-list-item {
        list-style-type: none;
      }
      .task-list-item input {
        font: 13px/1.4 Helvetica, arial, nimbussansl, liberationsans, freesans, clean, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
        margin: 0 0.35em 0.25em -1.6em;
        vertical-align: middle;
      }
      .task-list-item input[disabled] {
        cursor: default;
      }
      .task-list-item input[type="checkbox"] {
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        padding: 0;
      }
      .task-list-item input[type="radio"] {
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        padding: 0;
      }
    '';
    config = {
      viAlias = true;
      vimAlias = true;
            extraConfigVim = ''
            set noshowmode
            set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
            '';
      clipboard = {
        register = "unnamedplus";
        providers.wl-copy = {
          enable = true;
        };
      };
      opts = {
        number = true;
        relativenumber = true;
        expandtab = true;
        tabstop = 4;
        shiftwidth = 4;
        cursorline = true;
        signcolumn = "yes";
      };
      globals.mapleader = " ";
            keymaps = [
        {
          key = "<leader>ie";
          action = ":set list<CR>";
          options = {
            silent = true;
            desc = "Enable printing invisible chars";
          };
        }
        {
          key = "<leader>id";
          action = ":set nolist<CR>";
          options = {
            silent = true;
            desc = "Disable printing invisible chars";
          };
        }
        {
          key = "<leader>bc";
          action = ":BufferLinePick<CR>";
          options = {
            silent = true;
            desc = "Select buffer";
          };
        }
        {
          key = "<leader>bmn";
          action = ":BufferLineMoveNext<CR>";
          options = {
            silent = true;
            desc = "Move buffer to the right";
          };
        }
        {
          key = "<leader>bmp";
          action = ":BufferLineMovePrev<CR>";
          options = {
            silent = true;
            desc = "Move buffer to the left";
          };
        }
        {
          key = "<leader>bn";
          action = ":BufferLineCycleNext<CR>";
          options = {
            silent = true;
            desc = "Switch to the next buffer";
          };
        }
        {
          key = "<leader>bp";
          action = ":BufferLineCyclePrev<CR>";
          options = {
            silent = true;
            desc = "Switch to the last buffer";
          };
        }
        {
          key = "<leader>g";
          action = ":LazyGit<CR>";
          options = {
            silent = true;
            desc = "Open Lazygit";
          };
        }
        {
          key = "<leader>ld";
          action = ":Lspsaga goto_definition<CR>";
          options = {
            silent = true;
            desc = "Go to definition";
          };
        }
        {
          key = "<leader>ln";
          action = ":Lspsaga rename<CR>";
          options = {
            silent = true;
            desc = "Rename";
          };
        }
        {
          key = "<leader>lh";
          action = ":Lspsaga hover_doc<CR>";
          options = {
            silent = true;
            desc = "Hover docs";
          };
        }
        {
          key = "<leader>lf";
          action = ":Lspsaga finder<CR>";
          options = {
            silent = true;
            desc = "Finder";
          };
        }
        {
          key = "<leader>ca";
          action = ":Lspsaga code_action<CR>";
          options = {
            silent = true;
            desc = "Open code actions";
          };
        }
        {
          key = "<leader>oe";
          action = ":set conceallevel=2<CR>";
          options = {
            silent = true;
            desc = "Enable obsidian concealment";
          };
        }
        {
          key = "<leader>od";
          action = ":set conceallevel=0<CR>";
          options = {
            silent = true;
            desc = "Disable obsidian concealment";
          };
        }
        {
          key = "<leader>me";
          action = ":MarkdownPreview<CR>";
          options = {
            silent = true;
            desc = "Enable markdown preview";
          };
        }
        {
          key = "<leader>md";
          action = ":MarkdownPreviewStop<CR>";
          options = {
            silent = true;
            desc = "Disable markdown preview";
          };
        }
      ];
      colorschemes.catppuccin = {
        enable = true;
        settings = {
          color_overrides.frappe = {
            base = "#282c34";
          };
          flavour = "frappe";
          integrations = {
            cmp = true;
            gitsigns = true;
            nvimtree = true;
            treesitter = true;
          };
        };
      };
      plugins = {
        # Nix
        nix.enable = true;

        # UI
        lualine = {
          enable = true;
          globalstatus = true;
          theme = "onedark";
          componentSeparators = {
            left = "|";
            right = "|";
          };
          sectionSeparators = {
            left = "";
            right = "";
          };
        };

        # markdown
        obsidian = {
          enable = true;
          settings = {
            ui = {
              enable = true;
              checkboxes = {
                " " = {
                  char = "☐";
                  hl_group = "ObsidianTodo";
                };
                "x" = {
                  char = "☑";
                  hl_group = "ObsidianDone";
                };
                "~" = {
                  char = "☒";
                  hl_group = "ObsidianTilde";
                };
              };
              hl_groups = {
                ObsidianDone = {
                  bold = true;
                  fg = "#98c379";
                  # original: fg = "#89ddff";
                };
                ObsidianExtLinkIcon = {
                  fg = "#c792ea";
                };
                ObsidianHighlightText = {
                  bg = "#75662e";
                };
                ObsidianRefText = {
                  fg = "#c792ea";
                  underline = true;
                };
                ObsidianRightArrow = {
                  bold = true;
                  fg = "#f78c6c";
                };
                ObsidianTag = {
                  fg = "#89ddff";
                  italic = true;
                };
                ObsidianTilde = {
                  bold = true;
                  fg = "#ff5370";
                };
                ObsidianTodo = {
                  bold = true;
                  fg = "#f78c6c";
                };
              };
            };
            completion = {
              min_chars = 2;
            };
            workspaces = [
              {
                name = "Documents";
                path = "~/Documents/";
              }
            ];
            mappings = {
              "<leader>oc" = {
                action = "require(\"obsidian\").util.toggle_checkbox";
                opts = {
                  buffer = true;
                  desc = "Toggle checkbox";
                };
              };
              "<leader>ol" = {
                action = "require(\"obsidian\").util.gf_passthrough()";
                opts = {
                  buffer = true;
                  desc = "Follow obsidian link";
                };
              };
              "<CR>" = {
                action = "require(\"obsidian\").util.smart_action()";
                opts = {
                  silent = true;
                };
              };
            };
          };
        };
        markdown-preview = {
          enable = true;
          settings = {
            browser = "firefox";
            markdown_css = "${mkdp_css}";
          };
        };

        # bufferline
        bufferline.enable = true;

        # lsp
        lint = {
          lintersByFt = {
            rust = ["cargo clippy --fix --allow-dirty"];
            nix = ["alejandra ./*.nix"];
          };
        };
        autoclose = {
          enable = true;
          keys = {
            "(" = {
              escape = false;
              close = true;
              pair = "()";
            };
            "[" = {
              escape = false;
              close = true;
              pair = "[]";
            };
            "{" = {
              escape = false;
              close = true;
              pair = "{}";
            };
          };
        };
        cmp = {
          enable = true;
          settings = {
            sources = [
              {name = "nvim_lsp";}
              {name = "vsnip";}
              {name = "cmp-buffer";}
            ];
            mapping = {
              "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
              "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
              "<CR>" = "cmp.mapping.confirm({ select = true })";
              "<C-d>" = "cmp.mapping.scroll_docs(-4)";
              "<C-f>" = "cmp.mapping.scroll_docs(4)";
            };
          };
        };
        cmp-vsnip.enable = true;
        cmp-buffer.enable = true;
        cmp-nvim-lua.enable = true;
        cmp-nvim-lsp.enable = true;
        lsp = {
          enable = true;
          servers = {
            rust-analyzer = {
              enable = true;
              package = pkgs.rust-analyzer-nightly;
              installRustc = false;
              installCargo = false;
            };
            zls.enable = true;
            nixd.enable = true;
          };
        };
        lsp-format.enable = true;
        lspsaga = {
          enable = true;
          codeAction.keys.quit = ["q" "<Esc>"];
        };

        # which-key
        which-key = {
          enable = true;
          showHelp = true;
          showKeys = true;
        };

        # git
        lazygit.enable = true;
        gitsigns = {
          enable = true;
          settings = {
            signcolumn = true;
            signs = {
              add = {
                text = "│";
              };
              change = {
                text = "│";
              };
              changedelete = {
                text = "~";
              };
              delete = {
                text = "_";
              };
              topdelete = {
                text = "‾";
              };
              untracked = {
                text = "┆";
              };
            };
          };
        };

        # rust
        rust-tools.enable = true;
        bacon.enable = true;
        crates-nvim.enable = true;

        # treesitter
        treesitter-context.enable = true;
        treesitter-refactor = {
          enable = true;
          navigation.enable = true;
          smartRename.enable = true;
        };
        treesitter = {
          enable = true;
          nixGrammars = true;
          settings.indent.enable = true;
        };
      };
    };
        nixvimLib = nixvim.lib.${system};
        nvim = nixvim.legacyPackages.${system}.makeNixvimWithModule {
          inherit pkgs;
          module = config;
        };
      in {
        checks = {
          default = nixvimLib.check.mkTestDerivationFromNvim {
            inherit nvim;
            name = "A nixvim configuration";
          };
        };

        packages = {
          default = nvim;
        };

        devShells.default = pkgs.mkShellNoCC {
          shellHook = ''
            echo Welcome to a Neovim dev environment powered by Nixvim -- https://github.com/nix-community/nixvim
            PS1="[Nixvim @ \\w]: "
            alias vim='nvim'
            alias vi='nvim'
          '';
          packages = with pkgs; [
            nvim
          ];
        };
      };
    };
}
