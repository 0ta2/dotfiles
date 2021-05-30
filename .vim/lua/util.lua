_G.dump = function(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end

_G.check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end
