local M = {}

M.sections = {
    lualine_a = {
        {
            function()
                local ok, oil = pcall(require, 'oil')
                if ok then
                    return vim.fn.fnamemodify(oil.get_current_dir(), ':~')
                else
                    return ''
                end
            end,
            separator = { left = "", right = "" }
        }
    },
}

M.filetypes = { 'oil' }

return M
