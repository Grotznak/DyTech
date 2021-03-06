module("fs", package.seeall)
require("util")

function MeteorSpawn(meteor)
	local position={}
  	position.x=math.random(math.abs(glob.landing.west)+glob.landing.east)
    position.y=math.random(math.abs(glob.landing.south)+glob.landing.north)
    if position.x > glob.landing.east then position.x=glob.landing.east-position.x end
    if position.y > glob.landing.north then position.y=glob.landing.north-position.y end
	local name = meteor[math.random(#meteor)] -- first index is explosion
	game.createentity{name=name, position=position, force=game.forces.player} -- spawn meteor
  game.createentity{name=meteor.explosion, position=position, force=game.forces.neutral} -- spawn explosion
  for _, nearbyentity in ipairs(game.findentities{getboundingbox(position, meteor.area)}) do
    if nearbyentity.health then
      if nearbyentity.name == name then --this IS necessary, even with health=500000, the damage at ground zero is practically infinite
      elseif nearbyentity.name == "player" then
        nearbyentity.damage(math.min((50*meteor.area/util.distance(position, nearbyentity.position)), (nearbyentity.health-1)), game.forces.enemy) --same calc, but limited to prevent player death
      --elseif nearbyentity.name == "player" then nearbyentity.damage(math.min(50, nearbyentity.health-1), game.forces.enemy) --explicit damage of 50 or 1 less than current health to prevent death.
      else nearbyentity.damage((50*meteor.area/util.distance(position, nearbyentity.position)), game.forces.enemy)
      end
  --else nearbyentity.destroy() -- optional
    end
  end
end

function getboundingbox(position, radius)
return {position.x-radius, position.y-radius}, {position.x+radius,position.y+radius} end

function CollectByPosition(name, radius, ext)
	local realname=name.."-collector"
	if ext then realname=realname.."-1" end
	for i, value in pairs(glob[name]) do
    local foundcollector=game.findentitiesfiltered{name=realname, area={getboundingbox(value.position, 1)}}
		if not foundcollector[1] then
		table.remove(glob[name], i)
		break
		else
			for _, item in pairs(game.findentitiesfiltered{name="item-on-ground", area={getboundingbox(value.position, radius)}}) do
				if item.stack.name==name and foundcollector[1].caninsert{name=name, count=1} then
					foundcollector[1].insert{name=name, count=1}
					game.createentity{name="item-pickup-dytech", position={value.position.x, value.position.y+0.5}}
					item.destroy()
				break
				end
			end
		end
	end
end

function dmgMsg(entity) -- Messages for the Damage Events!
	if glob.message then 
		if entity.valid then
			game.player.print(game.getlocalisedentityname(entity.name).." "..game.gettext("msg-damaged"))
		else
			game.player.print(game.gettext("msg-destroyed"))
		end
	elseif glob.message==nil then
		glob.message = true
	end
end

function CounterPrinter()
	game.player.print("Here are all your counters with their current status!")
	game.player.print("Gear:".." "..tostring(glob.counter.gear))
	game.player.print("Resource:".." "..tostring(glob.counter.resource))
	game.player.print("Mining:".." "..tostring(glob.counter.mining))
	game.player.print("Robot:".." "..tostring(glob.counter.robot))
	game.player.print("Machine:".." "..tostring(glob.counter.machine))
	game.player.print("Gun:".." "..tostring(glob.counter.gun))
	game.player.print("Ammo:".." "..tostring(glob.counter.ammo))
	game.player.print("Capsule:".." "..tostring(glob.counter.capsule))
	game.player.print("Tech:".." "..tostring(glob.counter.tech))
	game.player.print("Plates:".." "..tostring(glob.counter.plates))
	game.player.print("Inserter:".." "..tostring(glob.counter.inserter))
	game.player.print("Energy:".." "..tostring(glob.counter.energy))
	game.player.print("Chest:".." "..tostring(glob.counter.chest))
	game.player.print("Armor:".." "..tostring(glob.counter.armor))
	game.player.print("Gems:".." "..tostring(glob.counter.gems))
	game.player.print("Belt:".." "..tostring(glob.counter.belt))
	game.player.print("Turret:".." "..tostring(glob.counter.turret))
	game.player.print("Alien:".." "..tostring(glob.counter.alien))
	game.player.print("Science:".." "..tostring(glob.counter.science))
	game.player.print("Wall:".." "..tostring(glob.counter.wall))
	game.player.print("Modules:".." "..tostring(glob.counter.modules))
	game.player.print("All Counters Combined:".." "..tostring(glob.counter.dytech))
end

function CounterPrinter2()
	game.player.print("Here are all your counters of second tier with their current status!")
	game.player.print("Item Mined:".." "..tostring(glob.counter2.mine))
	game.player.print("Entities Build:".." "..tostring(glob.counter2.build))
	game.player.print("Sectors Scanned:".." "..tostring(glob.counter2.sectorscanned))
	game.player.print("Entities Died:".." "..tostring(glob.counter2.died))
	game.player.print("Items Picked Up:".." "..tostring(glob.counter2.pickup))
	game.player.print("Chunks Loaded:".." "..tostring(glob.counter2.chunks))
	game.player.print("All Counters Combined:".." "..tostring(glob.counter2.dytech))
end

function Meteor()
	game.player.print("Here you can see how many Meteors have spawned")
	game.player.print("Small:".." "..tostring(glob.meteor.small))
	game.player.print("Medium:".." "..tostring(glob.meteor.medium))
	game.player.print("Comets:".." "..tostring(glob.meteor.comet))
	game.player.print("Large:".." "..tostring(glob.meteor.large))
	game.player.print("Asteroid:".." "..tostring(glob.meteor.asteroid))
	game.player.print("All Counters Combined:".." "..tostring(glob.meteor.dytech))
end

function OnLoad()
	if not glob.counter then glob.counter={dytech=0, gear=0, resource=0, mining=0, robot=0, ammo=0, gun=0, machine=0, capsule=0, tech=0, plates=0, inserter=0, energy=0, chest=0, armor=0, gems=0, belt=0, turret=0, alien=0, science=0, wall=0, modules=0} end
	if not glob.counter.dytech then glob.counter.dytech=0 end
	if not glob.counter.gear then glob.counter.gear=0 end
	if not glob.counter.resource then glob.counter.resource=0 end
	if not glob.counter.mining then glob.counter.mining=0 end
	if not glob.counter.robot then glob.counter.robot=0 end
	if not glob.counter.ammo then glob.counter.ammo=0 end
	if not glob.counter.gun then glob.counter.gun=0 end
	if not glob.counter.machine then glob.counter.machine=0 end
	if not glob.counter.capsule then glob.counter.capsule=0 end
	if not glob.counter.tech then glob.counter.tech=0 end
	if not glob.counter.plates then glob.counter.plates=0 end
	if not glob.counter.inserter then glob.counter.inserter=0 end
	if not glob.counter.energy then glob.counter.energy=0 end
	if not glob.counter.chest then glob.counter.chest=0 end
	if not glob.counter.armor then glob.counter.armor=0 end
	if not glob.counter.gems then glob.counter.gems=0 end
	if not glob.counter.belt then glob.counter.belt=0 end
	if not glob.counter.turret then glob.counter.turret=0 end
	if not glob.counter.alien then glob.counter.alien=0 end
	if not glob.counter.science then glob.counter.science=0 end
	if not glob.counter.wall then glob.counter.wall=0 end
	if not glob.counter.modules then glob.counter.modules=0 end
	if not glob.unlock then glob.unlock={umd=0} end
	if not glob.unlock.umd then glob.unlock.umd=0 end
	if not glob.craftfoundation then glob.craftfoundation={wood=0, stone=0, iron=0, steel=0} end
	if not glob.reward then glob.reward={axe1=false} end
	if not glob.reward.axe1 then glob.reward.axe1=false end
	if not glob.time then glob.time=0 end
	if not glob.combat then glob.combat={dytech=0, small=0, medium=0, big=0, berserker=0, elder=0, king=0, queen=0, dog=0, bird=0} end
	if not glob.combat.dytech then glob.combat.dytech=0 end
	if not glob.combat.small then glob.combat.small=0 end
	if not glob.combat.medium then glob.combat.medium=0 end
	if not glob.combat.big then glob.combat.big=0 end
	if not glob.combat.berserker then glob.combat.berserker=0 end
	if not glob.combat.elder then glob.combat.elder=0 end
	if not glob.combat.king then glob.combat.king=0 end
	if not glob.combat.queen then glob.combat.queen=0 end
	if not glob.combat.dog then glob.combat.dog=0 end
	if not glob.combat.bird then glob.combat.bird=0 end
	if not glob.warning then glob.warning=false end
	if not glob.radars then glob.radars={} end
	if not glob.landing then glob.landing={extra=math.random(800,1200)} end
	if not glob.landing.north then glob.landing.north=glob.landing.extra end
	if not glob.landing.south then glob.landing.south=0-glob.landing.extra end
	if not glob.landing.east then glob.landing.east=glob.landing.extra end
	if not glob.landing.west then glob.landing.west=0-glob.landing.extra end
	if not glob.counter2 then glob.counter2={dytech=0, mine=0, build=0, sectorscanned=0, died=0, pickup=0, chunks=0} end
	if not glob.counter2.dytech then glob.counter2.dytech=0 end
	if not glob.counter2.mine then glob.counter2.mine=0 end
	if not glob.counter2.build then glob.counter2.build=0 end
	if not glob.counter2.sectorscanned then glob.counter2.sectorscanned=0 end
	if not glob.counter2.died then glob.counter2.died=0 end
	if not glob.counter2.pickup then glob.counter2.pickup=0 end
	if not glob.counter2.chunks then glob.counter2.chunks=0 end
	if not glob.meteor then glob.meteor={small=0, medium=0, large=0, comet=0, asteroid=0, dytech=0} end
	if not glob.meteor.small then glob.meteor.small=0 end
	if not glob.meteor.medium then glob.meteor.medium=0 end
	if not glob.meteor.large then glob.meteor.large=0 end
	if not glob.meteor.comet then glob.meteor.comet=0 end
	if not glob.meteor.asteroid then glob.meteor.asteroid=0 end
	if not glob.meteor.dytech then glob.meteor.dytech=0 end
end

function OnInit()
	game.player.print(game.gettext("msg-welcome-1"))
	game.player.print(game.gettext("msg-welcome-2"))
	game.player.insert{name="wood",count=4}
glob.counter={dytech=0, gear=0, resource=0, mining=0, robot=0, ammo=0, gun=0, machine=0, capsule=0, tech=0, plates=0, inserter=0, energy=0, chest=0, armor=0, gems=0, belt=0, turret=0, alien=0, science=0, wall=0, modules=0, sectorscanned=0}
glob.combat={dytech=0, small=0, medium=0, big=0, berserker=0, elder=0, king=0, queen=0, dog=0, bird=0}
glob.unlock={umd=0}
glob.craftfoundation={wood=0, stone=0, iron=0, steel=0}
glob.reward={axe1=false}
glob.time=0
glob.message=true
glob.gem={}
glob.gemcount=0
glob.stone={}
glob.stonecount=0
glob.sand={}
glob.sandcount=0
glob.coal={}
glob.coalcount=0
glob.warning=false
glob.radars={}
glob.landing={extra=math.random(800,1200)}
glob.landing.north=glob.landing.extra
glob.landing.south=0-glob.landing.extra
glob.landing.east=glob.landing.extra
glob.landing.west=0-glob.landing.extra
glob.counter2={dytech=0, mine=0, build=0, sectorscanned=0, died=0, pickup=0, chunks=0}
glob.meteor={small=0, medium=0, large=0, comet=0, asteroid=0, dytech=0}
end