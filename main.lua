side = 22
scrSize = 600
grid = {{}}

maid64 = require "maid64"
table = require "table"
local gs = require "game_screen"

scr = gs
local g = love.graphics

function love.load()
  love.window.setMode(scrSize, scrSize, {vsync=true})
  maid64.setup(side)
end

function love.update (delta)
  --require("lovebird").update() end 
  if scr.update then scr.update(delta) end
end

function love.draw()
  scr.draw()
end

function love.keypressed(key)
  if scr.keypressed then scr.keypressed(key) end
end
