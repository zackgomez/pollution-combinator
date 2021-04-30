require("constants")

data:extend{
  {
    type = "virtual-signal",
    name = POLLUTION_SIGNAL_NAME,
    icons = {
      {
        icon = "__pollution-combinator__/graphics/icons/pollution-signal.png",
        icon_size = 32,
        tint = POLLUTION_SIGNAL_TINT,
        scale = 0.5,
      },
    },
    subgroup = "virtual-signal",
    order = "u[pollution]",
  }
}