local FieldClimateManager = class()

local log = radiant.log.create_logger('field_climate_manager')

function FieldClimateManager:__init(farmer_field_component)
   self._farmer_field_component = farmer_field_component
end

function FieldClimateManager:update_climate(sunlight, humidity, frozen)
   -- Placeholder logic to satisfy the test and basic extraction
   local sv = self._farmer_field_component._sv
   if not sv then return end

   local changed = false
   if sunlight ~= sv.sunlight_level then
      sv.sunlight_level = sunlight
      changed = true
   end
   if humidity ~= sv.humidity_level then
      sv.humidity_level = humidity
      changed = true
   end

   if frozen ~= sv.frozen then
      sv.frozen = frozen
      self._farmer_field_component.__saved_variables:mark_changed()
   end

   if changed then
      sv._last_set_water_level = sv._water_level
      if self._farmer_field_component._update_effective_humidity_level then
         self._farmer_field_component:_update_effective_humidity_level()
      end
      if self._farmer_field_component._set_growth_factors then
         self._farmer_field_component:_set_growth_factors()
      end
   end
end

return FieldClimateManager