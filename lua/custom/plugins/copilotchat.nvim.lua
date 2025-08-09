return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim', branch = 'master' },
    },
    build = 'make tiktoken',
    cmd = { 'CopilotChat', 'CopilotChatToggle' },
    keys = {
      {
        '<LocalLeader>a',
        '<cmd>CopilotChatToggle<cr>',
        mode = { 'n', 'v' },
        desc = 'CopilotChat - Toggle',
        silent = true,
      },
      {
        '<leader>ccq',
        function()
          vim.ui.input({ prompt = 'Quick Chat: ' }, function(input)
            if input and input ~= '' then
              require('CopilotChat').ask(input, {
                selection = require('CopilotChat.select').buffer,
              })
            end
          end)
        end,
        desc = 'CopilotChat - Quick chat',
        mode = 'n',
        silent = true,
      },
      {
        '<LocalLeader>ccc',
        '<cmd>CopilotChatCommit<cr>',
        mode = { 'n', 'v' },
        desc = 'CopilotChat - Commit',
        silent = true,
      },
    },
    config = function()
      require('CopilotChat').setup {
        model = 'claude-sonnet-4',
      }
    end,
  },
}
