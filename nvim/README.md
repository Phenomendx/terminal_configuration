#### Install Go

```bash
1. brew install go
2. set up the $GOPATH and $GOBIN variables
3. Within neovim :GoInstallBinaries
4. Check the binaries were installed on $GOBIN
```

#### Install Language Server Providers

_Terraform_

- [terraform-lsp](https://github.com/juliosueiras/terraform-lsp)

_Java_

- [java-language-server](https://github.com/georgewfraser/java-language-server)

- [eclipse.jdt.ls](https://github.com/eclipse/eclipse.jdt.ls)


#### Install Coc Extenstions

	Within Neovim :CocInstall coc-pairs
	Within Neovim :CocInstall coc-json
	Within Neovim :CocInstall coc-yank
	Within Neovim :CocInstall coc-java
	
As an alternative to the aboves define this variable with the desired coc extenstion to be installed in your init.vim

```bash
let g:coc_global_extensions = ['coc-java', 'coc-json', 'coc-snippets', 'coc-pairs', 'coc-yank']
```
	
#### NERDTree with Dev icons

[vim-nerdtree-syntax-highlit](https://github.com/tiagofumo/vim-nerdtree-syntax-highlight)

[vim-devicons](https://github.com/ryanoasis/vim-devicons)

Install a Nerd compatible font(https://github.com/ryanoasis/nerd-fonts#font-installation)
