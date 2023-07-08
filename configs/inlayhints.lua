local config = {
	inlay_hints = {
		parameter_hints = {
			show = true,
			prefix = "<- ",
			separator = ", ",
			remove_colon_start = false,
			remove_colon_end = true,
		},
		type_hints = {
			show = true,
			prefix = "",
			separator = ", ",
			remove_colon_start = false,
			remove_colon_end = false,
		},
		only_current_line = false,
		labels_separator = "  ",
		max_len_align = false,
		max_len_align_padding = 1,
		highlight = "Comment",
		priority = 0,
	},
	enabled_at_startup = true,
	debug_mode = false,
}

require("lsp-inlayhints").setup(config)
