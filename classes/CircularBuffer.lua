CircularBuffer = {}
CircularBuffer.__index = CircularBuffer
function CircularBuffer.create(maxLen)
    local circularBuffer = {}
    circularBuffer.maxLen = maxLen
    circularBuffer.buffer = {}
    setmetatable(circularBuffer, CircularBuffer); --make CircularBuffer "class" handle the lookup
    return circularBuffer
end
function CircularBuffer:getMaxLen()
    return self.maxLen
end
function CircularBuffer:Add(item)
  table.insert(self.buffer, 1, item) -- Inserts an item at index 1 and shifts other items
  self.buffer[self.maxLen+1] = nil -- Removes object that got pushed out of the maxLen
end