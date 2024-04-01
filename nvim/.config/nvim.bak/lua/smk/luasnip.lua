-- don't pass any arguments, luasnip will find the collection because it is
-- (probably) in rtp.
-- require("luasnip.loaders.from_vscode").lazy_load()
-- specify the full path...
require("luasnip.loaders.from_vscode").lazy_load({paths = "~/.config/nvim/snippets"})
-- or relative to the directory of $MYVIMRC
-- require("luasnip.loaders.from_vscode").load({paths = "./snippets"})

