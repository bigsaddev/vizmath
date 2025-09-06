module Main where

import Graphics.Gloss

scalePoints :: Float -> [(Float, Float)] -> [(Float, Float)]
scalePoints axesScale = map (\(x, y) -> (x * axesScale, y * axesScale))

drawTicks :: Float -> Float -> Float -> Float -> [Picture]
drawTicks x y size axesScale =
  let
    xTicks = [Translate (x + i * axesScale) y $ Color white (Line [(0, -5), (0, 5)]) | i <- [-size .. size], i /= 0]
    yTicks = [Translate x (y + j * axesScale)  $ Color white (Line [(-5, 0), (5, 0)]) | j <- [-size .. size], j /= 0]
  in xTicks ++ yTicks
  

drawAxes :: Float -> Float -> Float -> Float -> Picture
drawAxes x y size axesScale = Pictures $
  [ 
    -- x axis 
    Color white (Line[(x - size * axesScale, y), (x + size * axesScale, y)])
  , Translate (x + size * axesScale + 10) (y - 5) $ Color white (Scale 0.1 0.1 $ Text "X-Axis")
  -- y axis
  , Color white (Line[(x, y-size * axesScale), (x, y + size * axesScale)])
  , Translate (x - 20) (y + size * axesScale + 10) $ Color white (Scale 0.1 0.1 $ Text "Y-Axis")
  ] 
  ++ drawTicks x y size axesScale

globalScale :: Float
globalScale = 10

main :: IO ()
main = display
  (InWindow "Vizmath" (800, 600) (50, 50))  -- window size & position
  black                                           -- background color
  (Pictures
    [ Color red $ Line (scalePoints globalScale [(0, 0), (5, 5)])
    , drawAxes 0 0 20 globalScale -- x, y, size, scale
    ])
