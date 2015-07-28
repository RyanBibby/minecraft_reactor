local reactor
local storedEnergy
local capacity = 10000000
local onPercent = 5
local offPercent = 90
local currentCapacity

reactor = peripheral.wrap('back')
while true do
 if reactor.getConnected() then
   sleep(10)
   storedEnergy = reactor.getEnergyStored()
   currentCapacity = (storedEnergy/capacity) * 100
   print('Power at ' .. currentCapacity .. '%')
   if currentCapacity > offPercent and reactor.getActive() then
     reactor.setActive(false)
     print('Turning reactor off')
   elseif currentCapacity < onPercent and not reactor.getActive() then
     reactor.setActive(true)
     print('Turning reactor on')
   end
 end  
end