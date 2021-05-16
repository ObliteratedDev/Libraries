local library = {}

local SectionTable = {}

local TowerOfHellTable = {}
local MeepCityTable = {}
local LiterallyFNFTable = {}

local function AntiKick()
    local x = game:GetService("Players").LocalPlayer.PlayerScripts.LocalScript
    getsenv(x).kick = function() return nil end
    getsenv(x).kick()
end

function TowerOfHellTable:Invincibility(state)
    pcall(function()
        AntiKick()
        if state == true then
            require(game:GetService("ReplicatedStorage").Mutators.invincibility).mutate()
        elseif state == false then
            require(game:GetService("ReplicatedStorage").Mutators.invincibility).revert()
        else
            return "Specify a bool state"
        end
    end)
end

function TowerOfHellTable:Gravity(state)
    pcall(function()
        AntiKick()
        if state == true then
            require(game:GetService("ReplicatedStorage").Mutators.gravity).mutate()
        elseif state == false then
            require(game:GetService("ReplicatedStorage").Mutators.gravity).revert()
        else
            return "Specify a bool state"
        end
    end)
end

function TowerOfHellTable:Speed(state)
    pcall(function()
        AntiKick()
        if state == true then
            require(game:GetService("ReplicatedStorage").Mutators.speed).mutate()
        elseif state == false then
            require(game:GetService("ReplicatedStorage").Mutators.speed).revert()
        else
            return "Specify a bool state"
        end
    end)
end

function TowerOfHellTable:DoubleJump(state)
    pcall(function()
        AntiKick()
        if state == true then
            require(game:GetService("ReplicatedStorage").Mutators["double jump"]).mutate()
        elseif state == false then
            require(game:GetService("ReplicatedStorage").Mutators["double jump"]).revert()
        else
            return "Specify a bool state"
        end
    end)
end

function TowerOfHellTable:Gear()
    pcall(function()
        AntiKick()
        for i, v in pairs(game:GetService("ReplicatedStorage").Gear:GetChildren()) do
            local y = v:Clone()
            y.Parent = game:GetService("Players").LocalPlayer.Backpack
        end
    end)
end

function TowerOfHellTable:InstantTop()
    pcall(function()
        if game:GetService("Players").LocalPlayer.Character:FindFirstChild('ForceField') then
            return    
        end
        local temp_table = {}
        for i,v in pairs(game:GetService("Workspace").tower:GetDescendants()) do
            if v:IsA('Part') and v.CanCollide == true then
                table.insert(temp_table,v)
                v.CanCollide = false
            end
        end
        Me = game:GetService("Players").LocalPlayer.Character
        Old = Me.KillScript.Disabled
        Me.Humanoid.Jump = true
        for i = 1,300 do
            wait()
            Me.KillScript.Disabled = true
            Me.HumanoidRootPart.Velocity = Vector3.new(0,4000,0)
            o = game:GetService("Workspace").tower.sections.finish.exit.ParticleBrick.Position.Y
            e = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y
            x = o - e
            if x < 5 then
                Me.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
                Me.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").tower.sections.finish.exit.carpet.CFrame.X,game:GetService("Workspace").tower.sections.finish.exit.carpet.CFrame.Y + 3,game:GetService("Workspace").tower.sections.finish.exit.carpet.CFrame.Z)
                break
            end
        end
        for i,v in pairs(temp_table) do
            v.CanCollide = true
        end
        Me.KillScript.Disabled = Old
    end)
end

function SectionTable:TowerOfHell()
    return TowerOfHellTable
end

function MeepCityTable:Plus(state)
    pcall(function()
        if state == true or state == false then
            game:GetService("ReplicatedStorage").PlayerData[game:GetService("Players").LocalPlayer.UserId].PLUS.Value = state
        else
            return "Specify a bool state"
        end
    end)
end

local Meepcity = game
local MeepCityAutoFarm = false
Meepcity.ReplicatedStorage.Connection:InvokeServer(9, 1)
coroutine.wrap(Meepcity:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
    	if MeepCityAutoFarm then
    		Meepcity.ReplicatedStorage.Connection:InvokeServer(49)
    		Meepcity.ReplicatedStorage.Connection:InvokeServer(50)
    		Meepcity.ReplicatedStorage.Connection:InvokeServer(51)
    		local ohNumber1 = 11
    		local ohTable2 = {
    			["FishingPolePos"] = Meepcity:GetService("Workspace").TempFish.Position,
    			["Power"] = 1,
    			["Face"] = Meepcity:GetService("Workspace").TempFish.Position,
    			["PlayerPos"] = Meepcity:GetService("Workspace").TempFish.Position,
    			["FishingZonePos"] = Vector3.new(-5.29345703, -18.0412292, 43.7173767)
    		}
    		Meepcity:GetService("ReplicatedStorage").Connection:InvokeServer(ohNumber1, ohTable2)
    	end
    end)
end))

function MeepCityTable:AutoFarm(state)
    if state == true or state == false then
        MeepCityAutoFarm = state
    else
        return "Specify a bool state"
    end
end

function SectionTable:MeepCity()
    return MeepCityTable
end

