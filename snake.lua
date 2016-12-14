local snake = {
  len = 0,
  body = {},
  xchange = 1,
  ychange = 0
}
local ready = true;
local food = {190,20,20}

function snake.init(size)
  snake.body = {}
  snake.len = size
  for i=1,size do
    grid[i][11] = {200,200,200}
    table.insert(snake.body, {x = i, y= 11})
  end
  snake.genFood()
end

function snake.genFood ()
  repeat
    snake.food = {x = math.random(side - 1), y = math.random(side - 1)}
  until not snake.collides(snake.food)
  grid[snake.food.x][snake.food.y] = food
end

function snake.turn(direction)
  if not ready then return end
  local change = {x = 0, y = 0}
  if direction == nil or type(direction) ~= "string" then return end
  if snake.xchange == 0 then --if not moving in the horizontal
    if direction == "left" then
      change.x = -1
    elseif direction == "right" then
      change.x = 1
    end
  elseif snake.ychange == 0 then --if not moving in the vertical
    if direction == "up" then change.y = -1 end
    if direction == "down" then change.y = 1 end
  end
  if change.x ~= 0 or change.y ~= 0 then
    snake.xchange = change.x; snake.ychange = change.y
    ready = false
  end
end

function snake.move ()
  local remove_snake = snake.body[1]
  local oldHead = snake.body[snake.len]
  local newHead = {
    x = oldHead.x + snake.xchange,
    y = oldHead.y + snake.ychange
  }
  if not snake.collides(newHead) then
    grid [newHead.x][newHead.y] = {150,150,150}
    grid [oldHead.x][oldHead.y] = {200, 200, 200}
    grid [remove_snake.x][remove_snake.y] = {250,250,250}
    if newHead.x == snake.food.x and newHead.y == snake.food.y then
      snake.len = snake.len + 1
      snake.genFood()
    else
      grid [remove_snake.x][remove_snake.y] = nil
      table.remove(snake.body, 1)
    end
    snake.body[snake.len] = newHead
  else
    scr = require "game_over_screen"
  end
  ready = true
end

function snake.collides(newHead)
  return not (
    (grid[newHead.x][newHead.y] == nil or grid[newHead.x][newHead.y] == food)
    and
    newHead.x > 0 and newHead.x < side - 1 and
    newHead.y > 0 and newHead.y < side - 1
  )
end

return snake
