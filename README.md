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

# Dependencies
*none*

#### Version
v0.1
