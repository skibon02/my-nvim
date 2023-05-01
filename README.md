## My Neovim config, based on ThePrimeagen video config and [@BrendanNolan/nvim](https://github.com/BrendanNolan/nvim) repository

### Features:
- Rust, C/C++ LSP and autocompletion
- Dap and DapUI debugging with two setups (see after/plugin/dapui.lua)
- 1. C++/Rust basic layout
- 2. Cortex debug layout with RTT
- tweaks and remaps in lua/theprimeagen folder
- CMake tools
- some cool tools and stuff (telescope, harpoon, treesitter, undotree, byobu...)

### Initial installation
To install on clean system, you need a stable release of neovim (0.9.0 in my case). 
First of all, install Packer using their instruction. Next, open nvim and run `:PackerSync`, untill you install all plugins (may need to repeat this and reopen nvim several times)


`init.sh` executes `cp` for Alacritty config, you should build and install **Alacritty** manually.

Also, you need clang installed on your system for C/C++ debugging.

Mason deps:
- codelldb
- rust-analyzer
- lua-language-server
- clangd

install them with `:MasonInstall codelldb rust-analyzer lua-language-server clangd`

Github Copilot can be installed manually with it's instruction.
### Screenshots
![image](https://user-images.githubusercontent.com/25740003/234578579-02dfed3a-84f2-4b0c-83d5-5d2041c01ba8.png)
![image](https://user-images.githubusercontent.com/25740003/234580027-289ab9c4-805e-4e6d-a7d8-ed846228aadb.png)
![image](https://user-images.githubusercontent.com/25740003/234606380-88090838-5e09-456e-8b1d-68b62bddb7a8.png)
![image](https://user-images.githubusercontent.com/25740003/234607716-24c2a0cb-0972-48cf-9cc4-8d37fd85e682.png)



### TODO:
- copilot remaps
- switch codelldb parh to mason package
- fix debugging
- maybe some cmake init snippets
- breakpoint icon + arrow

### Other links
https://sharksforarms.dev/posts/neovim-rust/

https://sharksforarms.dev/posts/neovim-rust/
