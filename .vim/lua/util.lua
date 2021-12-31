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

_G.pconcat = function(tab, del)
    local ctab, n = {}, 1
    for _, v in pairs(tab) do
        ctab[n] = v
        n = n + 1
    end
    return table.concat(ctab, del)
end
