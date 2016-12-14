local gos = {}
local font_size = 56

function init ()
  love.graphics.setFont(love.graphics.newFont("font.ttf", font_size))
end

function gos.draw ()
  love.graphics.setColor(0, 178, 0)
  love.graphics.printf("Game Over",
    (scrSize / 4), (scrSize / 3),
    scrSize / 2, "center")
end

--[[ doesnt work properly;
function gos.keypressed (key)
  scr = require "game_screen"
end
]]--

init()
return gos
