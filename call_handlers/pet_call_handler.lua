local BaseCallHandler = require 'stonehearth_ace.call_handlers.base_call_handler'
local PetCallHandler = class(BaseCallHandler)

function PetCallHandler:set_pet_owner(session, response, pet, owner)
   if not self:is_player_entity_authorized(session, pet) or not self:is_player_entity_authorized(session, owner) then
      return false
   else
      radiant.entities.add_pet(owner, pet)
   end
end

return PetCallHandler
