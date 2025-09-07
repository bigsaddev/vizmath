module Main where

import Graphics.Gloss
import GraphUtils

-- HELPER STUFF TO REMEBER HOW SHIT WORKS
-- Drawing a normal Line, scaled to the Dimensions
-- Color red $ Line (scalePoints globalScale [(0, 0), (5, 5)])

-- Setting the globalScale, which transforms coordinates to real world pixels, e.g. 5 -> 50
globalScale :: Float
globalScale = 10

-----------------DO STUFF HERE-----------------
f :: Float -> Float
f x = 3 * x + 2

g :: Float -> Float
g x = x**2

main :: IO ()
main = display
  (InWindow "Vizmath" (800, 600) (50, 50))  -- window size & position
  black                                           -- background color
  (Pictures
    [ drawAxes 0 0 20 globalScale -- x, y, size, scale
    , plotFunction red f globalScale (-5) 5
    , plotFunction blue g globalScale (-5) 5
    , Translate 50 100 $ Color red $ Scale 0.1 0.1 (Text "f(x)=3x+2")
    , Translate 50 50 $ Color blue $ Scale 0.1 0.1 (Text "f(x)=x^2 <-- Yay Quadratische Gleichungen!")
    ]
  )
