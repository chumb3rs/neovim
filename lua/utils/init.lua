local M = {}

M.get_hostname = function()
    local f = io.popen("/bin/hostname")
    if not f then
        return ""
    end
    local hostname = f:read("*a")
    if not hostname then
        f:close()
        return ""
    end
    local success, _ = f:close()
    if not success then
        return ""
    end
    hostname = string.gsub(hostname, "\n$", "")
    return hostname
end

return M
