local gs = {}
local snake = {}

local direction = "right"
local time = 0
local speed = .6
local snake = require("snake")

function gs.init()
  for i=0,side do
    grid[i] = {}
  end
  snake.init(10)
end

function gs.update(delta)
  time = time + delta
  speed = 0.8 - (snake.len / 100)
  if time < speed then return else time = 0 end
  snake.move()
end

function gs.draw ()
  maid64.start()
  -- Background:
  love.graphics.setColor(210, 210, 210)
  love.graphics.rectangle("line", 0, 0, side, side)
  love.graphics.setColor(210, 210, 210)
  for i, v in ipairs(grid) do
    for j, vi in pairs(v) do
      love.graphics.setColor(vi)
      gs.pixel(i, j)
    end
  end
  love.graphics.setColor(210, 210, 210)

  maid64.finish()
end

function gs.pixel (x, y)
  love.graphics.rectangle("fill", x, y, 1, 1)
end

function gs.keypressed (key)
  snake.turn(key)
end

gs.init()
return gs
