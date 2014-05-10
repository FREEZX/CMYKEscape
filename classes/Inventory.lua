inventory = {}
inventory.items = {}
inventory.bgColor = {0, 0, 0, 255}
inventory.highlightColor = {255, 0, 0, 30}
inventory.itemColor = {255, 255, 255, 255}
inventory.textColor = {255, 255, 255, 255}
inventory.hovered = nil
inventory.inventoryFont = love.graphics.newFont()
inventory.itemSize = 64
inventory.margin = 5

function inventory.hasItem(itemName)
    for i, v in ipairs(inventory.items) do
        if v:getName() == itemName then
            return true
        end
    end
    return false
end
function inventory.addItem(itemName)
    assert(game.items[itemName], "No such item available")
    table.insert(inventory.items, game.items[itemName])
end

function inventory.getSelected()
    return inventory.selectedItem
end

function inventory.isSelected(itemName)
    if inventory.selectedItem and inventory.selectedItem:getName() == itemName then
        return true;
    end
    return false
end

function inventory.removeItem(itemName)
    for i, v in ipairs(inventory.items) do
        if v:getName() == itemName then
            inventory.items[i] = nil
            break
        end
    end
end

function inventory.getItems()
    return inventory.items
end

function inventory.update()
    local count = 0
    local hovered = false
    for i, v in ipairs(inventory.items) do
        if gui.Button{text="item", pos={count * (inventory.itemSize + inventory.margin*2) + 5, 5}, size={70, 70}} then
            if inventory.selectedItem == v then
                inventory.selectedItem = nil
            else
                inventory.selectedItem = v
            end
        end
        if mouseInRect({love.mouse.getPosition()}, {count * (inventory.itemSize + inventory.margin*2) + 5, 5}, {70, 70}) then
            hovered = true
            inventory.hovered = {}
            inventory.hovered.name = v:getName()
            inventory.hovered.xpos = count * 75;
        end
        count = count + 1
    end
    if not hovered then
        inventory.hovered = nil
    end
end

function inventory.draw()
    local items = inventory.getItems()
    local colorBak = {love.graphics.getColor()}
    love.graphics.setColor(inventory.bgColor)
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), 74)

    love.graphics.setColor(inventory.itemColor)
    local count = 0
    for i, v in ipairs(inventory.items) do
        if inventory.selectedItem == v then
            love.graphics.setColor(inventory.highlightColor)
            love.graphics.rectangle("fill", count * (inventory.itemSize + inventory.margin*2) + 5, 5, 64, 64)
            love.graphics.setColor(inventory.itemColor)
        end
        love.graphics.draw(v:getImage(), count * (inventory.itemSize + inventory.margin*2) + 5, 5)
        count = count + 1
    end

    if inventory.hovered then
        love.graphics.setColor(inventory.bgColor)
        love.graphics.rectangle("fill", inventory.hovered.xpos, 80, inventory.inventoryFont:getWidth(inventory.hovered.name)+20, inventory.inventoryFont:getHeight(inventory.hovered.name) + 10) --drawing hovered item desc box
        love.graphics.setColor(inventory.textColor)
        local fontBak = love.graphics.getFont()
        love.graphics.setFont(inventory.inventoryFont)
        love.graphics.printf(inventory.hovered.name, inventory.hovered.xpos + 5, 85, inventory.inventoryFont:getWidth(inventory.hovered.name) + 10, "center")
        love.graphics.setFont(fontBak)
    end

    love.graphics.setColor(colorBak)
end