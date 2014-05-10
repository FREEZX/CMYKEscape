fxManager = {}
fxManager.fx = {}
function fxManager.loadFx(fxName)
    if not fxManager.fx[fxName] then
        love.filesystem.load("lib/fx/" .. fxName .. ".lua")()
        fxManager.fx[fxName]:load()
    end
end
function fxManager.removeFx(fxName)
    fxManager.fx[fxName] = nil
end
function fxManager.draw()
    for _, v in pairs(fxManager.fx) do
        v:draw()
    end
end
function fxManager.update(dt)
    for _, v in pairs(fxManager.fx) do
        v:update(dt)
    end
end