local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "Catppuccin/nvim", name = "catppuccin" },
    { "Everblush/nvim", nome = "everblush" },
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl" },
	{ "rose-pine/neovim", name = "rose-pine" },
	"nvim-treesitter/nvim-treesitter",
	"windwp/nvim-autopairs",
	"nvim-tree/nvim-web-devicons",
	"nvim-lua/plenary.nvim",
	"norcalli/nvim-colorizer.lua",
	"nvim-lualine/lualine.nvim",
	"nvim-telescope/telescope.nvim",
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	"stevearc/oil.nvim",
    "baskerville/vim-sxhkdrc",
    "stevearc/dressing.nvim",
    "rcarriga/nvim-notify",
    "numToStr/Comment.nvim",
    "gelguy/wilder.nvim",
    "michaelb/sniprun",
    "tadmccorkle/markdown.nvim",
    "tpope/vim-surround",
    "lervag/vimtex",

	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/nvim-cmp",
	"saadparwaiz1/cmp_luasnip",
	"L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
    "f3fora/cmp-spell",
    "onsails/lspkind.nvim",
    "hrsh7th/cmp-cmdline",
    "iurimateus/luasnip-latex-snippets.nvim",
})


-- Settings --
local set = vim.o

set.relativenumber = true
set.number = true
set.shiftwidth = 4
set.tabstop = 4
set.expandtab = true
set.t_Co = 256
set.termguicolors = true
set.history = 1000
set.enconding = "UTF-8"
set.splitright = true
set.splitbelow = true
set.shell = "zsh"
set.scrolloff = true
set.laststatus = 2
set.conceallevel = 3
set.background = "dark"
set.noswapfile = true
set.signcolumn = "yes"
set.concealcursor = "nv"

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "tex" },
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.spelllang = 'en_us,ms' 
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
    end,
})

vim.cmd.colorscheme("rose-pine")
vim.cmd([[ set mouse+=a ]])
vim.cmd([[ set nowrap ]])
vim.cmd([[ set noshowmode ]])
-- vim.cmd([[ set statusline=\ %f\ %=\ %l\:\%L\ ]])
vim.cmd([[ filetype plugin on ]])
vim.cmd([[ set nocompatible ]])
vim.cmd([[ set clipboard+=unnamedplus]])
vim.cmd([[ syntax on ]])
vim.cmd([[ hi NonText guifg=bg]])
vim.cmd([[ hi BufferLineFill guibg=#1f1d2e]])

local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
for type, icon in pairs(signs) do 
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local keymap = vim.keymap
vim.g.mapleader = "`"

keymap.set("n", "nn", ":set norelativenumber nonumber <CR>")
keymap.set("n", "sn", ":set relativenumber number <CR>")
keymap.set("n", "snh", ":set nohls <CR>")
keymap.set("n", "sl", ":set spell <CR>")
keymap.set("n", "snl", ":set nospell <CR>")

keymap.set("n", "ss", ":split <CR>", { silent = true })
keymap.set("n", "sv", ":vsplit <CR>", { silent = true })
keymap.set("n", "wh", "<C-w>h")
keymap.set("n", "wk", "<C-w>k")
keymap.set("n", "wj", "<C-w>j")
keymap.set("n", "wl", "<C-w>l")

keymap.set({ "n", "v" }, "gj", "<S-g>")
keymap.set({ "n", "v" }, "gk", "gg")

keymap.set("v", "<leader>c", '"+y')
keymap.set("n", "<leader>v", '"+p')

-- Telescope.nvim --
local builtin = require("telescope.builtin")
keymap.set("n", "<leader>f", builtin.find_files, { silent = true })

-- oil.nvim --
keymap.set("n", "<leader>o", "<CMD>Oil --float<CR>")

-- sniprun --
keymap.set("v", "<leader>r", ":SnipRun <CR>", { silent = true })

-- Plugins Configuration --
require("catppuccin").setup({
	styles = "mocha",
	transparent_background = true,
	term_colors = true,
	indent_blankline = {
		enabled = true,
		colored_indent_levels = false,
	},
})

require("rose-pine").setup({
	variant = "main",
	dark_variant = "main",
	extend_background_behind_borders = true,

	enable = {
		terminal = true,
	},
    styles = { transparency = true }
})

require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"cpp",
		"lua",
		"bash",
		"markdown",
        "markdown_inline",
		"html",
		"css",
		"json",
		"yaml",
		"toml",
		"ruby",
        "latex",
	},
	sync_install = true,
	highlight = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extented_mode = true,
	},
})

require("nvim-web-devicons").setup()

require("colorizer").setup({
	"css",
	"dosini",
	"yaml",
	"json",
	"toml",
	"html",
	"scss",
})

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		section_separators = { left = "", right = " " },
		component_separators = { left = "", right = "|" },
	},
})

require("telescope").setup({
	defaults = {
		prompt_prefix = "   ",
		layout_config = {
			preview_width = 0.5,
		},
	},
})

