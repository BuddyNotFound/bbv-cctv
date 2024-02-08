Wrapper.CreateCallback('bbv-rentacar:hasmoney', function(source, cb, money)
    if Config.Settings.Framework == "QB" then 
        local src = source 
        local Player = QBCore.Functions.GetPlayer(src)
        if Player.PlayerData.money.cash >= money then
            Player.Functions.RemoveMoney('cash', money)
            cb(true)
        else
            cb(false)
        end
    end
    if Config.Settings.Framework == "ESX" then 
        local src = source 
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer.getMoney() >= money then
            xPlayer.removeMoney(money)
            cb(true)
        else
            cb(false)
        end
    end
    if Config.Settings.Framework == "ST" then 
        cb(true)
    end
end)

if Config.Settings.Framework == "QB" then 
    if Config.Debug then 
        print("QB LOADED")
    end
    QBCore.Functions.CreateUseableItem(Config.Settings.ItemName, function(source, item)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        if Player.Functions.GetItemByName(item.name) then
            TriggerClientEvent('bbv-cctv:open', src)
        end
    end)
end

if Config.Settings.Framework == "ESX" then 
    if Config.Debug then 
        print("ESX LOADED")
    end
    ESX.RegisterUsableItem(Config.Settings.ItemName, function(source)
        local src = source
        TriggerClientEvent('bbv-cctv:open', src)
        return
    end)
end
