local pollutionCombinator = table.deepcopy(data.raw["item"]["constant-combinator"])
pollutionCombinator.name = "pollution-combinator"
pollutionCombinator.place_result = "pollution-combinator"

data:extend{pollutionCombinator}