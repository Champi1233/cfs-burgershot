local ESX = nil
isWork = false

if Config.ESX == 'event' then
	Citizen.CreateThread(function()
		while ESX == nil do
			TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
			Citizen.Wait(0)
		end

		while ESX.GetPlayerData().job == nil do
			Citizen.Wait(100)
		end

		ESX.PlayerData = ESX.GetPlayerData()
	end)
else
	ESX = exports["es_extended"]:getSharedObject()
	ESX.PlayerData = ESX.GetPlayerData()
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(playerData)
    ESX.PlayerData = playerData
    if ESX.PlayerData.job and ESX.PlayerData.job.name == Config.Job then
        AddTarget()
    end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
    if ESX.PlayerData.job and ESX.PlayerData.job.name == Config.Job then
        AddTarget()
    end
end)

AddTarget = function()
    Citizen.CreateThread(function()
        if ESX.PlayerData.job and ESX.PlayerData.job.name == Config.Job then
            exports.ox_target:addSphereZone({
                coords = Config.JobMenu, -- ændrer disse koordinater
                size = vec3(1, 1, 1),
                rotation = 257.0,
                debug = false,
                options = {
                    {
                        name = 'open_menu',
                        event = 'cfs-burgershot:goWork',
                        icon = 'fa-solid fa-briefcase',
                        label = 'Tilgå Job Menu'
                    }
                }
            })

            exports.ox_target:addSphereZone({
                coords = Config.Milshake, -- ændrer disse koordinater
                size = vec3(1, 1, 1),
                rotation = 257.0,
                debug = false,
                options = {
                    {
                        name = 'open_menu',
                        event = 'cfs-burgershot:Milshake',
                        icon = 'fa-solid fa-bottle-water',
                        label = 'Tilgå Milshake Maskine'
                    }
                }
            })

            exports.ox_target:addSphereZone({
                coords = Config.Koleskab, -- ændrer disse koordinater
                size = vec3(1, 1, 1),
                rotation = 257.0,
                debug = false,
                options = {
                    {
                        name = 'open_menu',
                        event = 'cfs-burgershot:fridge',
                        icon = 'fa-solid fa-folder',
                        label = 'Tilgå Køleskab'
                    }
                }
            })

            exports.ox_target:addSphereZone({
                coords = Config.Pommes, -- ændrer disse koordinater
                size = vec3(1, 1, 1),
                rotation = 257.0,
                debug = false,
                options = {
                    {
                        name = 'open_menu',
                        event = 'cfs-burgershot:fries',
                        icon = 'fa-solid fa-f',
                        label = 'Lav Pommes Frites'
                    }
                }
            })

            exports.ox_target:addSphereZone({
                coords = Config.Burger, -- ændrer disse koordinater
                size = vec3(1, 1, 1),
                rotation = 257.0,
                debug = false,
                options = {
                    {
                        name = 'open_menu',
                        event = 'cfs-burgershot:burger',
                        icon = 'fa-solid fa-burger',
                        label = 'Lav en Burger'
                    }
                }
            })

            exports.ox_target:addSphereZone({
                coords = Config.Opskrift, -- ændrer disse koordinater
                size = vec3(1, 1, 1),
                rotation = 257.0,
                debug = false,
                options = {
                    {
                        name = 'open_menu',
                        event = 'cfs-burgershot:ingredienser',
                        icon = 'fa-solid fa-clipboard',
                        label = 'Åben din opskrift bog'
                    }
                }
            })
        else
            return
        end
    end)
end

