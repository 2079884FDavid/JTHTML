# JTHTML
Small HTML library for Haskell.

# Incorporate

Check out this [link](https://gist.github.com/gitaarik/8735255) for more information about how to use submodules.

## Add library
You have an existing project:

    myproject$ tree -aL 1
    .
    ├── .git
    └── Main.hs
    
    1 directory, 1 file

To add this library to your `myproject` run:

    myproject$ git submodule add https://github.com/2079884FDavid/JTHTML.git

*If you have a libraries directory for your project run the previous command in that directory instead.*
To refer to the library from your source code simply use `import JTHTML.` 

## Update to latest library release

    cd JTHTML
    git pull
    cd ..
    git add JTHTML
    git commit -m "Updated to latest JTHTML release"

## Checkout your repository
If your repository contains this library as a submodule run the following:

    git checkout https://myproject
    git submodule update --init
    

# Examples

Functions in module **`JTHTML.Tags`**: `tagItem` adds the specified HTML tag to the string. `tagItemAttr` adds additionally all attributes specified in the list to the tag.

    *JTHTML.Tags> let s = "Hello World"
    *JTHTML.Tags> tagItem "p" s
    "<p>Hello World</p>\n"
    *JTHTML.Tags> tagItemAttr "p" ["style=\"color:blue;\""] s
    "<p style=\"color:blue;\">Hello World</p>\n"

Functions in module **`JTHTML.Lists`**: `toUnorderedList` creates an unordered list of the elements in the list. If the specified, it uses the bulletpoint style of the first argument.

    *JTHTML.Lists> let l = ["foo", "bar", "baz", "qux"]
    *JTHTML.Lists> toUnorderedList (Just "circle") l
    "<ul style=\"list-style-type:circle\"><li>foo</li>\n<li>bar</li>\n<li>baz</li>\n<li>qux</li>\n</ul>\n"

Functions in module **`JTHTML.Tables`**: `toTable` creates an HTML list where the first argument is a list of table headers (the bold text on top of each column). If this is an empty list the table will have no headers. The second argument is a list of lists where each lists contains the content of a row.

    *JTHTML.Tables> let h = ["Name", "Nickname"]
    *JTHTML.Tables> let c = [["Alexander", "Alex"], ["Elizabeth", "Lizzy"], ["Patrick", "Pat"]]
    *JTHTML.Tables> toTable h c
    "<table style=\"width:100%\"><tr><th>Name</th>\n<th>Nickname</th>\n</tr>\n<tr><td>Alexander</td>\n<td>Alex</td>\n</tr>\n<tr><td>Elizabeth</td>\n<td>Lizzy</td>\n</tr>\n<tr><td>Patrick</td>\n<td>Pat</td>\n</tr>\n</table>\n"

# Dependencies
*none*

#### Version
v0.1
