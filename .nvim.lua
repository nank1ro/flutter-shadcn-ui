require("flutter-tools").setup_project({
	{
		name = "Example",
		target = "lib/main.dart",
		cwd = "example",
	},
	{
		name = "Playground",
		target = "lib/main.dart",
		cwd = "playground",
		device = "chrome",
	},
})
