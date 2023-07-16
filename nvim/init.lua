if vim.loader then
	vim.loader.enable()
end
-- vim.g.loaded_luv = true

-- dein.vim loading script
-- {{{
local dein_dir = vim.env.HOME .. "/.cache/dein"
local dein_repo_dir = dein_dir .. "/repos/github.com/Shougo/dein.vim"

if not string.match(vim.o.runtimepath, "/dein.vim") then
	if vim.fn.isdirectory(dein_repo_dir) ~= 1 then
		os.execute("git clone https://github.com/Shougo/dein.vim " .. dein_repo_dir)
	end
	vim.o.runtimepath = dein_repo_dir .. "," .. vim.o.runtimepath
end

if vim.call("dein#load_state", dein_dir) == 1 then
	local dein_toml_dir = vim.env.HOME .. "/.config/nvim/"

	local dein_toml = dein_toml_dir .. "dein.toml"
	local dein_toml_lazy = dein_toml_dir .. "dein_lazy.toml"

	vim.call("dein#begin", dein_dir)
	vim.call("dein#load_toml", dein_toml, { lazy = 0 })
	-- vim.call("dein#load_toml", dein_toml_lazy, { lazy = 1 })
	-- vim.call("dein#load_toml", dein_toml_dir .. "ddu.toml", { lazy = 1 })
	-- vim.call("dein#load_toml", dein_toml_dir .. "ft.toml", { lazy = 1 })

	vim.call("dein#end")
	vim.call("dein#save_state")
end
-- }}}

require("configs/cmds")
require("configs/keybind")

-- base
vim.scriptencoding = "utf-8"
vim.wo.number = true

vim.opt.cursorline = true
-- vim.g.gruvbox_material_transparent_background = 1

-- vim.cmd.colorscheme("everforest")
-- vim.cmd.colorscheme("gruvbox")
-- vim.cmd.colorscheme("habamax")
-- vim.cmd.colorscheme("torte")

vim.opt.termguicolors = true

-- vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

vim.cmd("let g:python3_host_prog = '/usr/sbin/python3'")


vim.cmd([[
" au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex,*.heex,*.leex,*.sface,*.lexs set filetype=eelixir
au BufRead,BufNewFile mix.lock set filetype=elixir
au BufRead,FileType  *.go set wrap
au BufRead,FileType  *.lark set filetype=lark
au BufRead,FileType  *.er set filetype=erg
au BufRead,FileType  *.li set filetype=cotowali
au BufRead,FileType  *.v set filetype=v

au FileType vue syntax sync fromstart
autocmd TermOpen * setlocal norelativenumber
autocmd TermOpen * setlocal nonumber
]])

vim.cmd('set nofoldenable')
-- vim.cmd("set winblend=30")


local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

nvim_lsp.tsserver.setup {
	filetypes = {
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"javascript",
		"javascriptreact",
		"javascript.jsx",
	},
	cmd = { "typescript-language-server", "--stdio" }
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.html.setup {
	capabilities = capabilities,
	filetypes = { "html" },
	cmd = { "vscode-html-language-server", "--stdio" },
	init_options = {
		configurationSection = { "html", "css", "javascript" },
		embeddedLanguages = {
			css = true,
			javascript = true
		},
		provideFormat = true
	},
	single_file_support = true
}

