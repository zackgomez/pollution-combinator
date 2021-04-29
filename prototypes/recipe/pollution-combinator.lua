local pollutionCombinator = table.deepcopy(data.raw["recipe"]["constant-combinator"])
pollutionCombinator.name = "pollution-combinator"
pollutionCombinator.result = "pollution-combinator"

data:extend{pollutionCombinator}