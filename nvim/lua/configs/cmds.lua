vim.api.nvim_create_user_command("Source", "source $MYVIMRC", {})
vim.api.nvim_create_user_command("Config", "e $MYVIMRC", {})
vim.api.nvim_create_user_command(
	"Configs",
	"call ddu#start({'sources': [{'name': 'file_rec', 'params': {'path': expand('~/.config/nvim/configs')}}]})",
	{}
)
vim.api.nvim_create_user_command("Configs", 'call v:lua.Open("~/.config/nvim/lua/configs")', {})
vim.api.nvim_create_user_command("Plugs", 'call ConfigsRec("~/.config/nvim/plugs/")', {})
vim.api.nvim_create_user_command("Dein", 'call v:lua.Open("~/.config/nvim/dein.toml")', {})
vim.api.nvim_create_user_command("Lazy", 'call v:lua.Open("~/.config/nvim/dein_lazy.toml")', {})

vim.api.nvim_create_user_command("DeinInstall", "call dein#install()", {})
vim.api.nvim_create_user_command("DeinReCache", "call dein#recache_runtimepath()", {})
vim.api.nvim_create_user_command("DeinUpdate", "call dein#update()", {})
