module HTML.Tables
( toTable
) where

import HTML.Tags

toTableRow :: String -> [String] -> String
toTableRow cellTag xs = tagItem "tr" $ concat ys
  where
    ys = map (tagItem cellTag) xs

toTable :: [String] -> [[String]] -> String
toTable headers content =
  tagItemAttr "table" ["style=\"width:100%\""] $ h++b
  where
    h = if null headers then "" else toTableRow "th" headers
    b = concat $ map (toTableRow "td") content

