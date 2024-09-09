local fn, api = vim.fn, vim.api

local augroups = {
  CursorLine = {
    {
      events = [[VimEnter,WinEnter,BufWinEnter]],
      filter = "*",
      cmd = [[setlocal cursorline relativenumber ]],
    },
    {
      events = [[WinLeave]],
      filter = "*",
      cmd = [[setlocal nocursorline norelativenumber]],
    },
  },
  TabSize = {
    {
      events = "FileType",
      filter = [[html,typescript,javascript,typescriptreact,javascriptreact]],
      cmd = [[setlocal ts=2 sts=2 sw=2]],
    },
  },
  RememberCursorPosition = { -- remember cursor position
    {
      events = "BufReadPost",
      filter = "*",
      cmd = [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]],
    },
  },
  EnableTextWrappingForTxtFile = {
    {
      events = "BufRead,BufNewFile",
      filter = "*.txt",
      cmd = [[setlocal wrap]],
    },
  },
  MakeAndCMake = {
    {
      events = "FileType",
      filter = "make",
      cmd = [[setlocal noexpandtab]],
    },
    {
      events = "BufNewFile,BufRead",
      filter = "CMakeLists.txt",
      cmd = [[setlocal filetype=cmake]],
    },
  },
  Intro = { -- disable line number for the intro buffer of AstroNvim
    {
      events = "FileType",
      filter = "alpha",
      cmd = [[setlocal nonumber norelativenumber]],
    },
  },
  MarkDown = { -- disable line number for the intro buffer of AstroNvim
    {
      events = "FileType",
      filter = "markdown",
      cmd = [[setlocal wrap]],
    },
  },
}

local createAutocommands = function(groups)
  for augroup, aucmds in pairs(groups) do
    api.nvim_command("augroup " .. augroup)
    api.nvim_command "autocmd!"

    for _, aucmd in ipairs(aucmds) do
      local cmdString = "autocmd " .. aucmd.events .. " " .. aucmd.filter .. " " .. aucmd.cmd
      api.nvim_command(cmdString)
    end

    api.nvim_command "augroup END"
  end
end

createAutocommands(augroups)
