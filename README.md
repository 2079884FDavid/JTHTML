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
TODO

# Dependencies
*none*

#### Version
v0.1
