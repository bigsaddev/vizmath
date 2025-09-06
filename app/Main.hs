module Main where

import Graphics.Gloss

drawAxes :: Float -> Float -> Float -> Float -> Picture
drawAxes x y xlen ylen = Pictures 
  [ -- x axis 
    Color white (Line[(x-xlen, y), (x+xlen, y)])
  , Translate (x + xlen + 10) (y - 5) $ Color white (Scale 0.1 0.1 $ Text "X-Axis")
  -- y axis
  , Color white (Line[(x, y-ylen), (x, y+ylen)])
  , Translate (x - 20) (y + ylen + 10) $ Color white (Scale 0.1 0.1 $ Text "Y-Axis")
  ]

main :: IO ()
main = display
  (InWindow "Gloss Triangle" (800, 600) (50, 50))  -- window size & position
  black                                           -- background color
  (Pictures
    [ Color red $ Line [(0, 0), (50, 100)]
    , drawAxes 0 0 200 200
    ])