Citizen.CreateThread(function()
    if ESX.PlayerData.job and ESX.PlayerData.job.name == Config.Job then
        exports.ox_target:addSphereZone({
            coords = Config.JobMenu, -- ændrer disse koordinater
            size = vec3(1, 1, 1),
            rotation = 257.0,
            debug = false,
            options = {
                {
                    name = 'open_menu',
                    event = 'cfs-burgershot:goWork',
                    icon = 'fa-solid fa-briefcase',
                    label = 'Tilgå Job Menu'
                }
            }
        })

        exports.ox_target:addSphereZone({
            coords = Config.Milshake, -- ændrer disse koordinater
            size = vec3(1, 1, 1),
            rotation = 257.0,
            debug = false,
            options = {
                {
                    name = 'open_menu',
                    event = 'cfs-burgershot:Milshake',
                    icon = 'fa-solid fa-bottle-water',
                    label = 'Tilgå Milshake Maskine'
                }
            }
        })

        exports.ox_target:addSphereZone({
            coords = Config.Koleskab, -- ændrer disse koordinater
            size = vec3(1, 1, 1),
            rotation = 257.0,
            debug = false,
            options = {
                {
                    name = 'open_menu',
                    event = 'cfs-burgershot:fridge',
                    icon = 'fa-solid fa-folder',
                    label = 'Tilgå Køleskab'
                }
            }
        })

        exports.ox_target:addSphereZone({
            coords = Config.Pommes, -- ændrer disse koordinater
            size = vec3(1, 1, 1),
            rotation = 257.0,
            debug = false,
            options = {
                {
                    name = 'open_menu',
                    event = 'cfs-burgershot:fries',
                    icon = 'fa-solid fa-f',
                    label = 'Lav Pommes Frites'
                }
            }
        })

        exports.ox_target:addSphereZone({
            coords = Config.Burger, -- ændrer disse koordinater
            size = vec3(1, 1, 1),
            rotation = 257.0,
            debug = false,
            options = {
                {
                    name = 'open_menu',
                    event = 'cfs-burgershot:burger',
                    icon = 'fa-solid fa-burger',
                    label = 'Lav en Burger'
                }
            }
        })

        exports.ox_target:addSphereZone({
            coords = Config.Opskrift, -- ændrer disse koordinater
            size = vec3(1, 1, 1),
            rotation = 257.0,
            debug = false,
            options = {
                {
                    name = 'open_menu',
                    event = 'cfs-burgershot:ingredienser',
                    icon = 'fa-solid fa-clipboard',
                    label = 'Åben din opskrift bog'
                }
            }
        })
    else
        return
    end
end)

RegisterNetEvent('cfs-burgershot:goWork', function()
    if isWork == false then
        lib.registerContext({
            id = 'job_menu',
            title = 'Job Menu',
            onExit = function()
            end,
            options = {
                {
                    title = 'Gå på job',
                    onSelect = function(args)
                        isWork = true
                        lib.notify({
                            title = '',
                            description = 'Du gik på job!',
                            type = 'inform'
                        })
                    end
                }
            }
        })
        lib.showContext('job_menu')
    else
        lib.registerContext({
            id = 'job_menu',
            title = 'Job Menu',
            onExit = function()
            end,
            options = {
                {
                    title = 'Gå af job',
                    onSelect = function(args)
                        isWork = false
                        lib.notify({
                            title = '',
                            description = 'Du gik af job!',
                            type = 'inform'
                        })
                    end
                }
            }
        })
        lib.showContext('job_menu')
    end
end)

isMilshake = false

RegisterNetEvent('cfs-burgershot:Milshake', function()
    if isWork == true then
        if isMilshake == false then
            isMilshake = true
            ExecuteCommand('e uncuff')
            FreezeEntityPosition(PlayerPedId(), true)
            exports['progressBars']:startUI(6000, "Laver Milshake")
            Citizen.Wait(6000)
            FreezeEntityPosition(PlayerPedId(), false)
            ClearPedTasksImmediately(PlayerPedId())
            TriggerServerEvent('cfs-burgershot:addItemMilshake', 1)
            isMilshake = false
        else
            lib.notify({
                title = '',
                description = 'Du kan kun gøre en ting afgangen.',
                type = 'error'
            })
        end
    else
        lib.notify({
            title = '',
            description = Config.dontWorkNotify,
            type = 'error'
        })
    end
end)

