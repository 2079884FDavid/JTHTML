# JTHTML
A small HTML library for Haskell. Useful if you want to convert haskell strings and objects to HTML strings.

## Getting started

The following instructions will show you how to incorporate this library into your git project using submodules. For more information about the functionality of submodules check out this [link](https://gist.github.com/gitaarik/8735255).

### Prerequisites/Dependencies
*none* =)

### Add the library to your project
Scenario: You have an existing git project called `myproject`.

    myproject$ tree -aL 1
    .
    ├── .git
    └── Main.hs

    1 directory, 1 file

To add this library to your `myproject` simply run the following command at the root of your repository (or wherever you keep your source code). *If you have a libraries directory (such as "lib") specifically for your project run the command inside that directory instead.*

    myproject$ git submodule add https://github.com/2079884FDavid/JTHTML.git

To refer to the library from your source code simply use `import JTHTML.[module]`

### Update to latest library release
To update to the latest version of this library run the following commands inside your project.

    cd JTHTML
    git pull
    cd ..
    git add JTHTML
    git commit -m "Updated to latest JTHTML release"

### Checkout your repository
If your checking out your repository `myproject` from a remote origin you need to initalize the submodule(s) (i.e. this library) like this:

    git checkout https://myproject
    git submodule update --init

# Usage Examples

### `JTHTML.Tags`
**`tagItem`** `:: String -> String -> String`<br/>
Adds the specified HTML tag to the string.

**`tagItemAttr`** `:: String -> [String] -> String -> String`<br/>
Adds additionally all attributes specified in the list to the tag.

    *JTHTML.Tags> let s = "Hello World"
    *JTHTML.Tags> tagItem "p" s
    "<p>Hello World</p>\n"
    *JTHTML.Tags> tagItemAttr "p" ["style=\"color:blue\""] s
    "<p style=\"color:blue\">Hello World</p>\n"

### `JTHTML.Lists`
**`toUnorderedList`** `:: Maybe String -> [String] -> String`<br/>
Creates an unordered list of the elements in the list. If the first argument is not `Nothing`, it uses the bulletpoint style defined in the first argument.

    *JTHTML.Lists> let l = ["foo", "bar", "baz", "qux"]
    *JTHTML.Lists> putStr $ toUnorderedList (Just "circle") l
    <ul style=\"list-style-type:circle\"><li>foo</li>
    <li>bar</li>
    <li>baz</li>
    <li>qux</li>
    </ul>

### `JTHTML.Tables`
**`toTable`** `:: [String] -> [[String]] -> String`<br/>
Creates an HTML list where the first argument is a list of table headers (the bold text on top of each column). If this is an empty list the table will have no headers. The second argument is a list of lists where each list contains the content of a single row.

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

# Testing
All tests for this library are saved in `test/[module]Test.hs` and are combined in `test/Tests.hs`. The `test/` directory is solely for testing this library.

### Test dependencies
All tests are written as [HUnit](http://hackage.haskell.org/package/HUnit) or [QuickCheck](http://hackage.haskell.org/package/QuickCheck) tests and are implemented using the [test-framework](http://batterseapower.github.com/test-framework/) package. All dependencies can be installed with cabal:

    $ cabal install test-framework
    $ cabal install test-framework-quickcheck2
    $ cabal install test-framework-hunit

### Run tests
To run the test suite use:

    JTHTML$ cd test/
    test$ ./run_tests.sh

Test results are shown on `stdout` and are additionally saved in `test/test-results.xml`, a JUnit-compatible XML file, which can be parsed by [Jenkins](https://jenkins.io/) or similar.

# Style Guide
All source lines of this library should be at most 70 characters long (which can be checked with grep). Moreover, [`hlint`](http://community.haskell.org/~ndm/darcs/hlint/hlint.htm) should be used to assure high quality of the code. Both of this can be done as show below.

    JTHTML$ cabal update
    JTHTML$ cabal install hlint
    JTHTML$
    JTHTML$ hlint .
    JTHTML$ grep -r --include \*.hs '.\{70\}' .

# Misc
Developer workflow and release management [as described](https://nvie.com/posts/a-successful-git-branching-model/) by Vincent Driessen.

Please check the [LICENSE](LICENSE) file for legal information.

Please get [in touch](http://www.jacktex.eu/about/contact.php) if you would like to contribute to this project.

### Version
v1.1
