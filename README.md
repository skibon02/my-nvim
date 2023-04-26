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

### Screenshots
![image](https://user-images.githubusercontent.com/25740003/234578579-02dfed3a-84f2-4b0c-83d5-5d2041c01ba8.png)
![image](https://user-images.githubusercontent.com/25740003/234580027-289ab9c4-805e-4e6d-a7d8-ed846228aadb.png)
![image](https://user-images.githubusercontent.com/25740003/234606380-88090838-5e09-456e-8b1d-68b62bddb7a8.png)
![image](https://user-images.githubusercontent.com/25740003/234607716-24c2a0cb-0972-48cf-9cc4-8d37fd85e682.png)



### TODO:
- fix debugging

### Other links
https://sharksforarms.dev/posts/neovim-rust/

https://sharksforarms.dev/posts/neovim-rust/
