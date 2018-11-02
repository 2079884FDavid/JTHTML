module TagsTest
( group_tags_tagItem
, group_tags_tagItemAttr
) where
import Test.Framework as Framework (Test, testGroup)
import Test.Framework.Providers.HUnit
import Test.Framework.Providers.QuickCheck2 (testProperty)

import Test.HUnit

import JTHTML.Tags

group_tags_tagItem :: Framework.Test
group_tags_tagItem = testGroup "JTHTML.Tags tagItem" [
    testProperty "Add any tag" prop_tagItem_anytag]

group_tags_tagItemAttr :: Framework.Test
group_tags_tagItemAttr = testGroup "JTHTML.Tags tagItemAttr" [
    testCase "Add emptry attribute list" test_tagItemAttr_noattr,
    testCase "Add a single attibute" test_tagItemAttr_oneattr,
    testProperty "Add two attributes" prop_tagItemAttr_twoattr]



prop_tagItem_anytag :: String -> String -> Bool
prop_tagItem_anytag s t = 
  "<"++t++">"++s++"</"++t++">\n" == tagged
  where
    tagged = tagItem t s

test_tagItemAttr_noattr :: Assertion
test_tagItemAttr_noattr =
  tagItemAttr "p" [] "Foo" @?= "<p>Foo</p>\n"

test_tagItemAttr_oneattr :: Assertion
test_tagItemAttr_oneattr =
  tagItemAttr "p" ["bar"] "Foo" @?= "<p bar>Foo</p>\n"

prop_tagItemAttr_twoattr :: String -> String -> Bool
prop_tagItemAttr_twoattr s t =
  tagged == a++"foo bar"++b || tagged == a++"bar foo"++b
  where
    tagged = tagItemAttr t ["foo", "bar"] s
    a = "<"++t++" "
    b = ">"++s++"</"++t++">\n"

