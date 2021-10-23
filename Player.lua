local Player = {
    image = lg.newImage("player.png"),
    drawX = 50, -- draw because we're drawing player from centre, but collision is from top left.
    drawY = 50,
    x = 40,
    y = 0,
    yv = 0,
    acc = 1700,
    rotation = 0
}

function Player:Draw()

    self.drawX = self.x + self.image:getWidth() / 2
    self.drawY = self.y + self.image:getHeight() / 2

    lg.draw(self.image, self.drawX, self.drawY, self.rotation, 1, 1, self.image:getWidth() / 2, self.image:getHeight() / 2)
end

function Player:Update(dt)

    -- COLLISION

    if self.y + self.image:getHeight() > game_height then
        self.y = game_height - self.image:getHeight()
        self.yv = 0
        self.rotation = 0
    end

    -- INPUT

    if lk.isDown("space") and self.y == game_height - self.image:getHeight() then -- we can't check if self.yv == 0 because that means at the top of the jump we could jump again, which should not be possible.
        self.yv = -500
    end

    -- MOVEMENT

    if self.yv ~= 0 then
        self.rotation = self.rotation + dt * 20
    end

    self.yv = self.yv + self.acc * dt
    self.y = self.y + self.yv * dt

end

return Player