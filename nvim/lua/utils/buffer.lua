local Buffer = {}

---Returns all listed buffers that can be safely deleted
local function get_listed_buffers()
    local buffers   = vim.api.nvim_list_bufs()
    local predicate = function(buffer)
        return vim.bo[buffer].buflisted
    end

    return vim.tbl_filter(predicate, buffers)
end

---Delete current buffer
Buffer.delete_buffer = function()
    MiniBufremove.delete()
end

---Delete all buffers
Buffer.delete_all_buffers = function()
    local buffers = get_listed_buffers()

    for _, buf_id in ipairs(buffers) do
        pcall(MiniBufremove.delete, buf_id)
    end
end

---Delete all buffers except the current one
Buffer.delete_other_buffers = function()
    local current = vim.api.nvim_get_current_buf()
    local buffers = get_listed_buffers()

    for _, buf_id in ipairs(buffers) do
        if buf_id ~= current then
            pcall(MiniBufremove.delete, buf_id)
        end
    end
end

return Buffer
