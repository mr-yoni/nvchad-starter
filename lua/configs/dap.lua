local dap = require "dap"

dap.adapters["pwa-node"] = {
  type = "server",
  host = "127.0.0.1",
  port = 8123,
  executable = {
    command = "js-debug-adapter",
  },
}

for _, language in ipairs { "typescript", "javascript" } do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
      runtimeExecutable = "node",
    },
  }
end

dap.configurations["env"] = function()
  local variables = {}
  for k, v in pairs(vim.fn.environ()) do
    table.insert(variables, string.format("%s=%s", k, v))
  end
  return variables
end

dap.defaults.fallback.terminal_win_cmd = function()
  vim.cmd "tabnew"
end
