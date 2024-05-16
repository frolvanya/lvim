lvim.leader = "space"

lvim.keys.normal_mode["<bs>"] = "<cmd>bprev<cr>"
lvim.keys.normal_mode["<tab>"] = "<cmd>bnext<cr>"

lvim.keys.normal_mode["|"] = "<cmd>vsplit<cr>"

lvim.keys.normal_mode["-"] = "<cmd>Oil<cr>"

lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"

lvim.keys.normal_mode["<S-l>"] = "<cmd>wincmd l<CR>"
lvim.keys.normal_mode["<S-h>"] = "<cmd>wincmd h<CR>"
lvim.keys.normal_mode["<S-j>"] = "<cmd>wincmd j<CR>"
lvim.keys.normal_mode["<S-k>"] = "<cmd>wincmd k<CR>"

lvim.keys.normal_mode["gx"] = "<cmd>lua OpenURLUnderCursor()<CR>"

lvim.keys.normal_mode["g1"] = "<cmd>diffget //2<CR>"
lvim.keys.normal_mode["g2"] = "<cmd>diffget //3<CR>"

function OpenURLUnderCursor()
    local url = vim.fn.matchstr(vim.fn.getline('.'), '\\v<http[s]?://\\S+>')
    if url ~= '' then
        vim.fn.system('open ' .. vim.fn.shellescape(url))
    else
        print("No URL under cursor")
    end
end
