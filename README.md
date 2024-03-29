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

```bash
npm install -g open-cli
```

Install sed, as it needs for nvim-spectre, a finding plugin.

```bash
choco install sed
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

## Planned plugins

- inlay-hints (Don't appear as expected, may be because of Nvim 0.9?)
