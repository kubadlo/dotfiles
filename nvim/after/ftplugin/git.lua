-- mini.diff based folding
vim.wo.foldexpr   = "v:lua.MiniGit.diff_foldexpr()"
vim.wo.foldmethod = "expr"

-- Start with all folds open
vim.wo.foldlevel  = 3
