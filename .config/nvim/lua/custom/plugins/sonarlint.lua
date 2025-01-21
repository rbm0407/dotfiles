return {
  {
    'https://gitlab.com/schrieveslaach/sonarlint.nvim.git',
    opts = {
      server = {
        cmd = {
          'sonarlint-language-server',
          '-stdio',
          '-analyzers',
          vim.fn.expand '~/.local/share/nvim/mason/share/sonarlint-analyzers/sonarhtml.jar',
          vim.fn.expand '~/.local/share/nvim/mason/share/sonarlint-analyzers/sonarjs.jar',
          vim.fn.expand '~/.local/share/nvim/mason/share/sonarlint-analyzers/sonargo.jar',
          vim.fn.expand '~/.local/share/nvim/mason/share/sonarlint-analyzers/sonarphp.jar',
          vim.fn.expand '~/.local/share/nvim/mason/share/sonarlint-analyzers/sonarpython.jar',
        },
      },
      filetypes = {
        'html',
        'js',
        'go',
        'php',
        'python',
        'typescript',
        'typescriptreact',
      },
    },
  },
}
