-- Dirty Water Check
if data.raw.fluid["dirty-water"] then
require("prototypes.entity.offshore-pump-dirty-water")
else
require("prototypes.entity.offshore-pump-water")
end

require("prototypes.base-edit.entity")
require("prototypes.base-edit.item")
require("prototypes.base-edit.recipe")
require("prototypes.base-edit.tech")

--require("prototypes.entity.accumulators-large")
require("prototypes.entity.accumulators-normal")
--require("prototypes.entity.accumulators-small")
require("prototypes.entity.boiler")
require("prototypes.entity.pipes")
require("prototypes.entity.pipes-to-ground")
require("prototypes.entity.pumps")
--require("prototypes.entity.solar-panels-large")
require("prototypes.entity.solar-panels-normal")
--require("prototypes.entity.solar-panels-small")
--require("prototypes.entity.steam-engines-large")
require("prototypes.entity.steam-engines-normal")
--require("prototypes.entity.steam-engines-small")

--require("prototypes.item.accumulators-large")
require("prototypes.item.accumulators-normal")
--require("prototypes.item.accumulators-small")
require("prototypes.item.boiler")
require("prototypes.item.offshore-pump")
require("prototypes.item.pipes")
require("prototypes.item.pipes-to-ground")
require("prototypes.item.pumps")
--require("prototypes.item.solar-panels-large")
require("prototypes.item.solar-panels-normal")
--require("prototypes.item.solar-panels-small")
--require("prototypes.item.steam-engines-large")
require("prototypes.item.steam-engines-normal")
--require("prototypes.item.steam-engines-small")

--require("prototypes.recipe.accumulators-large")
require("prototypes.recipe.accumulators-normal")
--require("prototypes.recipe.accumulators-small")
require("prototypes.recipe.boiler")
require("prototypes.recipe.offshore-pump")
require("prototypes.recipe.pipes")
require("prototypes.recipe.pipes-to-ground")
require("prototypes.recipe.pumps")
--require("prototypes.recipe.solar-panels-large")
require("prototypes.recipe.solar-panels-normal")
--require("prototypes.recipe.solar-panels-small")
--require("prototypes.recipe.steam-engines-large")
require("prototypes.recipe.steam-engines-normal")
--require("prototypes.recipe.steam-engines-small")

require("prototypes.technology.accumulators-normal")
require("prototypes.technology.energy")
require("prototypes.technology.solar-panels-normal")