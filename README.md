# NvChad Configuration for Windows

This is my Neovim config based on the starter config of NvChad

## Prequesite

Commandline environment: [PowerShell 7](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows). Without Powershell, the integrated commandline in Neovim cannot be opened.

Install these tools, at it needs for NvChad (look at [NvChad document](https://nvchad.com/docs/quickstart/install) for more details):

- Neovim: `choco install neovim` (Windows).
- Nerd Font installed in the terminal. I use `MesloLMGDZ Nerd Font`.
- GCC: `choco install gcc` (Windows).
- Make, in Windows, it is in the `GnuWin32` package: `choco install gnuwin32-coreutils.portable`.
- Ripgrep: `choco install ripgrep` (Windows).

Install open-cli, as it needs for carbon-now, a screenshot tool.

```bash
npm install -g open-cli
```

## Installed plugins

- Base plugins of NvChad.
- LSP for these languages:
  - Lua (default)
  - Golang
  - Typescript
  - Javascript
- Screenshot tool: `carbon-now`
- Prettier, tie with Conform
- NeoGit
