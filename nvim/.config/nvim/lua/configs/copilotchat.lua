local options = {
	context = "buffers",
	trusted_tools = true,
	sticky = {
		"#buffer:listed",
		"@copilot",
	},
	model = "gpt-5.6-terra",
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
