require('dap-go').setup()
require("dapui").setup()

local api = vim.api
local opts_silent = { silent = true }

api.nvim_set_keymap("n", leader .. "dc", ":lua require'dap'.continue()<CR>", opts_silent)
api.nvim_set_keymap("n", leader .. "dn", ":lua require'dap'.step_over()<CR>", opts_silent)
api.nvim_set_keymap("n", leader .. "di", ":lua require'dap'.step_into()<CR>", opts_silent)
api.nvim_set_keymap("n", leader .. "do", ":lua require'dap'.step_out()<CR>", opts_silent)
api.nvim_set_keymap("n", leader .. "db", ":lua require'dap'.toggle_breakpoint()<CR>", opts_silent)
api.nvim_set_keymap("n", leader .. leader .. "d", ":lua require'dapui'.toggle()<CR>", opts_silent)
api.nvim_set_keymap("n", leader .. leader .. "df", ":lua require'dapui'.eval()<CR>", opts_silent)

-- debug が開始したらdapui を起動
require 'dap'.listeners.before['event_initialized']['custom'] = function(session, body)
  require("dapui").open()
end
-- debug が終了したらdapui を終了
require 'dap'.listeners.before['event_terminated']['custom'] = function(session, body)
  require 'dapui'.close()
end

local dap = require("dap")
dap.adapters.go = function(callback, config)
  local stdout = vim.loop.new_pipe(false)
  local handle
  local pid_or_err
  local port = 38697
  local opts = {
    stdio = { nil, stdout },
    args = { "dap", "-l", "127.0.0.1:" .. port },
    detached = true
  }
  handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
    stdout:close()
    handle:close()
    if code ~= 0 then
      print('dlv exited with code', code)
    end
  end)
  assert(handle, 'Error running dlv: ' .. tostring(pid_or_err))
  stdout:read_start(function(err, chunk)
    assert(not err, err)
    if chunk then
      vim.schedule(function()
        require('dap.repl').append(chunk)
      end)
    end
  end)
  -- Wait for delve to start
  vim.defer_fn(
    function()
      callback({ type = "server", host = "127.0.0.1", port = port })
    end,
    100)
end
-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  {
    type = "go",
    name = "Debug",
    request = "launch",
    mode = "debug",
    program = "${file}",
  },
  {
    type = "go",
    name = "Debug(args)",
    request = "launch",
    mode = "debug",
    program = "${file}",
    args = function()
      local args_string = vim.fn.input('Arguments: ')
      return vim.split(args_string, " +")
    end;
  }
}
