return {
	-- preferred color scheme
	{
    -- "One Dark Theme for Neo Vim"
		-- "joshdick/onedark.vim",

    -- Closest Copy of One Dark Pro for VSCode by Binaryify
    "olimorris/onedarkpro.nvim",
		lazy = false, -- make sure we load this during startup
		priority = 1000, -- setting high priority for theme
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme onedark]])
		end,
	},
}
