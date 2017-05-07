enemy = {}
enemies_controller = {}
enemies_controller.enemies = {}
--Diese Deklarationen müssen Vor love.load stehen ,da sie in den Funktionen unten sonst noch nicht initialisiert sind
--Eine "Globale" Funktionsdeklaration Passiert vor love.load

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
  enemies_controller:spawnEnemy()

end

function enemies_controller:spawnEnemy()
  enemy = {}
  enemy.x = 0
  enemy.y = 0
  enemy.cooldown = 20
  enemy.bullets = {}
  enemy.speed = 10
  table.insert(self.enemies, enemy)
end
--self ist das Codeword für Das Object links von dem : und funktioniert nur innerhalb der Funktion

function enemy:fire() -- : Sagt ,dass fire() zu enemy gehört
  if self.cooldown <= 0 then
    self.cooldown = 20
    bullet = {}
    bullet.x = self.x + 35
    bullet.y = self.y
    table.insert(self.bullets, bullet)
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
