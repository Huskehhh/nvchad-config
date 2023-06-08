local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

opt.relativenumber = true
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/vim/undodir"
opt.undofile = true

-- Highlight on yank.
autocmd("TextYankPost", {
    desc = "highlight on yank",
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = "200" })
    end,
})
