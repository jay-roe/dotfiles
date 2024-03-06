return {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    name = "nordic",
    priority = 1000,
    config = function()
        require("nordic").load()
    end
}
