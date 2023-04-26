## My nvim config, based on ThePrimeagen video config and [@BrendanNolan/nvim](https://github.com/BrendanNolan/nvim) repository


### Initial installation
While installing on clean system, you need a stable release of neovim (0.9.0 in my case). 
First of all, install Packer using their instruction. Next, open nvim and run `:PackerSync`, untill you install all plugins (may need to repeat this and reopen nvim several times)


`init.sh` executes `cp` for Alacritty config, you should build and install **Alacritty** manually.

Also, you need clangd and clang installed on your system for C/C++ Lsp integration and debugging. Maybe, you'll have to install `g++-12`

Mason deps:
- codelldb
- rust-analyzer
- lua-language-server

install them with `:MasonInstall codelldb rust-analyzer lua-language-server`
