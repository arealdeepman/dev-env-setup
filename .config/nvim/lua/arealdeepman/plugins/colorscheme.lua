return {
	-- preferred color scheme
	{
		"joshdick/onedark.vim",
		lazy = false, -- make sure we load this during startup
		priority = 1000, -- setting high priority for theme
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme onedark]])
		end,
	},
}
