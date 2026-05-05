local Session = {}

---Select a previously created session
Session.select = function()
    MiniSessions.select()
end

---Write a new session
Session.write = function()
    local name = vim.fn.input("Name: ")
    if name ~= "" then
        MiniSessions.write(name)
    end
end

---Delete an existing session
Session.delete = function()
    MiniSessions.select("delete")
end

return Session
