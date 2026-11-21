local meow = require(game:GetService("ReplicatedFirst").Client.Core)
local meownet = require(meow.Net)
meownet.send = function(self, ...)
    local sendtable = {...}

    if string.find(string.lower(sendtable[1]), "report") then
        if not string.find(sendtable[4],"metamethod tampering") then
            print("detected \ntype: "..sendtable[2] .. " | Reason: " .. sendtable[4])
        end
    else
        return
    end
end

-- yo this shit is useless if you can just run the bypass and not have to worry about detections 😔🥀
-- and how is this unpatched still ✌️
