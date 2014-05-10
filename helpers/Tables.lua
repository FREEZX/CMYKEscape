function table.Compare( tbl1, tbl2 )
    for k, v in pairs( tbl1 ) do
        if ( tbl2[k] ~= v ) then return false end
    end
    for k, v in pairs( tbl2 ) do
        if ( tbl1[k] ~= v ) then return false end
    end
    return true
end

function table.Reverse ( tab )
    local size = #tab
    local newTable = {}
 
    for i,v in ipairs ( tab ) do
        newTable[size-i+1] = v
    end
 
    return newTable
end