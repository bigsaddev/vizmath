module Main where

import Graphics.Gloss
import GraphUtils

globalScale :: Float
globalScale = 10

f :: Float -> Float
f x = 3 * x + 2

main :: IO ()
main = display
  (InWindow "Vizmath" (800, 600) (50, 50))  -- window size & position
  black                                           -- background color
  (Pictures
    [ drawAxes 0 0 20 globalScale -- x, y, size, scale
    , --Color red $ Line (scalePoints globalScale [(0, 0), (5, 5)])
      plotFunction red f globalScale (-5) 5
    ])
