data.raw["item"]["offshore-pump"].order = "a[offshore-pump]-a[mk1]"
data.raw["item"]["offshore-pump"].subgroup = "pumps"

data:extend(
{
  {
    type = "item",
    name = "offshore-pump-mk2",
    icon = "__[MAIN]DyTech-Machine__/graphics/offshore-pumps/offshore-pump2.png",
    flags = {"goes-to-quickbar"},
    subgroup = "pumps",
    order = "a[offshore-pump]-b[mk2]",
    place_result = "offshore-pump-mk2",
    stack_size = 20
  },
  {
    type = "item",
    name = "offshore-pump-mk3",
    icon = "__[MAIN]DyTech-Machine__/graphics/offshore-pumps/offshore-pump3.png",
    flags = {"goes-to-quickbar"},
    subgroup = "pumps",
    order = "a[offshore-pump]-c[mk3]",
    place_result = "offshore-pump-mk3",
    stack_size = 20
  },
  {
    type = "item",
    name = "offshore-pump-mk4",
    icon = "__[MAIN]DyTech-Machine__/graphics/offshore-pumps/offshore-pump4.png",
    flags = {"goes-to-quickbar"},
    subgroup = "pumps",
    order = "a[offshore-pump]-d[mk4]",
    place_result = "offshore-pump-mk4",
    stack_size = 20
  },
  {
    type = "item",
    name = "offshore-pump-mk5",
    icon = "__[MAIN]DyTech-Machine__/graphics/offshore-pumps/offshore-pump5.png",
    flags = {"goes-to-quickbar"},
    subgroup = "pumps",
    order = "a[offshore-pump]-e[mk5]",
    place_result = "offshore-pump-mk5",
    stack_size = 20
  },
}
)