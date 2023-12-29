local M = {}

M.sections = {
    lualine_a = { { 'filename', file_status = false, separator = { left = "", right = "" } } },
}

M.filetypes = {
    'dap-repl',
    'dapui_console',
    'dapui_watches',
    'dapui_stacks',
    'dapui_breakpoints',
    'dapui_scopes',
}

return M
