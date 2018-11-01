import Test.Framework (defaultMain, testGroup)
import Test.Framework.Providers.HUnit
import Test.Framework.Providers.QuickCheck2 (testProperty)

import Test.QuickCheck
import Test.HUnit

import Data.List

import JTHTML.Tags
import JTHTML.Lists

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
    testCase "Singleton list" test_jthtmlLists_toUnorderedList_oneelement]
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
