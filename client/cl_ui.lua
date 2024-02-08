CreateThread(function()
    Wait(1000)
    LoadConfigCams()
end)

--// Functions \\ -- UI BUILD BY NEENGAME

function RentACar(bool)
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'OpenCamUI',
    })
end

function CloseUi()
    SendNUIMessage({
        action = 'CloseCamUI',
    })
    SetNuiFocus(false, false)
    ClearPedTasksImmediately(PlayerPedId())
    ExecuteCommand('e c')
end

function LoadConfigCams()
    SendNUIMessage({
        action = 'LoadCams',
        Cams = Config.CCTV
    })
    for k,v in pairs(Config.CCTV) do 
        Wrapper:CreateObject(k..'-cctv',Config.Settings.CamProp,v.pos,true,true)
    end
end

--// NuiCallbacks \\--

RegisterNUICallback('CloseCamUI', function()
    CloseUi()
end)
