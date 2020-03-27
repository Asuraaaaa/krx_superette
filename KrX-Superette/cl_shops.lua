print("^0======================================================================^7")
print("^0[^4Author^0] ^7:^1 KreezoX^7")
print("^0[^3Version^0] ^7:^0 ^01.0^7")
print("^0======================================================================^7")

ESX = nil


Citizen.CreateThread(function()
    while ESX == nil do
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	Citizen.Wait(0)
    end
end)

local blips = {
    {title="Supérette", colour=2, id=52, x = 25.742, y = -1345.741, z = 28.497},
    {title="Supérette", colour=2, id=52, x = -48.283, y = -1757.445, z = 28.497},
    {title="Supérette", colour=2, id=52, x = 373.875,   y = 325.896,  z = 103.566},
    {title="Supérette", colour=2, id=52, x = 2557.458,  y = 382.282,  z = 108.622},
    {title="Supérette", colour=2, id=52, x = -3038.939, y = 585.954,  z = 7.908},
    {title="Supérette", colour=2, id=52, x = -3241.927, y = 1001.462, z = 12.830},
    {title="Supérette", colour=2, id=52, x = 547.431,   y = 2671.710, z = 42.156},
    {title="Supérette", colour=2, id=52, x = 1961.464,  y = 3740.672, z = 32.343},
    {title="Supérette", colour=2, id=52, x = 2678.916,  y = 3280.671, z = 55.241},
    {title="Supérette", colour=2, id=52, x = 1138.302,  y = -984.141,  z = 46.415},
    {title="Supérette", colour=2, id=52, x = -1222.915, y = -906.983,  z = 12.326},
    {title="Supérette", colour=2, id=52, x = -1487.553, y = -379.107,  z = 40.163},
    {title="Supérette", colour=2, id=52, x = -2968.243, y = 390.910,   z = 15.043},
    {title="Supérette", colour=2, id=52, x = 1166.024,  y = 2708.930,  z = 38.157},
    {title="Supérette", colour=2, id=52, x = 1392.562,  y = 3604.684,  z = 34.980},
    {title="Supérette", colour=2, id=52, x = -48.519,   y = -1757.514, z = 29.421},
    {title="Supérette", colour=2, id=52, x = 1163.373,  y = -323.801,  z = 69.205},
    {title="Supérette", colour=2, id=52, x = -707.501,  y = -914.260,  z = 19.215},
    {title="Supérette", colour=2, id=52, x = -1820.523, y = 792.518,   z = 138.118},
    {title="Supérette", colour=2, id=52, x = 1698.388,  y = 4924.404,  z = 42.063},

}




Citizen.CreateThread(function()
    for _, info in pairs(blips) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, 1.0)
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
    end
end)


local Superette = {

    Base = { Title = "Supérette" },
    Data = { currentMenu = "Supérette" },
    Events = {

        onSelected = function(self, _, btn, CMenu, menuData, currentButton, currentSlt, result)
              if btn.name == "Pain" then
                    TriggerServerEvent('KrXSuperette:buy', 2, "bread", "Pain")
              elseif btn.name == "Sandwich" then
                    TriggerServerEvent('KrXSuperette:buy', 4, "sandwich", "Sandwich")
              elseif btn.name == "Hamburger" then
                    TriggerServerEvent('KrXSuperette:buy', 5, "hamburger", "Hamburger")
              elseif btn.name == "Chocolat" then
                    TriggerServerEvent('KrXSuperette:buy', 3, "chocolate", "Chocolat")
              elseif btn.name == "Eau" then
                    TriggerServerEvent('KrXSuperette:buy', 2, "water", "Eau")
              elseif btn.name == "Fanta" then
                    TriggerServerEvent('KrXSuperette:buy', 3, "fanta", "Fanta")
              elseif btn.name == "Coca-Cola" then
                    TriggerServerEvent('KrXSuperette:buy', 3, "cocacola", "Coca-Cola")
              elseif btn.name == "Ice-Tea" then
                    TriggerServerEvent('KrXSuperette:buy', 3, "icetea", "Ice-Tea")




              end
        end,
    },

    Menu = {
        ["Supérette"] = {
            b = {
                {name = "Nourriture", ask = "→", askX = true},
                {name = "Boissons", ask = "→", askX = true},
            }
        },

        ["nourriture"] = {
            b = {
                {name = "Pain", ask = "~g~2$", askX = true},
                {name = "Sandwich", ask = "~g~4$", askX = true},
                {name = "-----------------------------------------------------------------------", ask = "", askX = true},
                {name = "Hamburger", ask = "~g~5$", askX = true},
                {name = "Chocolat", ask = "~g~3$", askX = true},
            }
        },

        ["boissons"] = {
            b = {
                {name = "Eau", ask = "~g~2$", askX = true},
                {name = "Fanta", ask = "~g~3$", askX = true},
                {name = "-----------------------------------------------------------------------", ask = "", askX = true},
                {name = "Coca-Cola", ask = "~g~3$", askX = true},
                {name = "Ice-Tea", ask = "~g~3$", askX = true},
            }
        },



    }
}

local Shops = {
    { x = 25.742, y = -1345.741, z = 28.497},
    { x = 373.875,   y = 325.896,  z = 103.566},
    { x = 2557.458,  y = 382.282,  z = 108.622},
    { x = -3038.939, y = 585.954,  z = 7.908},
    { x = -3241.927, y = 1001.462, z = 12.830},
    { x = 547.431,   y = 2671.710, z = 42.156},
    { x = 1961.464,  y = 3740.672, z = 32.343},
    { x = 2678.916,  y = 3280.671, z = 55.241},
    { x = 1138.302,  y = -984.141,  z = 46.415},
    { x = -1222.915, y = -906.983,  z = 12.326},
    { x = -1487.553, y = -379.107,  z = 40.163},
    { x = -2968.243, y = 390.910,   z = 15.043},
    { x = 1166.024,  y = 2708.930,  z = 38.157},
    { x = 1392.562,  y = 3604.684,  z = 34.980},
    { x = -48.519,   y = -1757.514, z = 29.421},
    { x = 1163.373,  y = -323.801,  z = 69.205},
    { x = -707.501,  y = -914.260,  z = 19.215},
    { x = -1820.523, y = 792.518,   z = 138.118},
    { x = 1698.388,  y = 4924.404,  z = 42.063}
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k in pairs(Shops) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, Shops[k].x, Shops[k].y, Shops[k].z)

            if dist <= 2.0 then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour intéragir avec ~b~APU")
				if IsControlJustPressed(1,51) then 
                    CreateMenu(Superette)
				end
            end
        end
    end
end)

Citizen.CreateThread(function()
    local hash = GetHashKey("mp_m_shopkeep_01")

    while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(20)
    end

    ped = CreatePed("PED_TYPE_CIVMALE", "mp_m_shopkeep_01", 24.139, -1345.705, 28.497, 267.01, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
end)


    