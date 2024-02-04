return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			telescope.setup({
				defaults = {
					initial_mode = "normal",
                    mappings = {
                        n = {
                            ["<C-d>"] = actions.delete_buffer
                        }
                    }
				},
				pickers = {
					buffers = {
						initial_mode = "normal",
					},
					find_files = {
						find_command = { "rg", "--files", "--hidden", "-g", "!.git", "-g", "!.local" },
                        mappings = {
                            i = {
                                ["<CR>"] = actions.select_default + actions.center,
                            },
                            n = {
                                ["<CR>"] = actions.select_default + actions.center,
                            },
                        },
					},
				},
			})

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>p", function()
				builtin.find_files({ cwd = vim.fn.expand("%:p:h") })
			end, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>b", builtin.buffers, {})
			vim.keymap.set("n", "<leader>fb", function()
				builtin.live_grep({ search_dirs = { vim.fn.expand("%:p") } })
			end, {})
			vim.keymap.set("n", "<leader>fB", function()
				builtin.live_grep({ grep_open_files = true })
			end, {})
			vim.keymap.set("n", "<leader>l", builtin.treesitter, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				extensions = {
					file_browser = {
						hijack_netrw = true,
					},
				},
			})
			require("telescope").load_extension("file_browser")
			vim.api.nvim_set_keymap(
				"n",
				"<leader>o",
				":Telescope file_browser path=%:p:h select_buffer=true<CR>",
				{ noremap = true }
			)
		end,
	},
	config = function()
		vim.api.nvim_set_keymap("n", "<leader>r", ":Telescope commands<CR>", { noremap = true })
	end,
}
