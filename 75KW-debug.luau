local meow = require(game:GetService("ReplicatedFirst").Client.Core)
local meownet = require(meow.Net)
meownet.send = function(self, ...)
    local sendtable = {...}

    if string.find(string.lower(sendtable[1]), "report") then
        print("detected \n type: "..sendtable[2] .. " | Reason: " .. sendtable[4])
    else
        return
    end
end

-- Same as 75KW.luau just with logging on why you got detected
