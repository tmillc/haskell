--
-- From wx page, full code isn't given so I will have to actually understand it
-- to run it ahhhh!!! Someday, but not soon. ABANDONED 5/19/2015
--
module Main where
import Graphics.UI.WX

-- constants: radius of the ball, and the maximal x and y coordinates
radius, maxX, maxY :: Int
maxY = 300
maxX = 300
radius = 10

-- the max. height is at most max. y minus the radius of a ball.
maxH :: Int
maxH = maxY - radius

--the main function
main = start ballsFrame

ballsFrame
  = do -- a list of balls, where each ball is represented
       -- by a list of all future positions.
       vballs <- varCreate []

       -- create a non-user-resizable top-level (orphan) frame.
       f <- frameFixed [text := "Bouncing balls"]

       -- create a panel to draw in.
       p <- panel f [on paint := paintBalls vballs]

       -- create a timer that updates the ball positions
       t <- timer f [interval := 20, on command := nextBalls vballs p]

       -- react on user input
       set p [on click         := dropBall vballs p              -- drop ball
             ,on clickRight    := (\pt -> ballsFrame)            -- new window
             ,on (charKey 'p') := set t [enabled   :~ not]        -- pause
             ,on (charKey '-') := set t [interval :~ \i -> i*2]  -- increase interval
             ,on (charKey '+') := set t [interval :~ \i -> max 1 (i `div` 2)]
             ]

       -- put the panel in the frame, with a minimal size
       set f [layout := minsize (sz maxX maxY) $ widget p]
   where
     ...
