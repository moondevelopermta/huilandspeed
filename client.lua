local screenW,screenH = guiGetScreenSize()
local px,py = 1680,1050
local x,y = (screenW/px), (screenH/py)

local sizeX,sizeY = 350*px,350*px
local posX,posY = screenW-sizeX,screenH-sizeY
local font = dxCreateFont("files/Speedometr.ttf",100*px)
local font1 = dxCreateFont("files/Speedometr.ttf",70)
local font2 = dxCreateFont("files/Font.ttf",30)
local font3 = dxCreateFont("files/Font.ttf",24)
local hide = false

--local fontrules = dxCreateFont ( 'files/font.ttf', 16 * px, false, 'cleartype' );

function spidak()
    local veh = getPedOccupiedVehicle(localPlayer)
	if hide then return end 
    if not veh then return true end
	
    local vehs = math.floor(getElementSpeed(getPedOccupiedVehicle(getLocalPlayer()), "kmh"))
	-----------------------------------------------===============================================================================
	if getElementModel(veh) == 538 then
		vehs = math.floor ( vehs * 0.9 );
	else
		vehs = math.floor ( vehs * 1 );
	end
	if vehs < 0 then vehs = 0 end
    -----------------------------------------------===============================================================================
	local cfuel = math.ceil((getElementData(veh,'fuel') or 15))
    local mfuel = (getElementData(veh,'maxFuel') or 100)

    --dxDrawText("L", screenW - 233,screenH - 170, screenW -25, screenH - 25, tocolor(147,112,219,255), 0.5, font3,"left","center")
    --dxDrawText("B", screenW - 207,screenH - 170, screenW -25, screenH - 25, tocolor(147,112,219,255), 0.5, font3,"left","center")
    --dxDrawText("Z", screenW - 181,screenH - 170, screenW -25, screenH - 25, tocolor(147,112,219,255), 0.5, font3,"left","center")
    --dxDrawText("X", screenW - 100,screenH - 230, screenW -25, screenH - 25, tocolor(147,112,219,255), 0.5, font3,"left","center")

    if getPedOccupiedVehicleSeat(localPlayer) == 0 then
    local movepartveh = {529,561,558,421,504,479}
	for i = 0, #movepartveh do 
        if getElementModel(veh) == movepartveh[i] then
            dxDrawRectangle ( screenW - 299,screenH - 40, 30, 25, tocolor ( 0, 0, 0, 100 ), false );
            dxDrawText("N", screenW - 543,screenH - 31, screenW -25, screenH - 25, tocolor(250,250,250,150), 0.5, font2,"center","center")
            dxDrawText("Спец.действие", screenW - 430,screenH - 31, screenW -25, screenH - 25, tocolor(250,250,250,150), 0.5, font3,"left","center")
        end
    end
end

    if getPedOccupiedVehicleSeat(localPlayer) == 0 then
        local drivetypeveh = {529,596}
        for i = 0, #drivetypeveh do 
            if getElementModel(veh) == drivetypeveh[i] then
                if getElementData(localPlayer,"drivetype") == "off" then
                    dxDrawRectangle ( screenW - 299,screenH - 70, 30, 25, tocolor ( 147,112,219, 100 ), false );
                    dxDrawText("C", screenW - 543,screenH - 90, screenW -25, screenH - 25, tocolor(250,250,250,150), 0.5, font2,"center","center")
                    dxDrawText("RWD", screenW - 345,screenH - 90, screenW -25, screenH - 25, tocolor(250,250,250,150), 0.5, font3,"left","center")
                else
                    dxDrawRectangle ( screenW - 299,screenH - 70, 30, 25, tocolor ( 0, 0, 0, 100 ), false );
                    dxDrawText("C", screenW - 543,screenH - 90, screenW -25, screenH - 25, tocolor(250,250,250,150), 0.5, font2,"center","center")
                    dxDrawText("AWD", screenW - 345,screenH - 90, screenW -25, screenH - 25, tocolor(250,250,250,150), 0.5, font3,"left","center")
                end
            end
        end
    end


