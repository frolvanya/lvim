local mason_path                   = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")

local codelldb_adapter             = {
    type = "server",
    port = "${port}",
    executable = {
        command = mason_path .. "bin/codelldb",
        args = { "--port", "${port}" },
    },
}

lvim.builtin.dap.on_config_done    = function(dap)
    dap.adapters.codelldb = codelldb_adapter

    dap.configurations.rust = {
        {
            type = "codelldb",
            request = "launch",
            program = function()
                os.execute("cargo build &> /dev/null")
                return "target/debug/${workspaceFolderBasename}"
            end,
            args = function()
                local argv = {}
                arg = vim.fn.input(string.format("argv: "))
                for a in string.gmatch(arg, "%S+") do
                    table.insert(argv, a)
                end
                vim.cmd('echo ""')
                return argv
            end,
            cwd = "${workspaceFolder}",
            setupCommands = {
                {
                    text = "-enable-pretty-printing",
                    description = "enable pretty printing",
                    ignoreFailures = false,
                },
            },
        },
    }

    dap.configurations.cpp = {
        {
            type = "codelldb",
            request = "launch",
            program = function()
                local filetype = vim.bo.filetype
                local makefile = os.execute("(ls | grep -i makefile)")
                if makefile == "makefile" or makefile == "Makefile" then
                    os.execute("make debug")
                else
                    if filetype == "c" then
                        os.execute("clang -g *.c")
                    else
                        os.execute("clang++ -g -std=c++17 *.cpp")
                    end
                end
                return "a.out"
            end,
            args = function()
                local argv = {}
                arg = vim.fn.input(string.format("argv: "))
                for a in string.gmatch(arg, "%S+") do
                    table.insert(argv, a)
                end
                vim.cmd('echo ""')
                return argv
            end,
            cwd = "${workspaceFolder}",
            -- Uncomment if you want to stop at main
            -- stopAtEntry = true,
            -- MIMode = "gdb",
            -- miDebuggerPath = "/usr/bin/gdb",
            setupCommands = {
                {
                    text = "-enable-pretty-printing",
                    description = "enable pretty printing",
                    ignoreFailures = false,
                },
            },
        },
    }

    dap.configurations.c = dap.configurations.cpp
end

lvim.builtin.dap.ui.config.layouts = {
    {
        elements = {
            { id = "scopes",      size = 0.3 },
            { id = "breakpoints", size = 0.24 },
            -- { id = "stacks",      size = 0.25 },
            -- { id = "watches",     size = 0.25 },
        },
        size = 0.3,
        position = "right",
    },
    {
        elements = {
            -- { id = "repl",    size = 0.45 },
            { id = "console", size = 1 },
        },
        size = 0.27,
        position = "bottom",
    }
}
