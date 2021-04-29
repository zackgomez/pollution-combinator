local POLLUTION_TINT = {r = 93/255, g = 34/255, b = 102/255, a = 0.8}

data:extend{
  {
    type = "item",
    name = "pollution-combinator",
    icons = {
      { icon = "__base__/graphics/icons/constant-combinator.png", icon_size = 64, },
      { 
        icon = "__base__/graphics/icons/fluid/steam.png",
        icon_size = 64,
        scale = 0.4,
        tint = POLLUTION_TINT
      },
    },
    subgroup = "circuit-network",
    place_result="pollution-combinator",
    order = "b[combinators]-d[pollution-combinator]",
    stack_size = 50,
  },
}