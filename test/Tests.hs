import Test.Framework as Framework (defaultMain, Test)

import ListsTest
import TablesTest
import TagsTest

main :: IO ()
main = defaultMain tests

tests :: [Framework.Test]
tests = [
  group_lists_toUnorderedList,
  group_tables_toTable,
  group_tags_tagItem,
  group_tags_tagItemAttr]

