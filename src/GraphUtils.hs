module GraphUtils
  ( drawAxes
  , plotFunction
  , scalePoints  
  ) where

import Graphics.Gloss

-- Scale logical coordinates to screen coordinates
scalePoints :: Float -> [(Float, Float)] -> [(Float, Float)]
scalePoints axesScale = map (\(x, y) -> (x * axesScale, y * axesScale))

-- Draw ticks along axes
drawTicks :: Float -> Float -> Float -> Float -> [Picture]
drawTicks x y size axesScale =
  let
    xTicks = [Translate (x + i * axesScale) y $ Color white (Line [(0, -5), (0, 5)]) | i <- [-size .. size], i /= 0]
    yTicks = [Translate x (y + j * axesScale)  $ Color white (Line [(-5, 0), (5, 0)]) | j <- [-size .. size], j /= 0]
  in xTicks ++ yTicks

-- Draw axes with ticks
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

-- Generate points for a function f(x)
plotFunction :: Color -> (Float -> Float) -> Float -> Float -> Float -> Picture
plotFunction funcColor func axesScale start end =
  let
    step = 0.1
    xs = [start, start+step .. end]
    pts = [(x, func x) | x <- xs]
  in Color funcColor $ Line (scalePoints axesScale pts)