local M = {}

function M.ex_opts(desc, buffer)
    local opts = { noremap = true, silent = true }
    local final_opts = vim.tbl_extend("force", opts, {})
    if desc then
        final_opts.desc = desc
    end

    if buffer then
        final_opts.buffer = buffer
    end
end


return M