local LiterallyFNFAutoPlay = false
local IncomingArrows = game:GetService("Players").LocalPlayer.PlayerGui.FNF.LocalScript.Parent.Screen.UI.Arrows.IncomingArrows;
local getnearestarrow = getsenv(game:GetService("Players").LocalPlayer.PlayerGui.FNF.LocalScript).getnearestarrow
coroutine.wrap(game:GetService('RunService').RenderStepped:Connect(function()
    pcall(function()
        if LiterallyFNFAutoPlay then
            if getnearestarrow("Left", IncomingArrows:GetChildren(), IncomingArrows) ~= nil then
                local Arrow = getnearestarrow("Left", IncomingArrows:GetChildren(), IncomingArrows):FindFirstChildWhichIsA("Frame")
                if Arrow.Sus.Size.Y.Scale > 0 then
                    if IncomingArrows.Parent.Left.AbsolutePosition.Y - Arrow:FindFirstChild('Sus').End.AbsolutePosition.Y > -40 then
                        game:GetService('VirtualInputManager'):SendKeyEvent(false, Enum.KeyCode.A, false,nil)
                    else
                        game:GetService('VirtualInputManager'):SendKeyEvent(true, Enum.KeyCode.A, false,nil)
                    end
                    return    
                end
                if IncomingArrows.Parent.Left.AbsolutePosition.Y - Arrow:FindFirstChildWhichIsA('ImageLabel').AbsolutePosition.Y > -5 then
                    game:GetService('VirtualInputManager'):SendKeyEvent(true, Enum.KeyCode.A, false,nil)
                    game:GetService('VirtualInputManager'):SendKeyEvent(false, Enum.KeyCode.A, false,nil)
                end
            end
            if getnearestarrow("Up", IncomingArrows:GetChildren(), IncomingArrows) ~= nil then
                local Arrow = getnearestarrow("Up", IncomingArrows:GetChildren(), IncomingArrows):FindFirstChildWhichIsA("Frame")
                if Arrow.Sus.Size.Y.Scale > 0 then
                    if IncomingArrows.Parent.Up.AbsolutePosition.Y - Arrow:FindFirstChild('Sus').End.AbsolutePosition.Y > -40 then
                        game:GetService('VirtualInputManager'):SendKeyEvent(false, Enum.KeyCode.W, false,nil)
                    else
                        game:GetService('VirtualInputManager'):SendKeyEvent(true, Enum.KeyCode.W, false,nil)
                    end
                    return    
                end
                if IncomingArrows.Parent.Up.AbsolutePosition.Y - Arrow:FindFirstChildWhichIsA('ImageLabel').AbsolutePosition.Y > -5 then
                    game:GetService('VirtualInputManager'):SendKeyEvent(true, Enum.KeyCode.W, false,nil)
                    game:GetService('VirtualInputManager'):SendKeyEvent(false, Enum.KeyCode.W, false,nil)
                end
            end
            if getnearestarrow("Right", IncomingArrows:GetChildren(), IncomingArrows) ~= nil then
                local Arrow = getnearestarrow("Right", IncomingArrows:GetChildren(), IncomingArrows):FindFirstChildWhichIsA("Frame")
                if Arrow.Sus.Size.Y.Scale > 0 then
                    if IncomingArrows.Parent.Right.AbsolutePosition.Y - Arrow:FindFirstChild('Sus').End.AbsolutePosition.Y > -40 then
                        game:GetService('VirtualInputManager'):SendKeyEvent(false, Enum.KeyCode.D, false,nil)
                    else
                        game:GetService('VirtualInputManager'):SendKeyEvent(true, Enum.KeyCode.D, false,nil)
                    end
                    return    
                end
                if IncomingArrows.Parent.Right.AbsolutePosition.Y - Arrow:FindFirstChildWhichIsA('ImageLabel').AbsolutePosition.Y > -5 then
                    game:GetService('VirtualInputManager'):SendKeyEvent(true, Enum.KeyCode.D, false,nil)
                    game:GetService('VirtualInputManager'):SendKeyEvent(false, Enum.KeyCode.D, false,nil)
                end
            end
            if getnearestarrow("Down", IncomingArrows:GetChildren(), IncomingArrows) ~= nil then
                local Arrow = getnearestarrow("Down", IncomingArrows:GetChildren(), IncomingArrows):FindFirstChildWhichIsA("Frame")
                if Arrow.Sus.Size.Y.Scale > 0 then
                    if IncomingArrows.Parent.Down.AbsolutePosition.Y - Arrow:FindFirstChild('Sus').End.AbsolutePosition.Y > -40 then
                        game:GetService('VirtualInputManager'):SendKeyEvent(false, Enum.KeyCode.S, false,nil)
                    else
                        game:GetService('VirtualInputManager'):SendKeyEvent(true, Enum.KeyCode.S, false,nil)
                    end
                    return    
                end
                if IncomingArrows.Parent.Down.AbsolutePosition.Y - Arrow:FindFirstChildWhichIsA('ImageLabel').AbsolutePosition.Y > -5 then
                    game:GetService('VirtualInputManager'):SendKeyEvent(true, Enum.KeyCode.S, false,nil)
                    game:GetService('VirtualInputManager'):SendKeyEvent(false, Enum.KeyCode.S, false,nil)
                end
            end
        end
    end)
end))

function LiterallyFNFTable:AutoPlay(state)
    if state == true or state == false then
        LiterallyFNFAutoPlay = state
    else
        return "Specify a bool state"
    end
end

function SectionTable:LiterallyFNF()
    return LiterallyFNFTable
end

function library:Sections()
    return SectionTable
end

return library
