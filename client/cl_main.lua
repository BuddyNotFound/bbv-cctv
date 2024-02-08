Main = {}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	ESX.PlayerLoaded = true
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

RegisterNUICallback('PreviewInformation', function(data)
    local id = tonumber(data.id) + 1
    local CamPos = Config.CCTV[id].pos
    if Config.CCTV[id].enabled then
        Main:OpenCam(CamPos)
    else
        Main:Notify("Camera is unavailable")
    end
end)

RegisterKeyMapping(Config.Settings.OpenCommand, 'CCTV Tablet', 'keyboard', Config.Settings.OpenKey)

RegisterNetEvent('bbv-cctv:open',function()
    if Main:HasJob(Config.Settings.Job) then 
        ExecuteCommand('e tablet')
        Wait(800)
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = 'OpenCamUI',
        })
    else
        Main:Notify("You don't have permission to use that")
    end
end)

RegisterCommand(Config.Settings.OpenCommand, function()
    if not Config.Settings.CommandEnabled then return end
    if Config.Settings.Framework ~= "ST" then  
        if Main:HasJob(Config.Settings.Job) then 
            ExecuteCommand('e tablet')
            Wait(800)
            SetNuiFocus(true, true)
            SendNUIMessage({
                action = 'OpenCamUI',
            })
        else
            Main:Notify("You don't have permission to use that")
        end
    else
        ExecuteCommand('e tablet')
        Wait(800)
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = 'OpenCamUI',
        })
    end
end)

function Main:OpenCam(coords)
    DoScreenFadeOut(1000)
    Wait(2000)
    self.cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
    RenderScriptCams(true, 1, 1,  true,  true)
    SetFocusArea(coords)
    self:processCamera(coords)
end

function Main:processCamera(coords)
    SetCamCoord(self.cam, coords.x,coords.y,coords.z - 1.5)
	SetCamFov(self.cam, 90.0)
    FreezeEntityPosition(PlayerPedId(),true)
    DoScreenFadeIn(1000)
    while Main.cam ~= nil do 
        Wait(0)
        local instructions = CreateInstuctionScaleform("instructional_buttons")
        DrawScaleformMovieFullscreen(instructions, 255, 255, 255, 255, 0)
        SetTimecycleModifier("scanline_cam_cheap")
        SetTimecycleModifierStrength(2.0)
        DisplayRadar(false)
        local getCameraRot = GetCamRot(Main.cam,2)
        if IsControlJustReleased(0,177) then
            RenderScriptCams(false, 1, 1,  true,  true)
            DestroyCam(Main.cam)
            Main.cam = nil
            ClearTimecycleModifier("scanline_cam_cheap")
            SetFocusEntity(GetPlayerPed(PlayerId()))
            DisplayRadar(true)
            FreezeEntityPosition(GetPlayerPed(PlayerId()), false)
        end
        if IsControlPressed(1, 32) then
            if getCameraRot.x <= 0.0 then
                SetCamRot(Main.cam, getCameraRot.x + 0.7, 0.0, getCameraRot.z, 2)
            end
        end

        if IsControlPressed(1, 33) then
            if getCameraRot.x >= -50.0 then
                SetCamRot(Main.cam, getCameraRot.x - 0.7, 0.0, getCameraRot.z, 2)
            end
        end
        if IsControlPressed(1, 34) then
            SetCamRot(Main.cam, getCameraRot.x, 0.0, getCameraRot.z + 0.7, 2)
        end
        if IsControlPressed(1, 35) then
            SetCamRot(Main.cam, getCameraRot.x, 0.0, getCameraRot.z - 0.7, 2)
        end
    end
end

function Main:CloseCam(time)
    DestroyCam(self.cam, 0)
    RenderScriptCams(false, 1, time,  true,  true)
    self.Main = 0
    ClearTimecycleModifier("scanline_cam_cheap")
    SetFocusEntity(GetPlayerPed(PlayerId()))
    DisplayRadar(true)
    FreezeEntityPosition(GetPlayerPed(PlayerId()), false)
    SetFocusEntity(GetPlayerPed(PlayerId()))
end

function CreateInstuctionScaleform(scaleform)
    local scaleform = RequestScaleformMovie(scaleform)
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    PushScaleformMovieFunction(scaleform, "CLEAR_ALL")
    PopScaleformMovieFunctionVoid()
    
    PushScaleformMovieFunction(scaleform, "SET_CLEAR_SPACE")
    PushScaleformMovieFunctionParameterInt(200)
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(0)
    InstructionButton(GetControlInstructionalButton(1, 34, true))
    InstructionButtonMessage("Move Left")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(1)
    InstructionButton(GetControlInstructionalButton(1, 35, true))
    InstructionButtonMessage("Move Right")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(2)
    InstructionButton(GetControlInstructionalButton(1, 32, true))
    InstructionButtonMessage("Move Up")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(3)
    InstructionButton(GetControlInstructionalButton(1, 31, true))
    InstructionButtonMessage("Move Down")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(4)
    InstructionButton(GetControlInstructionalButton(1, 177, true))
    InstructionButtonMessage("Exit")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_BACKGROUND_COLOUR")
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(80)
    PopScaleformMovieFunctionVoid()

    return scaleform
end

function InstructionButton(ControlButton)
    N_0xe83a3e3557a56640(ControlButton)
end

function InstructionButtonMessage(text)
    BeginTextCommandScaleformString("STRING")
    AddTextComponentScaleform(text)
    EndTextCommandScaleformString()
end

function Main:HasJob(data)
    if Config.Settings.Framework == "ST" then 
        return true
    end
    if Config.Settings.Framework == "QB" then 
        QBCore.Functions.GetPlayerData(function(PlayerData)
            pj = PlayerData.job.name
        end)
    end
    if Config.Settings.Framework == "ESX" then 
        pj = ESX.PlayerData.job.name
    end    
    Wait(100)
    for k,v in pairs(data) do 
        if v == pj then 
            return true 
        end
    end
end

function Main:Notify(txt) 
    SetNotificationTextEntry('STRING')
    AddTextComponentString(txt)
    DrawNotification(0,1)  
end