
balls = {}

function newBall(x, y)
  ball = {}
  ball.body = love.physics.newBody(world, x/2, y/2, "dynamic") --place the body in the center of the world and make it dynamic, so it can move around
  ball.shape = love.physics.newCircleShape(20) --the ball's shape has a radius of 20
  ball.fixture = love.physics.newFixture(ball.body, ball.shape, 1) -- Attach fixture to body and give it a density of 1.
  ball.fixture:setRestitution(0.1) --let the ball bounce
  --ball.body:setAngularVelocity(5)
  --ball.body:setAngularDamping(0.9)
  ball.fixture:setFriction(0.9)
  
  table.insert(balls, ball)
end

function love.load()
  love.graphics.setBackgroundColor(220,220,220)
  
  love.physics.setMeter(64)
  world = love.physics.newWorld(0,10*64,true)
  
  ground = love.physics.newBody(world, 0, 0, "static")
  groundShape = love.physics.newEdgeShape(0,600,800,600)
  groundFixture = love.physics.newFixture(ground, groundShape)
  groundFixture:setFriction(0.9)
  
  newBall(130, 200)
  newBall(140, 50)
end

function love.update(dt)
  world:update(dt)
end

function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  end
end

function love.draw()
  love.graphics.setColor(50,50,50)
  for _,ball in pairs(balls) do
    love.graphics.circle("fill", ball.body:getX(), ball.body:getY(), 20)
  end
end