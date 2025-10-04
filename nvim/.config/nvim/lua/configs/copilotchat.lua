local options = {
	context = "buffers",
	model = "claude-sonnet-4",
	window = {
		layout = "vertical",
		relative = "cursor",
	},
	mappings = {
		show_diff = {
			normal = "sd",
		},
	},
}

return options
