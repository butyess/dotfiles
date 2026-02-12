return {
    'Mofiqul/vscode.nvim',
    config = function()
        require('vscode').setup()
        require('vscode').load()
    end,
}
