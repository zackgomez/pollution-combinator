local data = {
  entities = {}
}

local function on_init()
  global.pollution_combinator_data = data
end

local function on_load()
  data = global.pollution_combinator_data or data
end

local function on_tick(event)
  for _, entity in pairs(data.entities) do
    if entity.valid then
      local control = entity.get_or_create_control_behavior()
      control.set_signal(1, {
        signal = {
          type = "virtual",
          name = "signal-dot"
        },
        count = 1
      })
    end
  end
end

local function on_built_entity(event)
  local entity = event.created_entity
  if entity.name == "pollution-combinator" then
    data.entities[entity.unit_number] = entity
  end
end

local function on_pre_entity_removed(event)
  local entity = event.entity
  if entity.name == "pollution-combinator" then
    data.entities[entity.unit_number] = nil
  end
end

local filters = {{filter="name", name="pollution-combinator"}}

script.on_init(on_init)
script.on_load(on_load)
script.on_event(defines.events.on_tick, on_tick)
script.on_event(defines.events.on_built_entity, on_built_entity, filters)
script.on_event(defines.events.on_robot_built_entity, on_built_entity, filters)
script.on_event(defines.events.on_player_mined_entity, on_pre_entity_removed, filters)
script.on_event(defines.events.on_robot_mined_entity, on_pre_entity_removed, filters)
script.on_event(defines.events.on_entity_died, on_pre_entity_removed, filters)