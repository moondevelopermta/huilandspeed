--(rwd)задний привод, (fwd)передний привод, (awd)полный привод

function Drive(veh,num)
    if num == "1" then
        setVehicleHandling(veh, "driveType", "awd")
    elseif num == "2" then
        setVehicleHandling(veh, "driveType", "rwd")
    end
end
addEvent("Drive", true)
addEventHandler("Drive", getRootElement(), Drive)