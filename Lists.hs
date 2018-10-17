module JTHTML.Lists
( toUnorderedList
) where

import JTHTML.Tags

toListItem :: String -> String
toListItem = tagItem "li"

toUnorderedList :: Maybe String -> [String] -> String
toUnorderedList s xs = tagItemAttr "ul" attr items
  where
    items = concat $ map toListItem xs
    attr = case s of
             Nothing -> []
             Just style -> ["style=\"list-style-type:"++style++"\""]
