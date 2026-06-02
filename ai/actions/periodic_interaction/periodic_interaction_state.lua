local PeriodicInteractionState = class()

function PeriodicInteractionState:__init()
   self.ready = false
   self.started = false
end

function PeriodicInteractionState:is_ready()
   return self.ready
end

function PeriodicInteractionState:set_ready(is_ready)
   self.ready = is_ready
end

function PeriodicInteractionState:is_started()
   return self.started
end

function PeriodicInteractionState:set_started(is_started)
   self.started = is_started
end

return PeriodicInteractionState