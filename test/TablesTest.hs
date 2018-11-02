module TablesTest
( groupTablesToTable
) where
import Test.Framework as Framework (Test, testGroup)
import Test.Framework.Providers.HUnit

import Test.HUnit

import JTHTML.Tables

groupTablesToTable :: Framework.Test
groupTablesToTable = testGroup "JTHTML.Tables toTable" [
    testCase "Empty table" test_toTable_empty,
    testCase "No headers" test_toTable_noheaders,
    testCase "Simple table" test_toTable_simple,
    testCase "Different row sizes" test_toTable_differentrows]



test_toTable_empty :: Assertion
test_toTable_empty =
  toTable [] [] @?= "<table style=\"width:100%\"></table>\n"

test_toTable_noheaders :: Assertion
test_toTable_noheaders =
  toTable [] [["foo", "bar"]] @?= s
  where
    s = "<table style=\"width:100%\">"++r++"</table>\n"
    r = "<tr><td>foo</td>\n<td>bar</td>\n</tr>\n"

test_toTable_simple :: Assertion
test_toTable_simple =
  toTable h c @?= t
  where
    h = ["Name", "Nickname"]
    c = [["Alexander", "Alex"], 
         ["Elizabeth", "Lizzy"], 
         ["Patrick", "Pat"]]
    t = "<table style=\"width:100%\">"++r1++r2++r3++r4++"</table>\n"
    r1 = "<tr><th>Name</th>\n<th>Nickname</th>\n</tr>\n"
    r2 = "<tr><td>Alexander</td>\n<td>Alex</td>\n</tr>\n"
    r3 = "<tr><td>Elizabeth</td>\n<td>Lizzy</td>\n</tr>\n"
    r4 = "<tr><td>Patrick</td>\n<td>Pat</td>\n</tr>\n"

test_toTable_differentrows :: Assertion
test_toTable_differentrows =
  toTable [] c @?= t
  where
    c = [["foo", "bar"], ["a", "b", "c"]]
    t = "<table style=\"width:100%\">"++r1++r2++"</table>\n"
    r1 = "<tr><td>foo</td>\n<td>bar</td>\n</tr>\n"
    r2 = "<tr><td>a</td>\n<td>b</td>\n<td>c</td>\n</tr>\n"
