## My Emacs Configurations
### For Rust
Make sure to install rust-analyser
```
$ git clone https://github.com/rust-analyzer/rust-analyzer.git
$ cd rust-analyser
$ cargo xtask install --server # will install rust-analyzer into $HOME/.cargo/bin
```

### For Javascript and LSP
```
sudo npm install -g typescript-language-server
sudo npm install -g typescript
```

### For Python and LSP
```
pip install 'python-lsp-server[all]'
```

#### Following Packages may not be necessary
```
sudo npm install -g prettier
sudo npm install -g eslint
```
