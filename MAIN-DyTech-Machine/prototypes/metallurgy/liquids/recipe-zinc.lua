data:extend(
{
  {
    type = "recipe",
    name = "metallurgy-zinc-smelt",
	enabled = false,
	category = "blast-furnace",
    energy_required = 7,
    ingredients =
    {
      {type="item", name="zinc-ore", amount=1},
	  {type="fluid", name="lava-800", amount=0.2}
    },
    results = 
	{
	  {type="fluid", name="molten-zinc", amount=1}
	}
  },
  {
    type = "recipe",
    name = "metallurgy-zinc-plate",
    icon = "__CORE-DyTech-Core__/graphics/metallurgy/zinc/plate-icon.png",
	enabled = false,
	category = "forge",
    energy_required = 3.5,
    subgroup = "metallurgy-plates",
    ingredients =
    {
      {type="fluid", name="molten-zinc", amount=0.6},
      {type="item", name="mold-plate", amount=1},
    },
    results =
	{
      {type="item", name="zinc-plate", amount=1},
      {type="item", name="mold-plate", amount=1},
    },
  },
}
)