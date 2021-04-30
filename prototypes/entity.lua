require('constants')

local pollutionCombinator = table.deepcopy(data.raw["constant-combinator"]["constant-combinator"])

pollutionCombinator.name = PC_ENTITY_NAME
pollutionCombinator.minable.result = PC_ITEM_NAME
pollutionCombinator.item_slot_count = 1

data:extend{pollutionCombinator}