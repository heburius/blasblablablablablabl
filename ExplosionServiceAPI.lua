-- EXPLOSION SERVICE
-- NOT PRODUCTION QUALITY BY ANY AND ALL MEANS
-- Made using Spatial Query (WorldRoot:GetPartBoundsInRadius()) and GoodSignal
-- Performance benefits over ROBLOX explosions
--   Client-Created explosions for network benefit
--   Uses Spatial Query (WorldRoot:GetPartBoundsInRadius()) for performance benefit
--   Uses GoodSignal for SIGNIFICANTLY FASTER performance over RobloxSignal (0.8μs vs 3.2μs
--   Also can be modified and edited to include more functions unlike base roblox explosions
-- Only a few functions so far
-- ExplosionService.NewBehavior() creates a new data table given ALL the objects that I you may use in explosion service
-- local PlaceholderObject = ExplosionService.New() creates a new explosion object given a data table
-- PlaceholderObject:Explode() explodes the explosion then fires a signal given explosion object

local ExplosionService = require(PathToModule)
--create an explosion object
-- requires a behavior table, you can make a behaviorTable with NewBehavior
local Behavior = ExplosionService.NewBehavior()
Behavior.StartPosition = Bomb.Position -- EXAMPLE:
Behavior.Radius = 15 -- EXAMPLE:
Behavior.OverlapParams = nil -- EXAMPLE: you can set this to an actual OverlapParams though
Behavior.CosmeticEffect = {Instance = "BombExplosion", Length = 5} -- EXAMPLE: cosmetic itself must be put under PathToModule.ExplosionCosmetics (network optimization)

local Explosion = ExplosionService.new(ExplosionBehavior) 

local function OnHit(PartThatWasHit)
  -- do stuff with ur provided part 
end

local connection = Explosion.Hit:Connect(OnHit) -- this just iterates through the spatial query and fires a signal

Explosion:Explode() -- must be put under the hit connection to work properly since im using GoodSignal 

connection:Disconnect() -- not disconnecting this wont cause any memory leaks since we use GoodSignal, but if you used roblox signals then it would cause memory leaks. However imma just disconnect it cause we wont be using it anymore
table.clear(connection) -- kill the metatable since we will NOT be using it anymore
