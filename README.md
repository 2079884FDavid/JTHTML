# JTHTML
A small HTML library for Haskell. Useful if you want to convert haskell strings and objects to HTML strings.

## Getting started

The following instructions will show you how to incorporate this library into your git project using submodules. For more information about the functionality of submodules check out this [link](https://gist.github.com/gitaarik/8735255).

### Prerequisites/Dependencies
*none* =)

### Add the library to your project
You have an existing project:

    myproject$ tree -aL 1
    .
    ├── .git
    └── Main.hs

    1 directory, 1 file

To add this library to your `myproject` simply run the following command at the root of your repository (or wherever you keep your source code). *If you have a libraries directory (such as "lib") specifically for your project run the command inside that directory instead.*

    myproject$ git submodule add https://github.com/2079884FDavid/JTHTML.git

To refer to the library from your source code simply use `import JTHTML.[module]`

### Update to latest library release

    cd JTHTML
    git pull
    cd ..
    git add JTHTML
    git commit -m "Updated to latest JTHTML release"

### Checkout your repository
If your repository contains this library as a submodule run the following:

    git checkout https://myproject
    git submodule update --init


# Usage Examples

### `JTHTML.Tags`
**`tagItem`** adds the specified HTML tag to the string.<br/>
**`tagItemAttr`** adds additionally all attributes specified in the list to the tag.

    *JTHTML.Tags> let s = "Hello World"
    *JTHTML.Tags> tagItem "p" s
    "<p>Hello World</p>\n"
    *JTHTML.Tags> tagItemAttr "p" ["style=\"color:blue\""] s
    "<p style=\"color:blue\">Hello World</p>\n"

### `JTHTML.Lists`
**`toUnorderedList`** creates an unordered list of the elements in the list. If the specified, it uses the bulletpoint style of the first argument.

    *JTHTML.Lists> let l = ["foo", "bar", "baz", "qux"]
    *JTHTML.Lists> putStr $ toUnorderedList (Just "circle") l
    <ul style=\"list-style-type:circle\"><li>foo</li>
    <li>bar</li>
    <li>baz</li>
    <li>qux</li>
    </ul>

### `JTHTML.Tables`
**`toTable`** creates an HTML list where the first argument is a list of table headers (the bold text on top of each column). If this is an empty list the table will have no headers. The second argument is a list of lists where each lists contains the content of a single row.

    *JTHTML.Tables> let h = ["Name", "Nickname"]
    *JTHTML.Tables> let c = [["Alexander", "Alex"], ["Elizabeth", "Lizzy"], ["Patrick", "Pat"]]
    *JTHTML.Tables> putStr $ toTable h c
    <table style=\"width:100%\"><tr><th>Name</th>
    <th>Nickname</th>
    </tr>
    <tr><td>Alexander</td>
    <td>Alex</td>
    </tr>
    <tr><td>Elizabeth</td>
    <td>Lizzy</td>
    </tr>
    <tr><td>Patrick</td>
    <td>Pat</td>
    </tr>
    </table>

# Misc
Developer workflow and release management [as described](https://nvie.com/posts/a-successful-git-branching-model/) by Vincent Driessen.

Please check the [LICENSE](LICENSE) file for legal information.

Please get [in touch](http://www.jacktex.eu/about/contact.php) if you would like to contribute to this project.

### Version
v0.1
