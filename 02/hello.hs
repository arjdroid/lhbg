main :: IO()
main = putStrLn (render myhtml)

myhtml :: Html
myhtml =
  html_
    "Hello title" 
    (append_ (h1_ "Hello, world!") (p_ "Let's learn about Haskell!"))

newtype Html = Html String
newtype Structure = Structure String
type Title = String

append_ :: Structure -> Structure -> Structure
append_ (Structure a) (Structure b) =
  Structure (a <> b)

render :: Html -> String
render (Html a) = a

p_ :: String -> Structure
p_ = Structure . el "p"

h1_ :: String -> Structure
h1_ = Structure . el "h1"

html_ :: Title -> Structure -> Html
html_ title content =
  Html
    (
      el "html"
        (
          el "head" (el "title" title)
          <> el "body" (getStructureString content)
        )
    )

getStructureString :: Structure -> String
getStructureString (Structure a) = a

el :: String -> (String -> String)
el tag content =
  "<" <> tag <> ">" <> content <> "</" <> tag <> ">"
