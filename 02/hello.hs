main :: IO()
main = putStrLn myhtml

html_ :: String -> String
html_ = el "html"

body_ :: String -> String
body_ = el "body"

head_ :: String -> String
head_ = el "head"

title_ :: String -> String
title_ = el "title"

p_ :: String -> String
p_ = el "p"

h1_ :: String -> String
h1_ = el "h1"

el :: String -> (String -> String)
el = \tag -> \content ->
  "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

myhtml :: String
myhtml = makeHtml "My page title" "My page header" "My page paragraph"

makeHtml :: String -> String -> String -> String
makeHtml title header content = html_ (head_ (title_ title) <> h1_ header <> p_ content)
