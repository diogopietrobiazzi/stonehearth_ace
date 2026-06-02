local BaseCallHandler = require 'stonehearth_ace.call_handlers.base_call_handler'
local FarmingCallHandler = class(BaseCallHandler)

function FarmingCallHandler:set_farm_fertilizer_preference(session, response, field, preference)
   if not self:is_player_entity_authorized(session, field) then
      return false
   end

   local farmer_field = field:get_component('stonehearth:farmer_field')
   if farmer_field then
      farmer_field:set_fertilizer_preference(preference)
      return true
   end
   return false
end


return FarmingCallHandler