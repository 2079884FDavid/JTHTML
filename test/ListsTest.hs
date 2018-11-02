module ListsTest
( group_lists_toUnorderedList
) where
import Test.Framework as Framework (Test, testGroup)
import Test.Framework.Providers.HUnit
import Test.Framework.Providers.QuickCheck2 (testProperty)

import Test.HUnit

import Data.List

import JTHTML.Lists

group_lists_toUnorderedList :: Framework.Test
group_lists_toUnorderedList = testGroup "JTHTML.Lists toUnorderedList" [
    testProperty "Check that list style is correct" prop_toUnorderedList_liststyle,
    testCase "Empty list" test_toUnorderedList_empty,
    testCase "Singleton list" test_toUnorderedList_oneelement]



prop_toUnorderedList_liststyle :: String -> [String] -> Bool 
prop_toUnorderedList_liststyle s xs =
  ("<ul style=\"list-style-type:"++s++"\">") `isPrefixOf` ul
  where
    ul = toUnorderedList (Just s) xs

test_toUnorderedList_empty :: Assertion
test_toUnorderedList_empty =
  toUnorderedList Nothing [] @?= "<ul></ul>\n"

test_toUnorderedList_oneelement :: Assertion
test_toUnorderedList_oneelement =
  toUnorderedList Nothing ["foo"] @?= "<ul><li>foo</li>\n</ul>\n"
