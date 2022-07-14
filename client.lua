
local v1 = vector3(2045.98, 3447.95, 44.86)
local v2 = vector2(2045.98, 3449.83)
local v3 = vector4(2045.98, 3447.95, 44.86, 360)

local blip = AddBlipForCoord(v2.x, v2.y)
SetBlipSprite(blip, 364)
SetBlipDisplay(blip, 6)
SetBlipScale(blip, 0.9)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString("Spawn")
EndTextCommandSetBlipName(blip)

RegisterCommand(
    "Spawn",
    function(source, args)
        SetEntityCoords(PlayerPedId(), v3.x, v3.y, v3.z, true, true, true, false)
        SetEntityHeading(PlayerPedId(), v3.w)
    end
)

function Draw3DText(x, y, z, scl_factor, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov * scl_factor
    if onScreen then
        SetTextScale(0.0, scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end

local distance_until_text_disappears = 5000

Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(0)
            if Vdist2(GetEntityCoords(PlayerPedId(), false), v1) < distance_until_text_disappears then
                Draw3DText(v1.x, v1.y, v1.z, 1.5, "CHANGEME!")
            end
        end
    end
)