require('constants')

local data

local function register_pollution_combinator(entity)
  data.pcs[entity.unit_number] = {
    entity = entity,
    control = entity.get_or_create_control_behavior(),
    position = entity.position,
    surface = entity.surface,
  }
end

local function on_init()
  data = {
    pcs = {}
  }

  storage = data

  for _, surface in pairs(game.surfaces) do
		for _, entity in pairs(surface.find_entities_filtered{ name=PC_ENTITY_NAME }) do
      register_pollution_combinator(entity)
		end
  end

  for _, force in pairs(game.forces) do
    force.recipes[PC_RECIPE_NAME].enabled = force.technologies["circuit-network"].researched
  end

end

local function on_load()
  data = storage
end

local function on_config_changed(data)
  if data.mod_changes and data.mod_changes["pollution-combinator"] then
    on_init()
  end
end

local function unregister_pollution_combinator(entity)
  data.pcs[entity.unit_number] = nil
end

local function on_tick(event)
  local count = 1
  for _, entry in pairs(data.pcs) do
    if entry.entity and entry.entity.valid then
      local control = entry.control
      if control and control.valid and control.enabled then
        local section = control.get_section(1);
        if section and section.valid then
          local surface = entry.surface
          local position = entry.position
          count = surface.get_pollution(position)
          
          -- control.set_signal(1, signal)
          section.set_slot(1, {
            value = {
              comparator = "=",
              quality = "normal",
              type = "virtual",
              name = POLLUTION_SIGNAL_NAME,
            },
            min = count,
          })

          for i=2, section.filters_count do
            section.clear_slot(i)
          end        
        end
      end
    end
  end
end

local function on_built_entity(event)
  local entity = event.created_entity or event.entity
  if entity.name == PC_ENTITY_NAME then
    register_pollution_combinator(entity)
    entity.operable = false
  end
end

local function on_pre_entity_removed(event)
  local entity = event.entity
  if entity and entity.valid and entity.name == PC_ENTITY_NAME then
    unregister_pollution_combinator(entity)
  end
end

local filters = {{filter="name", name=PC_ENTITY_NAME}}

script.on_init(on_init)
script.on_load(on_load)
script.on_configuration_changed(on_config_changed)
script.on_event(defines.events.on_tick, on_tick)
script.on_event(defines.events.on_built_entity, on_built_entity, filters)
script.on_event(defines.events.on_robot_built_entity, on_built_entity, filters)
script.on_event(defines.events.on_player_mined_entity, on_pre_entity_removed, filters)
script.on_event(defines.events.on_robot_mined_entity, on_pre_entity_removed, filters)
script.on_event(defines.events.on_entity_died, on_pre_entity_removed, filters)
