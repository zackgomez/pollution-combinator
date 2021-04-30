require('constants')

data:extend{
  {
    type = "item",
    name = PC_ITEM_NAME,
    icons = {
      { 
        icon = "__base__/graphics/icons/constant-combinator.png", 
        icon_size = 64,
        tint = PC_TINT
      },
      { 
        icon = "__pollution-combinator__/graphics/icons/pollution-signal.png",
        icon_size = 32,
        tint = POLLUTION_SIGNAL_TINT,
        scale = 0.7,
      },
    },
    subgroup = "circuit-network",
    place_result = PC_ENTITY_NAME,
    order = "c[combinators]-d[pollution-combinator]",
    stack_size = 50,
  },
}