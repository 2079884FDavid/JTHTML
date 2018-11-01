import Test.Framework (defaultMain, testGroup)
import Test.Framework.Providers.HUnit
import Test.Framework.Providers.QuickCheck2 (testProperty)

import Test.QuickCheck
import Test.HUnit

import Data.List

import JTHTML.Tags
import JTHTML.Lists
import JTHTML.Tables

main = defaultMain tests

tests = [
  testGroup "JTHTML.Tags tagItem" [
    testProperty "Add any tag" prop_jthtmlTags_tagItem_anytag],
  testGroup "JTHTML.Tags tagItemAttr" [
    testCase "Add emptry attribute list" test_jthtmlTags_tagItemAttr_noattr,
    testCase "Add a single attibute" test_jthtmlTags_tagItemAttr_oneattr,
    testProperty "Add two attributes" prop_jthtmlTags_tagItemAttr_twoattr],
  testGroup "JTHTML.Lists toUnorderedList" [
    testProperty "Check that list style is correct" prop_jthtmlLists_toUnorderedList_liststyle,
    testCase "Empty list" test_jthtmlLists_toUnorderedList_empty,
    testCase "Singleton list" test_jthtmlLists_toUnorderedList_oneelement],
  testGroup "JTHTML.Tables toTable" [
    testCase "Empty table" test_jthtmlTables_toTable_empty,
    testCase "No headers" test_jthtmlTables_toTable_noheaders,
    testCase "Simple table" test_jthtmlTables_toTable_simple,
    testCase "Different row sizes" test_jthtmlTables_toTable_differentrows]
  ]

prop_jthtmlTags_tagItem_anytag s t = 
  "<"++t++">"++s++"</"++t++">\n" == tagged
  where
    tagged = tagItem t s

test_jthtmlTags_tagItemAttr_noattr =
  tagItemAttr "p" [] "Foo" @?= "<p>Foo</p>\n"

test_jthtmlTags_tagItemAttr_oneattr =
  tagItemAttr "p" ["bar"] "Foo" @?= "<p bar>Foo</p>\n"

prop_jthtmlTags_tagItemAttr_twoattr s t =
  tagged == a++"foo bar"++b || tagged == a++"bar foo"++b
  where
    tagged = tagItemAttr t ["foo", "bar"] s
    a = "<"++t++" "
    b = ">"++s++"</"++t++">\n"
  
prop_jthtmlLists_toUnorderedList_liststyle s xs =
  ("<ul style=\"list-style-type:"++s++"\">") `isPrefixOf` ul
  where
    ul = toUnorderedList (Just s) xs

test_jthtmlLists_toUnorderedList_empty =
  toUnorderedList Nothing [] @?= "<ul></ul>\n"

test_jthtmlLists_toUnorderedList_oneelement =
  toUnorderedList Nothing ["foo"] @?= "<ul><li>foo</li>\n</ul>\n"

test_jthtmlTables_toTable_empty =
  toTable [] [] @?= "<table style=\"width:100%\"></table>\n"

test_jthtmlTables_toTable_noheaders =
  toTable [] [["foo", "bar"]] @?= s
  where
    s = "<table style=\"width:100%\"><tr><td>foo</td>\n<td>bar</td>\n</tr>\n</table>\n"

test_jthtmlTables_toTable_simple =
  toTable h c @?= "<table style=\"width:100%\">"++r1++r2++r3++r4++"</table>\n"
  where
    h = ["Name", "Nickname"]
    c = [["Alexander", "Alex"], ["Elizabeth", "Lizzy"], ["Patrick", "Pat"]]
    r1 = "<tr><th>Name</th>\n<th>Nickname</th>\n</tr>\n"
    r2 = "<tr><td>Alexander</td>\n<td>Alex</td>\n</tr>\n"
    r3 = "<tr><td>Elizabeth</td>\n<td>Lizzy</td>\n</tr>\n"
    r4 = "<tr><td>Patrick</td>\n<td>Pat</td>\n</tr>\n"

test_jthtmlTables_toTable_differentrows =
  toTable [] c @?= "<table style=\"width:100%\">"++r1++r2++"</table>\n"
  where
    c = [["foo", "bar"], ["a", "b", "c"]]
    r1 = "<tr><td>foo</td>\n<td>bar</td>\n</tr>\n"
    r2 = "<tr><td>a</td>\n<td>b</td>\n<td>c</td>\n</tr>\n"
