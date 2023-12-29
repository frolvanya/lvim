local function toggleterm_statusline()
    return 'ToggleTerm'
end

local M = {}

M.sections = {
    lualine_a = { { toggleterm_statusline, separator = { left = "", right = "" } } },
}

M.filetypes = { 'toggleterm' }

return M
