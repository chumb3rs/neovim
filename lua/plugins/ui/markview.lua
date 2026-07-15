-- For `plugins/markview.lua` users.
return {
    "OXY2DEV/markview.nvim",
    lazy = false,  -- do not lazy load plugin as it is already lazy-loaded
    opt = {
        experimental = {
            check_rtp_message = false
        }
    }
}
