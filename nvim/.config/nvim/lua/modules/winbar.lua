local status_ok, winbar = pcall(require, "winbar")
if not status_ok then
  return
end

winbar.setup({
    enabled = true,

    show_file_path = false,
    show_symbols = true,

    colors = {
        path = '', -- You can customize colors like #c946fd
        file_name = '#4b5263',
        symbols = '',
    },

    icons = {
        file_icon_default = '',
        seperator = '>',
        editor_state = '●',
        lock_icon = '',
    },

    exclude_filetype = {
        'help',
        'startify',
        'dashboard',
        'packer',
        'neogitstatus',
        'NvimTree',
        'Trouble',
        'alpha',
        'lir',
        'Outline',
        'spectre_panel',
        'toggleterm',
        'qf',
    }
})