require("ibl").setup({
	scope = {
		show_start = false,
		show_end = false,
	},
})

local cmp = require("cmp")
local luasnip = require("luasnip")
set.pumheight = 16 -- maximum column when menu cmp popup
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- local default_capabilities = require("cmp_nvim_lsp").default_capabilities()
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            local kind = require("lspkind").cmp_format({ 
                mode = "symbol_text",
                maxwidth = 50,
                menu = {
                    nvim_lsp = "[LSP]",
                    luasnip = "[Snip]",
                    buffer = "[Buffer]",
                    path = "[Path]",
                }
            })(entry, vim_item)
            local strings = vim.split(kind.kind, "%s", { trimempty = true })
            kind.kind = " " .. (strings[1] or "") .. " " -- strings[1] => icons appearance on the left
            kind.menu = string.format("     (%s) %s", (strings[2] or ""), kind.menu) -- strings[2] => menu such as text, fuction, etc AND kind.menu => check line 216

            return kind
        end,
	},
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
	mapping = cmp.mapping.preset.insert({
		["ESC"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-k>"] = cmp.mapping.scroll_docs(-4),
        ["<C-j>"] = cmp.mapping.scroll_docs(4),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then 
                luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then 
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else 
                fallback()
            end
        end, {"i", "s"}),
	}),
	sources = require("cmp").config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip", max_item_count = 3 },
        { name = "buffer", max_item_count = 5 },
       	{ name = "path", max_item_count = 5 },
	}), 
	experimental = {
		ghost_text = true, 
	},
})

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "clangd", "pyright", "texlab" },
	automatic_installation = true,
})

require("null-ls").setup({
	sources = {
		require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.diagnostics.standardrb,
	},
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
local default_capabilities = require("cmp_nvim_lsp").default_capabilities()

local lang_server = { "clangd", "pyright", "texlab" }
require("lspconfig").clangd.setup({
    capabilities = default_capabilities
})
require("lspconfig").pyright.setup({
    capabilities = default_capabilities
})
require("lspconfig").texlab.setup({
    capabilities = default_capabilities
})
--[[
require("lspconfig").standardrb.setup({
    capabilities = default_capabilities
})
require("lspconfig").lua_ls.setup({
    capabilities = default_capabilities
})
]]--

-- require("luasnip.loaders.from_vscode").lazy_load()

require("nvim-autopairs").setup()
cmp.event:on('confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done())

local wilder = require("wilder")
wilder.setup({
    modes = { ":", "/" }
})

wilder.set_option('renderer', wilder.popupmenu_renderer(
    wilder.popupmenu_border_theme({ 
        border = 'rounded',
        min_width = '100%',
        min_height = '30%',
        max_height = '30%',
        pumblend = 0,
        highlights = {
            accent = wilder.make_hl("WilderHighlight", { { a = 1 }, { a = 1}, { foreground = "#F6C177" }})
        },
        highlighter = wilder.basic_highlighter(),
        left = {' ', wilder.popupmenu_devicons()},
        right = {' ', wilder.popupmenu_scrollbar()},
    })
))

local text_highlight = wilder.make_hl("WilderText", { { a = 1 }, { a = 1}, { foreground = "#c4a7e7" }})
wilder.set_option("pipeline", {
    wilder.branch(
        wilder.cmdline_pipeline({
            fuzzy = 1
        }),
        wilder.vim_search_pipeline({
            fuzzy = 1
        })
    )
})

require("oil").setup({
	default_file_explorer = true,
	win_options = {
		number = true,
		relativenumber = false,
	},
	float = {
		padding = 3,
		max_height = 24,
		border = "rounded",

		overide = function(conf)
			return conf
		end,
	},
	keymaps = {
		["<CR>"] = "actions.select",
		["<ESC>"] = "actions.close",
		["."] = "actions.toggle_hidden",
		["r"] = "actions.refresh",
		["ss"] = "actions.select_split",
		["sv"] = "actions.select_vsplit",
		["?"] = "actions.show_help",
	},
	use_default_keymaps = false,
})

require("dressing").setup()

local notify = require("notify")
require('notify').setup({
    fps = 32,
    render = "default", 
    stages = "slide",
    max_width = 50,
})

local notify = require("notify")
local filtered_message = { "No information available" }
vim.notify = function(message, level, opts)
    for _, msg in ipairs(filtered_message) do
      if message == msg then
        return
      end
    end
    return notify(message, level, merged_opts)
end

require("Comment").setup()
require('sniprun').setup({
    display = { "Classic" }
})

require("markdown").setup()

vim.g.vimtex_view_method = "zathura"
-- vim.g.vimtex_compiler_method = "latexrun"
vim.g.vimtex_syntax_enabled = 0
vim.g.maplocalleader = "`"

require("luasnip-latex-snippets").setup()
require("luasnip").config.setup { enable_autosnippets = true }
