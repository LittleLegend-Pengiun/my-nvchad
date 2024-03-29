# NvChad Configuration for Windows

This is my Neovim config based on the starter config of NvChad

## Prerequisite

Commandline environment: [PowerShell 7](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows). Without Powershell, the integrated commandline in Neovim cannot be opened.

Install these tools, at it needs for NvChad (look at [NvChad document](https://nvchad.com/docs/quickstart/install) for more details):

- Neovim: `choco install neovim`.
- Nerd Font installed in the terminal. I use `MesloLMGDZ Nerd Font`.
- GCC: `choco install gcc`.
- Make, in Windows, it is in the `GnuWin32` package: `choco install gnuwin32-coreutils.portable`.
- Ripgrep: `choco install ripgrep`.

Install open-cli, as it needs for carbon-now, a screenshot tool.

```pwsh
npm install -g open-cli
```

Install sed, as it needs for nvim-spectre, a finding plugin.

```pwsh
choco install sed
```

Install NodeJS, as it needs for Markdown-preview. Recommend to install `nvm` first to manage NodeJS easier.

```pwsh
choco install nvm
```

Install python 3, as it needs for neovim-remote, which is needed for inverse searching for latex viewer programs on Windows.

```
choco install python311
```

## Installed plugins

- Base plugins of NvChad.
- LSP for these languages:
  - Lua (default)
  - Golang
  - Typescript
  - Javascript
- Carbon-now - a screenshot tool
- Prettier, tie with Conform
- NeoGit - Support create commits
- Nvim-spectre - a tool to globaly search and replace text
- Barbecue - a VS Code like winbar
- ~~Harpoon (disabled)~~ - a plugin used to mark buffer for quick navigation
- Grapple - Harpoon replacement
- stcursorword - Highlight the word that cursor is currently stay in.
- Gitblame - show git commit info for each line of code.
- Markdown-preview
- Vimtex - Latex plugin for neovim.

## Supported languages

- Lua (default)
- Typescript
- Javascript
- Golang
- Markdown
- Mdx
- Latex

## Planned plugins

- inlay-hints (Don't appear as expected, may be because of Nvim 0.9?)

## Post setup for vimtex

- Tex live: Latex compiler, remember to install texlive with medium package, and then customize it: remove unneeded language pack, tick on additional package, otherwise it cannot compile with some package properly.
- SumatraPDF: Good integration tool to view latex pdf on Windows. Install by using choco: `choco install sumatrapdf.install`. After the installation finished, add the path of SumatraPDF to Windows environment variables.
- Add the inverse search functionality: (base on [this guide](https://github.com/lervag/vimtex/issues/1964#issuecomment-782597921))
  - Install `neovim-remote`: `pip install neovim-remote`
  - Open SumatraPDF, `Settings` &rarr; `Options`. Looking for `Set inverse search commandline` at the bottom of the menu, copy the following command:
  ```pwsh
  cmd /c for /F %i in ('type C:\Users\LHTL\AppData\Local\Temp\curnvimserver.txt') do nvr --servername %i -c "normal! zzzv" +"%l" "%f"
  ```
