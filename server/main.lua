local ESX = nil

if Config.ESX == 'event' then
	Citizen.CreateThread(function()
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	end)
else
	ESX = exports["es_extended"]:getSharedObject()
end

RegisterServerEvent("cfs-burgershot:addItemMilshake") 
AddEventHandler('cfs-burgershot:addItemMilshake', function(data)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem(Config.Items.Milshake, data)
end)

RegisterServerEvent("cfs-burgershot:addItemBurgerbrød") 
AddEventHandler('cfs-burgershot:addItemBurgerbrød', function(data)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem(Config.Items.Burgerbolle, data)
end)

RegisterServerEvent("cfs-burgershot:addItemOst") 
AddEventHandler('cfs-burgershot:addItemOst', function(data)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem(Config.Items.Ost, data)
end)

RegisterServerEvent("cfs-burgershot:addItemBof") 
AddEventHandler('cfs-burgershot:addItemBof', function(data)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem(Config.Items.Bof, data)
end)

RegisterServerEvent("cfs-burgershot:addItemSalat") 
AddEventHandler('cfs-burgershot:addItemSalat', function(data)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem(Config.Items.Salat, data)
end)

RegisterServerEvent("cfs-burgershot:addItemOlie") 
AddEventHandler('cfs-burgershot:addItemOlie', function(data)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem(Config.Items.Olie, data)
end)

RegisterServerEvent("cfs-burgershot:addItemSalt") 
AddEventHandler('cfs-burgershot:addItemSalt', function(data)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem(Config.Items.Salt, data)
end)

local igangF = false

RegisterServerEvent("cfs-burgershot:friesMake", function() 
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getInventoryItem(Config.Items.Olie).count >= 7 and xPlayer.getInventoryItem(Config.Items.Salt).count >= 5 then
        if igangF == false then
            igangF = true
            TriggerClientEvent('cfs-burgershot:freeze:fries', source)
            xPlayer.removeInventoryItem(Config.Items.Olie, 7)
            xPlayer.removeInventoryItem(Config.Items.Salt, 5)
            TriggerClientEvent('cfs-burgershot:showProgressbar:fries', source, {10000, "Ryster Pommes"})
            Wait(10000)
            xPlayer.addInventoryItem(Config.Items.Pomfritter, 1)
            igangF = false
        else
            TriggerClientEvent('ox_lib:notify', source, ({
                title = '',
                description = 'Du kan kun gøre en ting afgangen.',
                type = 'error'
            }))
        end
    else
        TriggerClientEvent('ox_lib:notify', source, ({
            title = '',
            description = 'Du mangler dine ingredienser',
            type = 'error'
        }))
    end
end)

local igangB = false

RegisterServerEvent("cfs-burgershot:burgerMake", function() 
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getInventoryItem(Config.Items.Salat).count >= 2 and xPlayer.getInventoryItem(Config.Items.Bof).count >= 1 and xPlayer.getInventoryItem(Config.Items.Burgerbolle).count >= 2 and xPlayer.getInventoryItem(Config.Items.Ost).count >= 2 then
        if igangB == false then
            igangB = true
            TriggerClientEvent('cfs-burgershot:freeze:burger', source)
            xPlayer.removeInventoryItem(Config.Items.Salat, 2)
            xPlayer.removeInventoryItem(Config.Items.Bof, 1)
            xPlayer.removeInventoryItem(Config.Items.Burgerbolle, 2)
            xPlayer.removeInventoryItem(Config.Items.Ost, 2)
            TriggerClientEvent('cfs-burgershot:showProgressbar:burger', source, {10000, "Tester"})
            Wait(20000)
            xPlayer.addInventoryItem(Config.Items.Burger, 1)
            igangB = false
        else
            TriggerClientEvent('ox_lib:notify', source, ({
                title = '',
                description = 'Du kan kun gøre en ting afgangen.',
                type = 'error'
            }))
        end
    else
        TriggerClientEvent('ox_lib:notify', source, ({
            title = '',
            description = 'Du mangler dine ingredienser',
            type = 'error'
        }))
    end
end)