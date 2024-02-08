
Wrapper = {
    resname = GetCurrentResourceName(),
    object = {},
    ServerCallbacks = {}
}

-- RESETS

AddEventHandler("onResourceStop", function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    for k,v in pairs(Wrapper.object) do 
        DeleteObject(v)
    end
end)

-- ^ RESETS

function Wrapper:LoadModel(model) -- Load Model
    local modelHash = model
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
      Wait(0)
    end
end

function Wrapper:CreateObject(id,prop,coords,network,misson) -- Create object / prop
    Wrapper.object[id] = CreateObject(GetHashKey(prop), coords.x,coords.y,coords.z - 1, network or false,misson or false)
    SetEntityHeading(Wrapper.object[id], coords.w - 180.0)
    FreezeEntityPosition(Wrapper.object[id], true)
    SetEntityAsMissionEntity(Wrapper.object[id], true, true)
    if Config.Debug then 
        SetEntityDrawOutline(Wrapper.object[id],true)
    end
end

function Wrapper:DeleteObject(id)
    DeleteObject(Wrapper.object[id])
end

-- ^ OBJECT
