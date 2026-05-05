local Files = {}

---Open file explorer
Files.browse = function()
    MiniFiles.open(vim.api.nvim_buf_get_name(0))
end

return Files
