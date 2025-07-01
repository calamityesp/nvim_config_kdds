return {
    cmd = { "lua_ls" },
    root_markers = { "init.lua", "compile_commands.json" },
    filetypes = { "lua" },
    diagnostics = {
        -- globals = { "vim" },
    },
   telemetry = {enable = false},
   workspace = {library = vim.api.nvim_get_runtime_file("", true)}
}
