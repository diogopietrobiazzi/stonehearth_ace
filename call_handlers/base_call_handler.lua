local validator = radiant.validator
local BaseCallHandler = class()

function BaseCallHandler:verify_player_entity_authorization(session, entity)
   validator.expect_argument_types({'Entity'}, entity)
   validator.expect.matching_player_id(session.player_id, entity)
end

function BaseCallHandler:is_player_entity_authorized(session, entity)
   if not entity or not entity:is_valid() then
      return false
   end
   return session.player_id == entity:get_player_id()
end

return BaseCallHandler
