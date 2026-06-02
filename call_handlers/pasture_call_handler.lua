local BaseCallHandler = require 'stonehearth_ace.call_handlers.base_call_handler'
local PastureCallHandler = class(BaseCallHandler)

function PastureCallHandler:set_pasture_harvest_animals_renewable(session, response, pasture, value)
   if not self:is_player_entity_authorized(session, pasture) then
      return false
   end

   local pasture_component = pasture:get_component('stonehearth:shepherd_pasture')
   if pasture_component then
      pasture_component:set_harvest_animals_renewable(value)
      return true
   end
   return false
end

function PastureCallHandler:set_pasture_harvest_grass(session, response, pasture, value)
   if not self:is_player_entity_authorized(session, pasture) then
      return false
   end

   local pasture_component = pasture:get_component('stonehearth:shepherd_pasture')
   if pasture_component then
      pasture_component:set_harvest_grass(value)
      return true
   end
   return false
end

function PastureCallHandler:set_pasture_collect_strays(session, response, pasture, value)
   if not self:is_player_entity_authorized(session, pasture) then
      return false
   end

   local pasture_component = pasture:get_component('stonehearth:shepherd_pasture')
   if pasture_component then
      pasture_component:set_collect_strays_enabled(value)
      return true
   end
   return false
end

function PastureCallHandler:set_pasture_maintain_animals(session, response, pasture, value)
   if not self:is_player_entity_authorized(session, pasture) then
      return false
   end

   local pasture_component = pasture:get_component('stonehearth:shepherd_pasture')
   if pasture_component then
      pasture_component:set_maintain_animals(value)
      return true
   end
   return false
end

return PastureCallHandler