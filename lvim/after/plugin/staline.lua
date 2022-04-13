require('staline').setup {
    defaults = {
        left_separator    = "",
        right_separator   = "",
        cool_symbol       = " ", -- Change this to override defult OS icon.
        full_path         = false,
        mod_symbol        = "  ",
        lsp_client_symbol = " ",
        line_column       = "[%l/%L] 並%p%% ", -- "[%l/%L] :%c 並%p%% " `:h stl` to see all flags.
        fg                = "#000000", -- Foreground text color.
        bg                = "#073642", -- Default background is transparent. (none)
        inactive_color    = "#303030",
        inactive_bgcolor  = "none",
        true_colors       = true, -- true lsp colors.
        font_active       = "none", --"none",     -- "bold", "italic", "bold,italic", etc
        branch_symbol     = " ", -- ""
    },
    mode_colors = {
        n = "#2bbb4f",
        i = "#986fec",
        c = "#e27d60",
        v = "#4799eb", -- etc..
    },
    mode_icons = {
        n = " ", --" ",
        i = " ",
        c = " ",
        v = " ", -- etc..
    },
    sections = {
        left  = { '- ', '-mode', 'left_sep_double', 'branch', 'file_name', 'file_size' },
        mid   = { 'lsp', ' 👀' },
        right = { 'lsp_name', 'cool_symbol', 'right_sep_double', '-line_column' },
    },
    special_table = {
        NvimTree = { 'NvimTree', ' ' },
        packer = { 'Packer', ' ' }, -- etc
    },
    lsp_symbols = {
        Error = " ",
        Info = " ",
        Warn = " ",
        Hint = "",
    },
}
