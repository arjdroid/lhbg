main = putStrLn myhtml
wrapHtml content = "<html><body>" <> content <> "</body></html>"
myhtml = wrapHtml "Hello, world!"