--[[local vehicles = {429,445}
for i = 0, #vehicles do 
	if getElementModel(veh) == vehicles[i] then
    	--dxDrawImage(screenW - 585,screenH - 185, 616, 200,"files/Hud.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)
    	local vehiclesold = {429} -- старые поворотники
		for i = 0, #vehiclesold do 
		if getElementModel(veh) == vehiclesold[i] then
    		local veh = getPedOccupiedVehicle(localPlayer)
    		if getElementData(veh, 'allflash') or getElementData(veh, 'provtex_turn_l') or getElementData(veh, 'provtex_turn_r') then
    			dxDrawRectangle ( screenW - 352,screenH - 38, 25, 25, tocolor ( 147,112,219,100 ), false );
    			dxDrawRectangle ( screenW - 323,screenH - 38, 25, 25, tocolor ( 147,112,219,100 ), false );
    			dxDrawRectangle ( screenW - 294,screenH - 38, 25, 25, tocolor ( 147,112,219,100 ), false );
    		else
    			dxDrawRectangle ( screenW - 352,screenH - 38, 25, 25, tocolor ( 0, 0, 0, 100 ), false );
    			dxDrawRectangle ( screenW - 323,screenH - 38, 25, 25, tocolor ( 0, 0, 0, 100 ), false );
    			dxDrawRectangle ( screenW - 294,screenH - 38, 25, 25, tocolor ( 0, 0, 0, 100 ), false );
    			end
    		dxDrawText("]", screenW - 653,screenH - 26, screenW -25, screenH - 25, tocolor(250,250,250,150), 0.5, font2,"center","center")
    		dxDrawText("O", screenW - 596,screenH - 26, screenW -25, screenH - 25, tocolor(250,250,250,150), 0.5, font2,"center","center")
    		dxDrawText("[", screenW - 539,screenH - 26, screenW -25, screenH - 25, tocolor(250,250,250,150), 0.5, font2,"center","center")
    		dxDrawText("Использование поворотников", screenW - 610,screenH - 28, screenW -25, screenH - 25, tocolor(250,250,250,150), 0.5, font3,"left","center")
   			end
		end

    	local vehiclesnew = {445} -- новые поворотники
		for i = 0, #vehiclesnew do 
		if getElementModel(veh) == vehiclesnew[i] then
    		local veh = getPedOccupiedVehicle(localPlayer)
    		if getElementData(veh, 'turn_left') or getElementData(veh, 'turn_right') or getElementData(veh, 'emergency_light') then
    			dxDrawRectangle ( screenW - 352,screenH - 38, 25, 25, tocolor ( 147,112,219,100 ), false );
    			dxDrawRectangle ( screenW - 323,screenH - 38, 25, 25, tocolor ( 147,112,219,100 ), false );
    			dxDrawRectangle ( screenW - 294,screenH - 38, 25, 25, tocolor ( 147,112,219,100 ), false );
    		else
    			dxDrawRectangle ( screenW - 352,screenH - 38, 25, 25, tocolor ( 0, 0, 0, 100 ), false );
    			dxDrawRectangle ( screenW - 323,screenH - 38, 25, 25, tocolor ( 0, 0, 0, 100 ), false );
    			dxDrawRectangle ( screenW - 294,screenH - 38, 25, 25, tocolor ( 0, 0, 0, 100 ), false );
    			end
    		dxDrawText("<", screenW - 653,screenH - 26, screenW -25, screenH - 25, tocolor(250,250,250,150), 0.5, font2,"center","center")
    		dxDrawText(".", screenW - 596,screenH - 26, screenW -25, screenH - 25, tocolor(250,250,250,150), 0.5, font2,"center","center")
    		dxDrawText(">", screenW - 539,screenH - 26, screenW -25, screenH - 25, tocolor(250,250,250,150), 0.5, font2,"center","center")
    		dxDrawText("Использование поворотников", screenW - 610,screenH - 28, screenW -25, screenH - 25, tocolor(250,250,250,150), 0.5, font3,"left","center") 
   			end
		end

    	dxDrawRectangle ( screenW - 299,screenH - 70, 30, 25, tocolor ( 0, 0, 0, 100 ), false );
    	dxDrawText("F5", screenW - 543,screenH - 90, screenW -25, screenH - 25, tocolor(250,250,250,150), 0.5, font2,"center","center")
    	dxDrawText("Ограничение скорости", screenW - 495,screenH - 93, screenW -25, screenH - 25, tocolor(250,250,250,150), 0.5, font3,"left","center")

    	--dxDrawRectangle ( screenW - 299,screenH - 102, 30, 25, tocolor ( 0, 0, 0, 100 ), false );
    	--dxDrawText("N", screenW - 543,screenH - 155, screenW -25, screenH - 25, tocolor(250,250,250,150), 0.5, font2,"center","center")
    	--dxDrawText("Спец.действие", screenW - 430,screenH - 155, screenW -25, screenH - 25, tocolor(250,250,250,150), 0.5, font3,"left","center")
    end
end]]

    dxDrawImage(screenW - 290,screenH - 100, 288, 106,"files/rear1.png",0.0,0.0,0.0,tocolor(255,255,255),false)

    if ( getVehicleEngineState (veh) == true ) then -- Индикатор двигателя.
        --dxDrawImage(screenW - 193,screenH - 100, 40, 40,"files/engine.png",0.0,0.0,0.0,tocolor(255,255,255),false)
    else
        --dxDrawImage(screenW - 193,screenH - 100, 40, 40,"files/engine.png",0.0,0.0,0.0,tocolor(54,54,54),false)
    end

    
    if getVehicleOverrideLights ( veh ) ~= 2 then -- Индикатор света.
        --dxDrawImage(screenW - 247,screenH - 97, 40, 40,"files/light.png",0.0,0.0,0.0,tocolor(54,54,54,255),false)
    else
       -- dxDrawImage(screenW - 247,screenH - 97, 40, 40,"files/light.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)
    end
    
    if ccEnabled then -- Индикатор круиза.
        --dxDrawImage(screenW - 153,screenH - 132, 59, 40,"files/cruise.png",0,0,0,tocolor(255,255,255))
    else
        --dxDrawImage(screenW - 153,screenH - 132, 59, 40,"files/cruise.png",0,0,0,tocolor(54,54,54))
    end
    
    if vehs <= 1 then
        dxDrawText(tostring ( getFormatSpeed ( vehs )),screenW - 1,  screenH + 30, screenW - 130, screenH - 130, tocolor(54,54,54,255), 0.3, font,"center","center")
    end
    if vehs >= 1 then
        dxDrawText(tostring ( getFormatSpeed ( vehs )),screenW - 1,  screenH + 30, screenW - 130, screenH - 130, tocolor(255,255,255,255), 0.3, font,"center","center")
    end
    if vehs >= 59 then
        dxDrawText(tostring ( getFormatSpeed ( vehs )),screenW - 1,  screenH + 30, screenW - 130, screenH - 130, tocolor(255,255,255,255), 0.3, font,"center","center")
    end
    if vehs >= 80 then
        dxDrawText(tostring ( getFormatSpeed ( vehs )),screenW - 1,  screenH + 30, screenW - 130, screenH - 130, tocolor(255,255,255,255), 0.3, font,"center","center")
    end
    
    dxDrawText(tostring ( getFormatFuel ( cfuel )),screenW - 200,  screenH + 10, screenW - 130, screenH - 105, tocolor(255,255,255,255), 0.4, font1,"center","center")
	
	if getElementModel(veh) == 443 or getElementModel(veh) == 582 then
		if cfuel <= 5 then
			dxDrawImage(screenW - 190,screenH - 55, 32, 32,"files/electro.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)
		end
		if cfuel >= 6 then
			dxDrawImage(screenW - 190,screenH - 55, 32, 32,"files/electro.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)
		end
	else
		if cfuel <= 5 then
			dxDrawImage(screenW - 220,screenH - 65, 30, 30,"files/benzin.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)
		end
		if cfuel >= 6 then
			dxDrawImage(screenW - 220,screenH - 65, 30, 30,"files/benzin.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)
		end
	end
end
addEventHandler("onClientRender", root, spidak)

function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
    if type( sEventName ) == 'string' and isElement( pElementAttachedTo ) and type( func ) == 'function' then
        local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
        if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
            for i, v in ipairs( aAttachedFunctions ) do
                if v == func then
                    return true
                end
            end
        end
    end
    return false
end

addCommandHandler("showspeed",
function(player, cmd)
    hide = not hide
end)

function dxLimit()
	if hide then return end
    --dxDrawImage(screenW - 175,screenH - 160, 190, 190,"files/limit.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)
end

--[[bindKey("F5", "down", function()
    local veh = getPedOccupiedVehicle(getLocalPlayer())
	
    if veh and getVehicleController(veh) == localPlayer then
        if not isVisible then
            addEventHandler("onClientRender", root, dxLimit)
            --outputChatBox('Включено ограничение скорости.',0,255,0,true)
            exports.provincex_alert:alert ( '#EEE8AAВы #00BFFFвключили #EEE8AAограничение скорости.' );
			triggerServerEvent("limit", localPlayer, veh)
        else
			local vehTable = getVehicleHandling(veh)
			local value = vehTable[property]
            removeEventHandler("onClientRender", root, dxLimit)
            --utputChatBox('Ограничение скорости выключено.',255,0,0,true)
            exports.provincex_alert:alert ( '#EEE8AAВы #00BFFFвыключили #EEE8AAограничение скорости.' );
			triggerServerEvent("limit_off", localPlayer, value, veh)
        end
        isVisible = not isVisible
    end
end)]]

---------------------------------- Ремень

local key = "B"          --клавиша пристегнуть/отстегнуть ремень
local interval = 1.05     --интервал между пиканьем когда ремень отстегнут в секундах

local moto = { [522]=true,[521]=true,[461]=true,[462]=true,[463]=true,[586]=true,[581]=true,[468]=true,[471]=true,[523]=true,[448]=true,[481]=true,[510]=true,[509]=true }
local boat = { [430]=true,[446]=true,[452]=true,[453]=true,[454]=true,[472]=true,[473]=true,[484]=true,[493]=true,[595]=true }
local air = { [417]=true,[537]=true, [425]=true,[447]=true,[460]=true,[469]=true,[476]=true,[487]=true,[488]=true,[497]=true,[511]=true,[512]=true,[513]=true,[519]=true,[520]=true,[548]=true,[553]=true,[563]=true,[577]=true,[592]=true,[593]=true }

function toggleRemen()
    --if getElementInterior(localPlayer) == 0 and getElementDimension(localPlayer) == 0 then
    if hide then return end
        local veh = getPedOccupiedVehicle(localPlayer) 
        if veh then
            if ( moto[getElementModel ( veh )] ) then outputChatBox("",255,255,255,true)
                elseif ( boat[getElementModel ( veh )] ) then outputChatBox("",255,255,255,true)
                elseif ( air[getElementModel ( veh )] ) then outputChatBox("",255,255,255,true)
            else
                if getElementData(localPlayer,"remeshok") == "пристегнут" then
                    --dxDrawImage(screenW - 214,screenH - 85, 25, 21,"files/rem.png",0.0,0.0,0.0,tocolor(54,54,54,255),false)
                    setElementData(localPlayer,"remeshok","отстегнут")
                    --outputChatBox("Ремень безопасности 	#FF0000отстегнут.",255,255,255,true)
                else
                    setElementData(localPlayer,"remeshok","пристегнут")
                    --outputChatBox("Ремень безопасности #00FF00пристегнут.",255,255,255,true)
                    --dxDrawImage(screenW - 214,screenH - 85, 25, 21,"files/rem.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)
                end
            end
        else
            --outputChatBox("	#FF0000Чтобы пристегнуть ремень, сядьте в транспорт.",255,255,255,true)
        end
    --end
end
bindKey(key, "down", toggleRemen)
addCommandHandler("rem", toggleRemen)

function updateCamera ()
    --if getElementInterior(localPlayer) == 0 and getElementDimension(localPlayer) == 0 then
    if hide then return end
        local veh = getPedOccupiedVehicle(localPlayer)
        if veh then
            if ( moto[getElementModel ( veh )] ) then
                elseif ( boat[getElementModel ( veh )] ) then
                elseif ( air[getElementModel ( veh )] ) then
            else
                if getElementData(localPlayer,"remeshok") == "пристегнут" then
                    --dxDrawImage(screenW - 214,screenH - 85, 25, 21,"files/rem.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)
                else
                    --dxDrawImage(screenW - 214,screenH - 85, 25, 21,"files/rem.png",0.0,0.0,0.0,tocolor(54,54,54,255),false)
                end
            end
        else
            setElementData(localPlayer,"remeshok","отстегнут")
        end
    --end
end
addEventHandler ( "onClientRender", root, updateCamera )

function handleVehicleDamage(attacker, weapon, loss, x, y, z, tyre)
    local player = getVehicleOccupant(source,0)
    if ( moto[getElementModel ( source )] ) then
    elseif ( boat[getElementModel ( source )] ) then
    elseif ( air[getElementModel (source )] ) then
    else
        if tonumber(loss) > 170 then
            if getElementData(localPlayer,"remeshok") == "отстегнут" then
               -- triggerServerEvent( "removeMe", player,player ) 
                --outputChatBox("Вы уебались, пизда рулю, меняй колеса.",255,255,255,true)
            end
        end
    end
end
addEventHandler("onClientVehicleDamage", root, handleVehicleDamage)

setTimer(function()
local veh = getPedOccupiedVehicle(localPlayer)
local vehicleSpeed = getVehicleSpeed()
    if veh then
        if getElementData(localPlayer,"remeshok") == "отстегнут" then
            if (moto[getElementModel(veh)]) then
            elseif (boat[getElementModel(veh)]) then
            elseif (air[getElementModel(veh)]) then
            else
				if getVehicleSpeed(veh) >= 15 then
					--playSound("files/rem.mp3",false)
				end
            end
        end
    end
end, interval * 1000 , 0)

setTimer(function()
	local veh = getPedOccupiedVehicle(localPlayer)
	if veh then
		if getElementData(localPlayer,"remeshok") == "отстегнут" then
            if (moto[getElementModel(veh)]) then
            elseif (boat[getElementModel(veh)]) then
            elseif (air[getElementModel(veh)]) then
			else
				--outputChatBox("Нажмите В, чтобы пристегнуть ремень безопасности.", 255,0,0)
				exports.provincex_alert:alert ( '#EEE8AAНажмите #00BFFFB#EEE8AA, чтобы пристегнуть ремень безопасности.' );
			end
		end
	end
end, 10000, 0)

function getFormatFuel(unit)
    if unit < 10 then
        unit = "00" .. unit
    elseif unit < 100 then
        unit = "0" .. unit
    elseif unit >= 1000 then
        unit = "999"
    end
    return unit
end

function getFormatSpeed(unit)
    if unit < 10 then
        unit = "00" .. unit
    elseif unit < 100 then
        unit = "0" .. unit
    elseif unit >= 1000 then
        unit = "999"
    end
    return unit
end
	
function getElementSpeed(element,unit)
    if (unit == nil) then unit = 0 end
    if (isElement(element)) then
        local x,y,z = getElementVelocity(element)
        if (unit=="mph" or unit==1 or unit =='1') then
            return math.floor((x^2 + y^2 + z^2) ^ 0.5 * 100)
        else
            return math.floor((x^2 + y^2 + z^2) ^ 0.5 * 100 * 1.609344)
        end
    else
        return false
    end
end

function getVehicleSpeed()
    if isPedInVehicle(getLocalPlayer()) then
	    local theVehicle = getPedOccupiedVehicle (getLocalPlayer())
        local vx, vy, vz = getElementVelocity (theVehicle)
        return math.sqrt(vx^2 + vy^2 + vz^2) * 180
    end
    return 0
end

function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end

-- Массив с автомобилями, которым разрешено подключать полный привод.
local vehiclesDrive = {529,596}

function isDriveVehicle(veh)
    for i = 0, #vehiclesDrive do 
        if getElementModel(veh) == vehiclesDrive[i] then return true end   
        if i == #vehiclesDrive and not(getElementModel(veh) == vehiclesDrive[i]) then return false end
    end
end

bindKey("C", "down", function()
    local veh = getPedOccupiedVehicle(getLocalPlayer())
    if veh then
        if getPedOccupiedVehicleSeat(localPlayer) ~= 0 then return end
        if isDriveVehicle(veh) then
            local sx,sy,sz = getElementVelocity(veh)
            local kmh = ((sx^2+sy^2+sz^2)^(0.5)) * 100
            if kmh < 80 then
                if not isDrive then
                    setElementData(localPlayer,"drivetype", "off")
                    --outputChatBox('#00FF00Откл',255,255,255,true)
                    exports.provincex_alert:alert ( '#EEE8AAПолный привод #00BFFFотключен' );
                    triggerServerEvent("Drive",getLocalPlayer(),veh,"1")
                else
                    setElementData(localPlayer,"drivetype", "on")
                    --outputChatBox('Вкл',255,255,255,true)
                    exports.provincex_alert:alert ( '#EEE8AAПолный привод #00BFFFподключен' );
                    triggerServerEvent("Drive",getLocalPlayer(),veh,"2")
                end
                isDrive = not isDrive
            else
                --outputChatBox("Ваша скорость слишком высокая!",255,255,255,true)
                exports.provincex_alert:alert ( '#EEE8AAВаша скорость слишком высокая' );
            end
        else
            --outputChatBox("На данном автомобиле нет подключаемого полного привода.", 255,50,0, true)
        end
    end
end)