local Files = {}

---Open file explorer
Files.browse = function()
    local buf_name = vim.api.nvim_buf_get_name(0)
    local buf_mini = string.find(buf_name, "^ministarter")

    if buf_mini ~= nil then
        -- Dashboard is not a valid file buffer. Let's open
        -- the file explorer at the project root.
        MiniFiles.open()
    else
        MiniFiles.open(vim.api.nvim_buf_get_name(0))
    end
end

return Files
