local data = {
  entries = {}
}

local function on_init()
  global = data
end

local function on_load()
  data = global
  -- for _, surface in pairs(game.surfaces) do
	-- 	for _, entity in pairs(surface.find_entities_filtered{name="pollution-combinator"}) do
  --     register_pollution_combinator(entity)
	-- 	end
  -- end
end

local function register_pollution_combinator(entity)
  data.entries[entity.unit_number] = {
    entity = entity,
    control = entity.get_or_create_control_behavior(),
    position = entity.position,
    surface = entity.surface,
  }
end

local function unregister_pollution_combinator(entity)
  data.entries[entity.unit_number] = nil
end

local function on_tick(event)
  local signal = {
    signal = {
      type = "virtual",
      name = "signal-dot"
    },
    count = 1
  }
  for _, entry in pairs(data.entries) do
    local control = entry.control
    if control.valid then
      local surface = entry.surface
      local position = entry.position
      signal.count = surface.get_pollution(position)
      control.set_signal(1, signal)
    end
  end
end

local function on_built_entity(event)
  local entity = event.created_entity
  if entity.name == "pollution-combinator" then
    register_pollution_combinator(entity)
  end
end

local function on_pre_entity_removed(event)
  local entity = event.entity
  if entity.name == "pollution-combinator" then
    unregister_pollution_combinator(entity)
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