return {
    "bennypowers/splitjoin.nvim",
    lazy = true,
    keys = {
        {
            "sj",
            function()
                require("splitjoin").join()
            end,
            desc = "Join the object under cursor",
        },
        {
            "ss",
            function()
                require("splitjoin").split()
            end,
            desc = "Split the object under cursor",
        },
    },
}
