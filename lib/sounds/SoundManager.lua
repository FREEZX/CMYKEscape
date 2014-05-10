soundManager = {}
soundManager.ambient = {}
soundManager.ambient.volume = 1


function soundManager.setAmbient(file)
    soundManager.ambient.source = love.audio.newSource(file)
    soundManager.ambient.source:setLooping(true)
    soundManager.ambient.source:setVolume(soundManager.ambient.volume)
end

function soundManager.setAmbientVolume(volume)
    soundManager.ambient.volume = volume
    if soundManager.ambient.source then
        soundManager.ambient.source:setVolume(soundManager.ambient.volume)
    end
end

function soundManager.playAmbient()
    soundManager.ambient.source:play()
end