local M = {}

local function fugitive_branch()
    local icon = lvim.icons.git.Branch
    return icon .. ' ' .. vim.fn.FugitiveHead()
end

M.sections = {
    lualine_a = { { fugitive_branch, separator = { left = "", right = "" } } },
    lualine_z = { { 'location', separator = { left = "", right = "" } } },
}

M.filetypes = { 'fugitive' }

return M
