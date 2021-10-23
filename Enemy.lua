local Enemy = {
    x = game_width - 100,
    y = game_height - 64,
    image = lg.newImage("enemy.png"),
    bullet_image = lg.newImage("bullet.png"),
    bullet_x = 600,
    bullet_y = game_height - 32 - 8,-- Maths :D
    default_bullet_y = game_height - 24,
    bullet_xv = -300
}

function Enemy:Draw()
    lg.draw(self.image, self.x, self.y)
    lg.draw(self.bullet_image, self.bullet_x, self.bullet_y)
end

function Enemy:Update(dt)
    self.bullet_x = self.bullet_x + self.bullet_xv * dt
    if self.bullet_x < - 50 then
        self.bullet_x = game_width
        self.bullet_xv = love.math.random(400, 700) * -1
        score = score + 1
    end

    -- y = x^2
    local param = (self.bullet_x - game_width / 3) / (game_width / 3)
    self.bullet_y = game_height - (param * param * game_height / 3) - 24
    if self.bullet_x <= game_width / 3 then
        self.bullet_y = self.default_bullet_y
    end

    if player.x + player.image:getWidth() > self.bullet_x and player.x < self.bullet_x + self.bullet_image:getWidth() and player.y + player.image:getHeight() > self.bullet_y and player.y < self.bullet_y + self.bullet_image:getHeight() then
        love.system.openURL("https://www.youtube.com/watch?v=G8iEMVr7GFg")
        love.event.quit()
    end

end

return Enemy