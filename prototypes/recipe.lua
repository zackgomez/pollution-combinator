require('constants')

data:extend{
  {
    type = "recipe",
    name = PC_RECIPE_NAME,
    results =
    {
      { type = "item", name = PC_ITEM_NAME, amount = 1 }
    },
    enabled = false,
    ingredients =
    {
      { type = "item", name = "constant-combinator", amount = 1 },
      { type = "item", name = "electronic-circuit", amount = 1 },
    },
  }
}