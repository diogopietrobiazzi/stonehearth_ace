-- ExtensibleRegion class to encapsulate related data and resolve Data Clumps
local ExtensibleRegion = class()

function ExtensibleRegion:__init(rotation_index, length, region)
   self.rotation_index = rotation_index
   self.length = length
   self.region = region
end

function ExtensibleRegion:get_rotation_index()
   return self.rotation_index
end

function ExtensibleRegion:get_length()
   return self.length
end

function ExtensibleRegion:get_region()
   return self.region
end

return ExtensibleRegion
