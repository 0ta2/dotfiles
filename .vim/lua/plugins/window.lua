local use = require"packer".use

local function init()
  use {
    'simeji/winresizer',
    cmd = 'WinResizerStartResize',
    setup = function()
      require"config.winresizer".init()
    end
  }
end

return {
  init = init,
}
