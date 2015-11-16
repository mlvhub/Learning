import Graphics.Element exposing (..)
import Mouse
import Window

-- relativeMouse : (Int, Int) -> (Int, Int) -> (Int, Int)
-- relativeMouse (ox, oy) (x, y) = (x - ox, y - oy)

-- myText : (Int, Int) -> Element
-- myText = show << relativeMouse (100, 100)

main : Signal Element
main =
  Signal.map show Mouse.position
