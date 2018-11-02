import Test.Framework as Framework (defaultMain, Test)

import ListsTest
import TablesTest
import TagsTest

main :: IO ()
main = defaultMain tests

tests :: [Framework.Test]
tests = [
  groupListsToUnorderedList,
  groupTablesToTable,
  groupTagsTagItem,
  groupTagsTagItemAttr]

