local BaseCallHandler = require 'stonehearth_ace.call_handlers.base_call_handler'
local AutoHarvestCallHandler = class(BaseCallHandler)

function AutoHarvestCallHandler:toggle_auto_harvest(session, response, entity, enabled)
   self:verify_player_entity_authorization(session, entity)

   local renewable = entity:get_component('stonehearth:renewable_resource_node')
   if renewable then
      if enabled == nil then
         enabled = not renewable:get_auto_harvest_enabled()
      end
      renewable:set_auto_harvest_enabled(enabled)
   end
end

function AutoHarvestCallHandler:update_auto_harvest_setting(session, response, enabled)
   radiant.events.trigger(stonehearth_ace, 'stonehearth_ace:auto_harvest_setting_update', session.player_id)
end

return AutoHarvestCallHandler