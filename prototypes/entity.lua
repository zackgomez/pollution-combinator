local pollutionCombinator = table.deepcopy(data.raw["constant-combinator"]["constant-combinator"])

pollutionCombinator.name = "pollution-combinator"
pollutionCombinator.minable.result = "pollution-combinator"
pollutionCombinator.item_slot_count = 1

data:extend{pollutionCombinator}