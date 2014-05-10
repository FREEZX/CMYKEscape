InventoryItem = {}
InventoryItem.__index = InventoryItem
function InventoryItem.create(name, image)
    local inventoryItem = {}
    setmetatable(inventoryItem, InventoryItem); --make InventoryItem handle the lookup
    inventoryItem.name = name
    inventoryItem.image = image
    return inventoryItem
end
function InventoryItem:getImage()
    return self.image
end
function InventoryItem:getName()
    return self.name
end