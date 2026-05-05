local Git = {}

---Toggle diff overlay in the current buffer
Git.toggle_diff = function()
    MiniDiff.toggle_overlay(vim.api.nvim_get_current_buf())
end

---Show info about diff or commit under the cursor
Git.show_status = function()
    MiniGit.show_at_cursor()
end

return Git
