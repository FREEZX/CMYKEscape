function mouseInRect(mousePos, rectPos, rectSize)
    return (mousePos[1] > rectPos[1] and mousePos[1] < rectPos[1] + rectSize[1])
        and (mousePos[2] > rectPos[2] and mousePos[2] < rectPos[2] + rectSize[2])
end