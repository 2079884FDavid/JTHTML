module HTML.Tags
( tagItem
, tagItemAttr
) where

--         HTML-Tag  Content
tagItem :: String -> String -> String
tagItem t = tagItemAttr t []

--             HTML-Tag  Attributes  Content
tagItemAttr :: String -> [String] -> String -> String
tagItemAttr t xs c = "<"++t++attr++">"++c++"</"++t++">\n"
  where
    attr = foldr (\x acc -> acc++" "++x) "" xs
