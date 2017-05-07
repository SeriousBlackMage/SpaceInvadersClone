
function love.load()
  player = {}
  player.x = 0
  player.y = 550
  player.cooldown = 20
  player.bullets = {}
  player.speed = 10
  player.fire = function()
    if player.cooldown <= 0 then
      player.cooldown = 20
      bullet = {}
      bullet.x = player.x + 35
      bullet.y = player.y
      table.insert(player.bullets, bullet)
  end
  end

end


function love.update()
  player.cooldown = player.cooldown - 1
  if love.keyboard.isDown("right") then
    player.x = player.x + player.speed
  elseif love.keyboard.isDown("left") then
    player.x = player.x - player.speed
  end

  if love.keyboard.isDown("space") then
    player.fire()
  end

  for i,v in ipairs(player.bullets) do
    if v.y < -10 then
      table.remove(player.bullets, i)
    end
    v.y = v.y - 10
  end
end

function love.draw()
  love.graphics.setColor(255, 120, 255, 255)
  love.graphics.rectangle("fill", player.x, player.y, 80, 20)
  love.graphics.setColor(255,255,255,255)
  for _, v in pairs(player.bullets) do
    love.graphics.rectangle("fill", v.x, v.y, 10, 10)
  end
end

--https://youtu.be/FUiz1kL0QtI?t=15m3s