RegisterNetEvent('cfs-burgershot:fridge', function()
    if isWork == true then
        lib.registerContext({
            id = 'fridge_menu',
            title = 'Køleskab',
            onExit = function()
            end,
            options = {
                {
                    title = 'Burgerbrød',
                    icon = 'bread-slice',
                    onSelect = function(args)
                        local input = lib.inputDialog('Hvor mange Burgerbrød vil du tage?', {''})
                        TriggerServerEvent('cfs-burgershot:addItemBurgerbrød', input[1])
                    end
                },
                {
                    title = 'Ost',
                    icon = 'cheese',
                    onSelect = function(args)
                        local input = lib.inputDialog('Hvor mange stykker Ost vil du tage?', {''})
                        TriggerServerEvent('cfs-burgershot:addItemOst', input[1])
                    end
                },
                {
                    title = 'Bøf',
                    icon = 'cow',
                    onSelect = function(args)
                        local input = lib.inputDialog('Hvor mange Bøffer vil du tage?', {''})
                        TriggerServerEvent('cfs-burgershot:addItemBof', input[1])
                    end
                },
                {
                    title = 'Salat',
                    icon = 'pepper-hot',
                    onSelect = function(args)
                        local input = lib.inputDialog('Hvor mange Salatblade vil du tage?', {''})
                        TriggerServerEvent('cfs-burgershot:addItemSalat', input[1])
                    end
                },
                {
                    title = 'Olie',
                    icon = 'oil-well',
                    onSelect = function(args)
                        local input = lib.inputDialog('Hvor mange mm Olie vil du tage?', {''})
                        TriggerServerEvent('cfs-burgershot:addItemOlie', input[1])
                    end
                },
                {
                    title = 'Salt',
                    icon = 'caret-up',
                    onSelect = function(args)
                        local input = lib.inputDialog('Hvor meget Salt vil du tage?', {''})
                        TriggerServerEvent('cfs-burgershot:addItemSalt', input[1])
                    end
                },
            }
        })
        lib.showContext('fridge_menu')
    else
        lib.notify({
            title = '',
            description = Config.dontWorkNotify,
            type = 'error'
        })
    end
end)

RegisterNetEvent('cfs-burgershot:fries', function()
    if isWork == true then
        TriggerServerEvent('cfs-burgershot:friesMake')
    else
        lib.notify({
            title = '',
            description = Config.dontWorkNotify,
            type = 'error'
        })
    end
end)

RegisterNetEvent('cfs-burgershot:showProgressbar:fries', function(data)
    exports['progressBars']:startUI(10000, "Ryster Pommes")
end)

      
Citizen.CreateThread(function()

    for _, info in pairs(Config.blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.7)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

RegisterNetEvent('cfs-burgershot:burger', function()
    if isWork == true then
        TriggerServerEvent('cfs-burgershot:burgerMake')
    else
        lib.notify({
            title = '',
            description = Config.dontWorkNotify,
            type = 'error'
        })
    end
end)

RegisterNetEvent('cfs-burgershot:freeze:burger', function(data)
    FreezeEntityPosition(PlayerPedId(), true)
    ExecuteCommand('e bbq')
    Citizen.Wait(20000)
    FreezeEntityPosition(PlayerPedId(), false)
    ClearPedTasksImmediately(PlayerPedId())
end)

RegisterNetEvent('cfs-burgershot:showProgressbar:burger', function(data)
    exports['progressBars']:startUI(20000, "Laver Burger")
end)

RegisterNetEvent('cfs-burgershot:ingredienser', function()
    if isWork == true then
        lib.registerContext({
            id = 'job_menu',
            title = 'Kogebog',
            onExit = function()
            end,
            options = {
                {
                    title = 'Burger',
                    description = 'Du skal bruge 2 Burgerboller, 2 Salatbalde, 2 Oste skiver og 1 Bøf.'
                },
                {
                    title = 'Pommes Frites',
                    description = 'Du skal bruge 7 dl Olie og 5 gram salt.'
                }
            }
        })
        lib.showContext('job_menu')
    else
        lib.notify({
            title = '',
            description = Config.dontWorkNotify,
            type = 'error'
        })
    end
end)

Citizen.CreateThread(function()
    local control = 167 --[[F6 | https://docs.fivem.net/docs/game-references/controls/]]
    while true do --[[Constant Loop]]
        if isWork == true then
            if IsControlJustPressed(0, control) and ESX.PlayerData.job.name == Config.Job then
                pressedKey() --[[Call the function]]
                    Citizen.Wait(50)
                else
                    Citizen.Wait(50)
            end
        end
        Citizen.Wait(50)
    end
end)

function pressedKey()
    lib.registerContext({
        id = 'job_menu',
        title = 'Burgershot',
        onExit = function()
        end,
        options = {
            {
                title = 'Faktura',
                icon = 'money-bills',
                onSelect = function()
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer ~= -1 and closestDistance <= 3.0 then
                        TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_'..Config.Job..'', 'Burgershot', amount)
                    else
                        lib.notify({
                            title = '',
                            description = 'Ingen spillere i nærheden',
                            type = 'error'
                        })
                    end
                end,
            },
        }
    })
    lib.showContext('job_menu')
end
