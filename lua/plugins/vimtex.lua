local plugin = {
	{
		"lervag/vimtex",
		lazy = false,
		init = function()
			-- Use init for configuration, don't use the more common "config".
			vim.cmd([[
        filetype plugin indent on
        syntax enable
      ]])

			-- " This enables Vim's and neovim's syntax-related features. Without this, some
			-- " VimTeX features will not work (see ":help vimtex-requirements" for more
			-- " info).
			--
			-- " Viewer options: One may configure the viewer either by specifying a built-in
			-- " viewer method:
			-- vim.g.vimtex_view_method = "SumatraPDF"

			-- " Or with a generic interface:
			vim.g.vimtex_view_general_viewer = "SumatraPDF"
			vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
			vim.g.vimtex_view_general_options_latexmk = "-reuse-instance"

			--  VimTeX uses latexmk as the default compiler backend. If you use it, which is
			--  strongly recommended, you probably don't need to configure anything. If you
			-- " want another compiler backend, you can change it as follows. The list of
			-- " supported backends and further explanation is provided in the documentation,
			-- " see ":help vimtex-compiler".
			vim.g.vimtex_compiler_method = "latexmk"
			-- -synctex=1 -interaction=nonstopmode -file-line-error -pdf -outdir=%OUTDIR% %DOC%"

			-- " Most VimTeX mappings rely on localleader and this can be changed with the
			-- " following line. The default is usually fine and is the symbol "\".
			-- vim.g.maplocalleader = ","
		end,
	},
}

return plugin
