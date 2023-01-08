
local GuiLibrary = {}
local Gui = Instance.new("ScreenGui")
local EditGui = Instance.new("ScreenGui")
local WatermarkGui = Instance.new("ScreenGui")
local Keystrokes = Instance.new("ScreenGui")
local GameSave = shared["azuragame"]
local Azura = shared["azura"]
local ProtectUI = function(v)
    v.Name = game:GetService("HttpService"):GenerateGUID(false)
    if syn then syn.protect_gui(v) end
    if gethui then
        v.Parent = gethui()
    else
        v.Parent = game:GetService("CoreGui")
    end
end
Gui.ResetOnSpawn = false
Gui.Enabled = false
ProtectUI(Gui)
EditGui.ResetOnSpawn = false
EditGui.Enabled = false
ProtectUI(EditGui)
WatermarkGui.ResetOnSpawn = false
WatermarkGui.Enabled = true
ProtectUI(WatermarkGui)
Keystrokes.ResetOnSpawn = false
Keystrokes.Enabled = false
ProtectUI(Keystrokes)
local Notifications = Instance.new("ScreenGui")
Notifications.ResetOnSpawn = false
ProtectUI(Notifications)
local LineFrm = Instance.new("Frame")
LineFrm.BackgroundTransparency = 1
LineFrm.AnchorPoint = Vector2.new(0.5, 0.5)
LineFrm.Size = UDim2.new(0, 932, 0, 0)
LineFrm.Position = UDim2.new(0.499, 0, -1, 0)
LineFrm.ZIndex = 1
LineFrm.Parent = Gui
local UIL = Instance.new("UIListLayout")
UIL.FillDirection = Enum.FillDirection.Horizontal
UIL.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIL.SortOrder = Enum.SortOrder.LayoutOrder
UIL.Padding = UDim.new(0, 30)
UIL.Parent = LineFrm
local mainmark = Instance.new("TextLabel")
mainmark.Draggable = true
mainmark.Active = true
mainmark.Selectable = true
mainmark.TextStrokeTransparency = 0.75
mainmark.BackgroundTransparency = 1
mainmark.Size = UDim2.new(0, 250, 0, 85)
mainmark.Text = "Azura"
mainmark.TextColor3 = Color3.fromRGB(255, 255, 255)
mainmark.TextScaled = true
mainmark.Font = Enum.Font.GothamMedium
mainmark.Parent = WatermarkGui
local markgrandient = Instance.new("UIGradient")
markgrandient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(180, 80, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(230, 120, 228))}
markgrandient.Parent = mainmark
local uidmark = mainmark:Clone()
uidmark.Text = Azura["version"].." | ("..game:GetService("Players").LocalPlayer.DisplayName..")"
uidmark.Size = UDim2.new(0, 250, 0, 20)
uidmark.Position = UDim2.new(0, 0, 0.871, 0)
uidmark.Parent = mainmark
local infolabel = Instance.new("TextLabel")
infolabel.BackgroundTransparency = 0.3
infolabel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
infolabel.BorderSizePixel = 0
infolabel.Size = UDim2.new(0, 1223, 0, 60)
infolabel.Font = Enum.Font.GothamMedium
infolabel.Text = "[Azura]\nCool script lol"
infolabel.TextColor3 = Color3.fromRGB(255, 255, 255)
infolabel.Position = UDim2.new(0.126, 0, 0.881, 0)
infolabel.TextSize = 28
infolabel.TextXAlignment = Enum.TextXAlignment.Left
infolabel.TextYAlignment = Enum.TextYAlignment.Bottom
infolabel.Parent = Gui

local backgroundframe = Instance.new("Frame")
backgroundframe.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
backgroundframe.BackgroundTransparency = 0.15
backgroundframe.BorderSizePixel = 0
backgroundframe.Size = UDim2.new(0, 9999, 0, 9999)
backgroundframe.Position = UDim2.new(0, -50, 0, -50)
backgroundframe.Visible = false
backgroundframe.ZIndex = 0
backgroundframe.Parent = Gui
local presscon
local canopen = true
local currenttween
local currenttween2
local oldfov = 70

presscon = game:GetService("UserInputService").InputBegan:Connect(function(input)
    spawn(function()
        if input.KeyCode == Enum.KeyCode.RightShift then
            pcall(function()
                currenttween:Cancel()
            end)
            pcall(function()
                currenttween2:Cancel()
            end)
            local ts = game:GetService("TweenService")
            if Gui.Enabled == false then
                Gui.Enabled = true
                backgroundframe.Visible = true
                oldfov = game:GetService("Workspace").CurrentCamera.FieldOfView
                infolabel.Visible = true
                currenttween = ts:Create(LineFrm, TweenInfo.new(0.5), {Position = UDim2.new(0.499, 0, 0.048, 0)})
                currenttween:Play()
                currenttween2 = ts:Create(game:GetService("Workspace").CurrentCamera, TweenInfo.new(0.5), {FieldOfView = game:GetService("Workspace").CurrentCamera.FieldOfView * 0.6}):Play()
            else
                infolabel.Visible = false
                currenttween = ts:Create(LineFrm, TweenInfo.new(0.5), {Position = UDim2.new(0.499, 0, -1, 0)})
                currenttween:Play()
                currenttween = ts:Create(game:GetService("Workspace").CurrentCamera, TweenInfo.new(0.5), {FieldOfView = oldfov}):Play()
                task.wait(0.5)
                backgroundframe.Visible = false
                Gui.Enabled = false
            end
        end
    end)
end)

function createnotification(TitleText, ContentText, Duration, ImageID)
    spawn(function()
        local ts = game:GetService("TweenService")
        local iconids = {
            ["i"] = 9072944922,
            ["x"] = 9127564477
        }
        for i,v in pairs(Notifications:GetChildren()) do
            spawn(function()
                local newpos = (v.Position - UDim2.new(0, 0, 0.1, 0))
                ts:Create(v, TweenInfo.new(0.07), {Position = newpos}):Play()
            end)
        end
        local main1 = Instance.new("Frame")
        main1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        main1.Size = UDim2.new(0, 261, 0, 75)
        main1.Position = UDim2.new(1.3, 0, 0.887, 0)
        main1.BorderSizePixel = 0
        main1.Parent = Notifications
        local grad = Instance.new("UIGradient")
        grad.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(115, 15, 180)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(30, 30, 40))}
        grad.Offset = Vector2.new(-0.672, -0.00666667)
        grad.Parent = main1
        local icon = Instance.new("ImageLabel")
        icon.BackgroundTransparency = 1
        icon.Size = UDim2.new(0, 30, 0, 30)
        icon.Position = UDim2.new(0.107, 0, 0.296, 0)
        icon.Image = "rbxassetid://"..iconids[ImageID]
        icon.ImageColor3 = Color3.fromRGB(200, 230, 230)
        icon.Parent = main1
        local title = Instance.new("TextLabel")
        title.BackgroundTransparency = 1
        title.Size = UDim2.new(0, 137, 0, 16)
        title.Position = UDim2.new(0.352, 0, 0.250, 0)
        title.Font = Enum.Font.GothamMedium
        title.Text = TitleText
        title.TextColor3 = Color3.fromRGB(200, 230, 230)
        title.TextScaled = true
        title.TextXAlignment = Enum.TextXAlignment.Left
        title.Parent = main1
        local content = Instance.new("TextLabel")
        content.BackgroundTransparency = 1
        content.Size = UDim2.new(0, 137, 0, 30)
        content.Position = UDim2.new(0.352, 0, 0.450, 0)
        content.Font = Enum.Font.GothamMedium
        content.Text = ContentText
        content.TextColor3 = Color3.fromRGB(200, 230, 230)
        content.TextScaled = true
        content.TextXAlignment = Enum.TextXAlignment.Left
        content.Parent = main1
        ts:Create(main1, TweenInfo.new(0.12), {Position = UDim2.new(0.831, 0, 0.887, 0)}):Play()
        task.wait(0.12)
        task.wait(Duration)
        ts:Create(main1, TweenInfo.new(0.12), {Position = UDim2.new(1.3, 0, 0.887, 0)}):Play()
        task.wait(0.13)
        main1:Destroy()
    end)
end

createnotification("Azura", "Azura has Loaded!", 3, "i")
GuiLibrary["CreateNotification"] = createnotification
local connections = {}

pcall(function()
    local ts = game:GetService("TweenService")
    local main4 = Instance.new("Frame")
    main4.BackgroundTransparency = 1
    main4.Size = UDim2.new(0, 195, 0, 205)
    main4.Position = UDim2.new(0.02, 0, 0.127, 0)
    main4.BorderSizePixel = 0
    main4.Active = true
    main4.Selectable = true
    main4.Draggable = true
    main4.Parent = Keystrokes
    local w = Instance.new("TextLabel")
    w.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    w.BackgroundTransparency = 0.3
    w.BorderSizePixel = 0
    w.Size = UDim2.new(0, 65, 0, 65)
    w.Position = UDim2.new(0.333, 0, 0, 0)
    w.Text = "W"
    w.Font = Enum.Font.GothamMedium
    w.TextSize = 28
    w.TextTransparency = 0.3
    w.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", w)
    w.Parent = main4
    local a = w:Clone()
    a.Text = "A"
    a.Position = UDim2.new(0, 0, 0.317, 0)
    a.Parent = main4
    local s = w:Clone()
    s.Text = "S"
    s.Position = UDim2.new(0.333, 0, 0.317, 0)
    s.Parent = main4
    local d = w:Clone()
    d.Text = "D"
    d.Position = UDim2.new(0.667, 0, 0.317, 0)
    d.Parent = main4
    local space = w:Clone()
    space.Size = UDim2.new(0, 195, 0, 30)
    space.Position = UDim2.new(0, 0, 0.678, 0)
    space.Text = "SPACE"
    space.Parent = main4
    connections[#connections+1] = game:GetService("UserInputService").InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.W then
            ts:Create(w, TweenInfo.new(0.3), {BackgroundTransparency = 0}):Play()
        elseif input.KeyCode == Enum.KeyCode.A then
            ts:Create(a, TweenInfo.new(0.3), {BackgroundTransparency = 0}):Play()
        elseif input.KeyCode == Enum.KeyCode.S then
            ts:Create(s, TweenInfo.new(0.3), {BackgroundTransparency = 0}):Play()
        elseif input.KeyCode == Enum.KeyCode.D then
            ts:Create(d, TweenInfo.new(0.3), {BackgroundTransparency = 0}):Play()
        elseif input.KeyCode == Enum.KeyCode.Space then
            ts:Create(space, TweenInfo.new(0.3), {BackgroundTransparency = 0}):Play()
        end
    end)
    connections[#connections+1] = game:GetService("UserInputService").InputEnded:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.W then
            ts:Create(w, TweenInfo.new(0.3), {BackgroundTransparency = 0.3}):Play()
        elseif input.KeyCode == Enum.KeyCode.A then
            ts:Create(a, TweenInfo.new(0.3), {BackgroundTransparency = 0.3}):Play()
        elseif input.KeyCode == Enum.KeyCode.S then
            ts:Create(s, TweenInfo.new(0.3), {BackgroundTransparency = 0.3}):Play()
        elseif input.KeyCode == Enum.KeyCode.D then
            ts:Create(d, TweenInfo.new(0.3), {BackgroundTransparency = 0.3}):Play()
        elseif input.KeyCode == Enum.KeyCode.Space then
            ts:Create(space, TweenInfo.new(0.3), {BackgroundTransparency = 0.3}):Play()
        end
    end)
end)

GuiLibrary.Keystrokes = Keystrokes

local UninjectStuff = {}
local Uninjected = false
function Uninject()
    for ModName,ModTable in pairs(UninjectStuff) do
        if ModTable.enabled == true then
            ModTable.func(true)
        end
    end
    presscon:Disconnect()
    Gui:Destroy()
    EditGui:Destroy()
    Notifications:Destroy()
    WatermarkGui:Destroy()
    Keystrokes:Destroy()
    Uninjected = true
    for i,v in pairs(connections) do
        v:Disconnect()
    end
    shared["azuraarray"].FullStop()
    shared["azura"] = nil
    game:GetService("Workspace").CurrentCamera.FieldOfView = (oldfov ~= 70 and oldfov) or 70
    spawn(function()
        task.wait(0.1)
        shared["azuraarray"] = nil
    end)
end
GuiLibrary["Uninject"] = Uninject

spawn(function()
    local commands = {
        ["!test"] = function()
            print("ongongoong")
        end
    }
    if game:GetAttribute("___________________________________________________________________") ~= true then
        local ChatHook
        game:SetAttribute("___________________________________________________________________", true)
        ChatHook = hookmetamethod(game, "__namecall", function(self, ...)
            if self.Name == "SayMessageRequest" then
                local args = {...}
                if commands[args[1]] then
                    commands[args[1]]()
                    return nil
                end
                return ChatHook(self, ...)
            end
            return ChatHook(self, ...)
        end)
    end
end)

local Keybinds = {}
local EditRequest
local suc, err = pcall(function()
    local onlyconnections = {}
    local main2 = Instance.new("Frame")
    main2.AnchorPoint = Vector2.new(0.5, 0.5)
    main2.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    main2.Size = UDim2.new(0, 715, 0, 415)
    main2.Position = UDim2.new(0.5, 0, 0.5, 0)
    Instance.new("UICorner", main2)
    main2.Parent = EditGui
    local title = Instance.new("TextLabel")
    title.Font = Enum.Font.GothamMedium
    title.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    title.Size = UDim2.new(0, 715, 0, 50)
    title.Position = UDim2.new(0, 0, -0.15, 0)
    title.Text = "... Options"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 28
    Instance.new("UICorner", title)
    title.Parent = main2
    local close = Instance.new("TextButton")
    close.Font = Enum.Font.GothamMedium
    close.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    close.Size = UDim2.new(0, 653, 0, 50)
    close.Position = UDim2.new(0.043, 0, 0.812, 0)
    close.Text = "Close"
    close.TextColor3 = Color3.fromRGB(255, 255, 255)
    close.TextSize = 28
    close.BorderSizePixel = 0
    Instance.new("UICorner", adjust)
    close.Parent = main2
    local scrollframe = Instance.new("ScrollingFrame")
    scrollframe.AutomaticCanvasSize = Enum.AutomaticSize.Y
    scrollframe.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    scrollframe.BorderSizePixel = 0
    scrollframe.Size = UDim2.new(0, 653, 0, 300)
    scrollframe.Position = UDim2.new(0.043, 0, 0.027, 0)
    scrollframe.ScrollBarThickness = 6
    Instance.new("UIListLayout", scrollframe).Padding = UDim.new(0, 15)
    scrollframe.Parent = main2
    EditRequest = function(savename, toggles, dropdowns, textboxes, sliders)
        toggles = toggles or {}
        dropdowns = dropdowns or {}
        textboxes = textboxes or {}
        sliders = sliders or {}
        if not savename then return end
        EditGui.Enabled = true
        Gui.Enabled = false
        title.Text = savename.." Options"
        for i,v in pairs(scrollframe:GetChildren()) do
            if not v:IsA("UIListLayout") then
                v:Destroy()
            end
        end
        onlyconnections[#onlyconnections+1] = close.MouseButton1Click:Connect(function()
            for i,v in pairs(onlyconnections) do
                v:Disconnect()
                onlyconnections[v] = nil
            end
            EditGui.Enabled = false
            Gui.Enabled = true
        end)
        for i, Tbls in pairs(toggles) do
            local toggled = false
            local button = Instance.new("TextButton")
            button.Font = Enum.Font.GothamMedium
            button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            button.BorderSizePixel = 0
            button.Size = UDim2.new(0, 647, 0, 70)
            button.Text = Tbls["Name"]
            button.TextSize = 28
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.Parent = scrollframe
            if Azura["betterisfile"]("azura/configs/"..GameSave.."/"..savename.."Toggle"..Tbls["Name"]..".azu") then
                spawn(function()
                    local code = readfile("azura/configs/"..GameSave.."/"..savename.."Toggle"..Tbls["Name"]..".azu")
                    if code == "true" then
                        toggled = true
                        button.TextColor3 = Color3.fromRGB(65, 255, 65)
                    elseif code == "false" then
                        toggled = false
                        button.TextColor3 = Color3.fromRGB(255, 255, 255)
                    end
                end)
            end
            onlyconnections[#onlyconnections+1] = button.MouseButton1Click:Connect(function()
                if button.TextColor3 == Color3.fromRGB(255, 255, 255) then
                    spawn(function()
                        writefile("azura/configs/"..GameSave.."/"..savename.."Toggle"..Tbls["Name"]..".azu", "true")
                    end)
                    spawn(function()
                        button.TextColor3 = Color3.fromRGB(65, 255, 65)
                    end)
                    spawn(function()
                        Tbls["Function"](true)
                    end)
                elseif button.TextColor3 == Color3.fromRGB(65, 255, 65) then
                    spawn(function()
                        writefile("azura/configs/"..GameSave.."/"..savename.."Toggle"..Tbls["Name"]..".azu", "false")
                    end)
                    spawn(function()
                        button.TextColor3 = Color3.fromRGB(255, 255, 255)
                    end)
                    spawn(function()
                        Tbls["Function"](false)
                    end)
                end
            end)
        end
        for i, Tbls in pairs(dropdowns) do
            local chosen = 1
            local dropdown = Instance.new("TextButton")
            dropdown.Font = Enum.Font.GothamMedium
            dropdown.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            dropdown.BorderSizePixel = 0
            dropdown.Size = UDim2.new(0, 647, 0, 70)
            dropdown.Text = Tbls["Name"].." ("..Tbls["List"][1]..")"
            dropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
            dropdown.TextSize = 28
            dropdown.Parent = scrollframe
            if Azura["betterisfile"]("azura/configs/"..GameSave.."/"..savename.."Dropdown"..Tbls["Name"]..".azu") then
                spawn(function()
                    chosen = tonumber(readfile("azura/configs/"..GameSave.."/"..savename.."Dropdown"..Tbls["Name"]..".azu")) or 1
                    dropdown.Text = Tbls["Name"].." ("..Tbls["List"][chosen]..")"
                end)
            end
            onlyconnections[#onlyconnections] = dropdown.MouseButton1Click:Connect(function()
                if Tbls["List"][2] ~= nil then
                    if Tbls["List"][(chosen + 1)] ~= nil then
                        spawn(function()
                            chosen = chosen + 1
                            dropdown.Text = Tbls["Name"].." ("..Tbls["List"][chosen]..")"
                            writefile("azura/configs/"..GameSave.."/"..savename.."Dropdown"..Tbls["Name"]..".azu", tostring(chosen))
                            Tbls["Function"](Tbls["List"][chosen])
                        end)
                    else
                        spawn(function()
                            chosen = 1
                            dropdown.Text = Tbls["Name"].." ("..Tbls["List"][chosen]..")"
                            writefile("azura/configs/"..GameSave.."/"..savename.."Dropdown"..Tbls["Name"]..".azu", Tbls["List"][1])
                            Tbls["Function"](Tbls["List"][chosen])
                        end)
                    end
                else
                    spawn(function()
                        chosen = 1
                        dropdown.Text = Tbls["Name"].." ("..Tbls["List"][1]..")"
                        Tbls["Function"](Tbls["List"][chosen])
                    end)
                end
            end)
        end
        for i, Tbls in pairs(textboxes) do
            local box = Instance.new("TextBox")
            box.Font = Enum.Font.GothamMedium
            box.PlaceholderText = Tbls["ExampleText"]
            box.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            box.TextColor3 = Color3.fromRGB(255, 255, 255)
            box.BorderSizePixel = 0
            box.Size = UDim2.new(0, 647, 0, 70)
            box.TextSize = 28
            box.Parent = scrollframe
            if Azura["betterisfile"]("azura/configs/"..GameSave.."/"..savename.."Textbox"..Tbls["Name"]..".azu") then
                box.Text = tostring(readfile("azura/configs/"..GameSave.."/"..savename.."Textbox"..Tbls["Name"]..".azu"))
            end
            onlyconnections[#onlyconnections+1] = box.FocusLost:Connect(function()
                spawn(function()
                    writefile("azura/configs/"..GameSave.."/"..savename.."Textbox"..Tbls["Name"]..".azu", tostring(box.Text))
                end)
                spawn(function()
                    Tbls["Function"](tostring(box.Text))
                end)
            end)
        end
        for i, Tbls in pairs(sliders) do
            local value = Tbls["Default"]
            local main3 = Instance.new("TextLabel")
            main3.Font = Enum.Font.GothamMedium
            main3.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            main3.BorderSizePixel = 0
            main3.Size = UDim2.new(0, 647, 0, 70)
            main3.Text = Tbls["Name"]..": "..Tbls["Default"]..""
            main3.TextSize = 26
            main3.TextColor3 = Color3.fromRGB(255, 255, 255)
            main3.Parent = scrollframe
            local minus = Instance.new("TextButton")
            minus.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            minus.BorderSizePixel = 0
            minus.Size = UDim2.new(0, 50, 0, 50)
            minus.Position = UDim2.new(0.02, 0, 0.143, 0)
            minus.Text = "-"
            minus.TextColor3 = Color3.fromRGB(255, 255, 255)
            minus.TextSize = 26
            minus.Parent = main3
            local plus = minus:Clone()
            plus.Text = "+"
            plus.Position = UDim2.new(0.905, 0, 0.143, 0)
            plus.Parent = main3
            if Azura["betterisfile"]("azura/configs/"..GameSave.."/"..savename.."Slider"..Tbls["Name"]..".azu") then
                value = tonumber(readfile("azura/configs/"..GameSave.."/"..savename.."Slider"..Tbls["Name"]..".azu"))
            end
            local function valueeditor(val)
                local toset = tonumber(val)
                if (toset > Tbls["Min"]) and (toset < Tbls["Max"]) then
                    value = toset
                    writefile("azura/configs/"..GameSave.."/"..savename.."Slider"..Tbls["Name"]..".azu", tostring(toset))
                    main3.Text = Tbls["Name"]..": "..toset
                end
            end
            onlyconnections[#onlyconnections+1] = minus.MouseButton1Click:Connect(function()
                valueeditor(value - Tbls["Round"])
            end)
            onlyconnections[#onlyconnections+1] = plus.MouseButton1Click:Connect(function()
                valueeditor(value + Tbls["Round"])
            end)
        end
        local bindbutton = Instance.new("TextButton")
        bindbutton.Font = Enum.Font.GothamMedium
        bindbutton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        bindbutton.BorderSizePixel = 0
        bindbutton.Size = UDim2.new(0, 647, 0, 70)
        bindbutton.Text = "Keybind (None)"
        bindbutton.TextColor3 = Color3.fromRGB(255, 255, 255)
        bindbutton.TextSize = 30
        bindbutton.Parent = scrollframe
        if Azura["betterisfile"]("azura/configs/"..GameSave.."/"..savename.."Bind.azu") then
            local code = readfile("azura/configs/"..GameSave.."/"..savename.."Bind.azu")
            bindbutton.Text = "Keybind ("..code..")"
        end
        onlyconnections[#onlyconnections+1] = bindbutton.MouseButton1Click:Connect(function()
            if bindbutton.Text ~= "Keybind (...)" then
                bindbutton.Text = "Keybind (...)"
                local bindconnection
                bindconnection = game:GetService("UserInputService").InputBegan:Connect(function(input)
                    bindconnection:Disconnect()
                    if input.KeyCode == Enum.KeyCode.Escape then
                        Keybinds[savename] = nil
                        bindbutton.Text = "Keybind (None)"
                        if Azura["Betterisfile"]("azura/configs/"..GameSave.."/"..savename.."Bind.azu") then
                            delfile("azura/configs/"..GameSave.."/"..savename.."Bind.azu")
                        end
                    else
                        task.wait(0.01)
                        local buttontxt = tostring(input.KeyCode):gsub("Enum.KeyCode.","")
                        bindbutton.Text = "Keybind ("..buttontxt..")"
                        Keybinds[savename] = {input.KeyCode}
                        writefile("azura/configs/"..GameSave.."/"..savename.."Bind.azu", buttontxt)
                    end
                end)
            end
        end)
    end
end)

local geticon = function(Name)
    local getasset = getsynasset or getcustomasset
        spawn(function()
            local code = game:HttpGet("https://raw.githubusercontent.com/7499992444444445333333333333333345555/8942727022929680257330110687157378371513620136/main/Assets/"..Name..".png")
            writefile("azura/Assets/"..Name..".png", code)
        end)
    local asset = getasset("azura/Assets/"..Name..".png")
    return asset
end
function GuiLibrary:NewTab(Name)
    local Button = Instance.new("TextButton")
    Button.Font = Enum.Font.GothamMedium
    Button.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Button.BorderSizePixel = 0
    Button.Size = UDim2.new(0, 130, 0, 50)
    Button.Position = UDim2.new(0.438, 0, 0, 0)
    Button.Text = " "..Name
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = (Button.AbsoluteSize.Y * 0.4)
    Button.TextXAlignment = Enum.TextXAlignment.Left
    Button.Parent = LineFrm
    local image = Instance.new("ImageLabel")
    image.BackgroundTransparency = 1
    image.BorderSizePixel = 0
    image.Size = UDim2.new(0, 40, 0, 40)
    image.Image = geticon(Name)
    image.Position = UDim2.new(0.630, 0, 0.1, 0)
    image.ImageColor3 = Color3.fromRGB(255, 255, 255)
    image.Parent = Button
    local Frame = Instance.new("Frame")
    Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Frame.Size = UDim2.new(0, 130, 0, 10)
    Frame.Position = UDim2.new(-0.003, 0, 1, 0)
    Frame.BorderSizePixel = 0
    Frame.Visible = false
    Frame.Parent = Button
    local ScrollingFrame = Instance.new("ScrollingFrame")
    ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    ScrollingFrame.ScrollingDirection = Enum.ScrollingDirection.Y
    ScrollingFrame.BackgroundTransparency = 1
    ScrollingFrame.Size = UDim2.new(0, 130, 0, 25)
    ScrollingFrame.ScrollBarThickness = 0
    ScrollingFrame.BorderSizePixel = 0
    ScrollingFrame.TopImage = ""
    ScrollingFrame.MidImage = ""
    ScrollingFrame.BottomImage = ""
    ScrollingFrame.Visible = false
    ScrollingFrame.Parent = Frame
    local TabModules = Instance.new("Folder")
    TabModules.Name = "TabModules"
    local layout = Instance.new("UIListLayout")
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    layout.Padding = UDim.new(0, 3)
    layout.Parent = TabModules
    TabModules.Parent = ScrollingFrame
    local returnfuncs = {}
    if Azura["betterisfile"]("azura/configs/"..GameSave.."/"..Name.."Vis.azu") then
        local code = readfile("azura/configs/"..GameSave.."/"..Name.."Vis.azu")
        if code == "true" then
            Frame.Visible = true
            ScrollingFrame.Visible = true
        elseif code == "false" then
            Frame.Visible = false
            ScrollingFrame.Visible = false
        end
    end
    connections[#connections+1] = Button.MouseButton1Click:Connect(function()
        Frame.Visible = not Frame.Visible
        ScrollingFrame.Visible = Frame.Visible
        writefile("azura/configs/"..GameSave.."/"..Name.."Vis.azu", tostring(Frame.Visible))
    end)
    function returnfuncs:NewToggle(argtable)
        if Azura["betterisfile"]("azura/configs/"..GameSave.."/"..argtable["Name"].."Bind.azu") then
            local code = readfile("azura/configs/"..GameSave.."/"..argtable["Name"].."Bind.azu")
            local actualcode = Enum.KeyCode[code]
            Keybinds[argtable["Name"]] = {actualcode}
        end
        Frame.Size = Frame.Size + UDim2.new(0, 0, 0, 42)
        ScrollingFrame.Size = Frame.Size
        local Button2 = Instance.new("TextButton")
        Button2.Font = Enum.Font.GothamMedium
        Button2.Text = argtable["Name"]
        Button2.TextSize = 18
        Button2.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button2.BorderSizePixel = 0
        Button2.Size = UDim2.new(0, 120, 0, 40)
        Button2.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        Instance.new("UICorner", Button2)
        Button2.Parent = TabModules
        if not Azura["betterisfile"]("azura/configs/"..GameSave.."/"..argtable["Name"]..".azu") then
            writefile("azura/configs/"..GameSave.."/"..argtable["Name"]..".azu", "false")
        end
        local setconfig = function(Value)
            if Uninjected == false then
                Value = tostring(Value)
                writefile("azura/configs/"..GameSave.."/"..argtable["Name"]..".azu", Value)
            end
        end
        local togglemodule = function(IsSilent)
            spawn(function()
                if Button2.BackgroundColor3 == Color3.fromRGB(115, 15, 180) then
                    spawn(function()
                        Button2.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                        UninjectStuff[argtable["Name"]].enabled = false
                        setconfig(false)
                    end)
                    spawn(function()
                        if IsSilent == false then
                            createnotification("Module Toggled", argtable["Name"].." has been Disabled!", 3, "x")
                        end
                    end)
                    spawn(function()
                        shared["azuraarray"].Remove(argtable["Name"])
                    end)
                    spawn(function()
                        argtable["Function"](false)
                    end)
                elseif Button2.BackgroundColor3 == Color3.fromRGB(35, 35, 35) then
                    spawn(function()
                        Button2.BackgroundColor3 = Color3.fromRGB(115, 15, 180)
                        UninjectStuff[argtable["Name"]].enabled = true
                        setconfig(true)
                    end)
                    spawn(function()
                        if IsSilent == false then
                            createnotification("Module Toggled", argtable["Name"].." has been Enabled!", 3, "i")
                        end
                    end)
                    spawn(function()
                        if argtable["Suffix"] ~= nil then
                            shared["azuraarray"].Add(argtable["Name"], argtable["Suffix"]())
                        else
                            shared["azuraarray"].Add(argtable["Name"])
                        end
                    end)
                    spawn(function()
                        argtable["Function"](true)
                    end)
                end
            end)
        end
        local getbindval = function(KeyCode)
            local code = tostring(KeyCode):gsub("Enum.KeyCode.","")
            return code
        end
        UninjectStuff[argtable["Name"]] = {func = togglemodule, enabled = false}
        connections[#connections+1] = Button2.MouseButton1Click:Connect(function()
            togglemodule(false)
        end)
        local toggles = {}
        local dropdowns = {}
        local textboxes = {}
        local sliders = {}
        connections[#connections+1] = Button2.MouseButton2Click:Connect(function()
            EditRequest(argtable["Name"], toggles, dropdowns, textboxes, sliders)
        end)
        if argtable["InfoText"] ~= nil then
            connections[#connections+1] = Button2.MouseEnter:Connect(function()
                infolabel.Text = "["..argtable["Name"].."]\n"..argtable["InfoText"]
            end)
        end
        local returnfuncs2 = {}
        function returnfuncs2:ToggleButton(IsSilent)
            togglemodule(IsSilent)
        end
        function returnfuncs2:Toggle(argtable2)
            local val = {
                ["Name"] = argtable2["Name"],
                ["Default"] = argtable2["Default"] or false,
                ["Function"] = argtable2["Function"]
            }
            table.insert(toggles, val)
            if Azura["betterisfile"]("azura/configs/"..GameSave.."/"..argtable["Name"].."Toggle"..val["Name"]..".azu") then
                spawn(function()
                    local code = readfile("azura/configs/"..GameSave.."/"..argtable["Name"].."Toggle"..val["Name"]..".azu")
                    if code == "true" then
                        val["Function"](true)
                    elseif code == "false" then
                        val["Function"](false)
                    end
                end)
            else
                spawn(function()
                    val["Function"](val["Default"])
                end)
            end
        end
        function returnfuncs2:Dropdown(argtable2)
            local val = {
                ["Name"] = argtable2["Name"],
                ["List"] = argtable2["List"],
                ["Function"] = argtable2["Function"]
            }
            table.insert(dropdowns, val)
            if Azura["betterisfile"]("azura/configs/"..GameSave.."/"..argtable["Name"].."Dropdown"..val["Name"]..".azu") then
                spawn(function()
                    local savedval = tonumber(readfile("azura/configs/"..GameSave.."/"..argtable["Name"].."Dropdown"..val["Name"]..".azu"))
                    local val2 = val["List"][savedval]
                    val["Function"](val2)
                end)
            else
                spawn(function()
                    val["Function"](val["List"][1])
                end)
            end
        end
        function returnfuncs2:Textbox(argtable2)
            local val = {
                ["Name"] = argtable2["Name"],
                ["ExampleText"] = argtable2["ExampleText"] or "Example",
                ["Function"] = argtable2["Function"]
            }
            table.insert(textboxes, val)
            if Azura["betterisfile"]("azura/configs/"..GameSave.."/"..argtable["Name"].."Textbox"..val["Name"]..".azu") then
                spawn(function()
                    local val2 = readfile("azura/configs/"..GameSave.."/"..argtable["Name"].."Textbox"..val["Name"]..".azu")
                    val["Function"](val2)
                end)
            end
        end
        function returnfuncs2:Slider(argtable2)
            local val = {
                ["Name"] = argtable2["Name"],
                ["Min"] = argtable2["Min"] or 0,
                ["Max"] = argtable2["Max"] or 10,
                ["Default"] = argtable2["Default"] or 0,
                ["Round"]  = argtable2["Round"] or 1,
                ["Function"] = argtable2["Function"]
            }
            table.insert(sliders, val)
            if Azura["betterisfile"]("azura/configs/"..GameSave.."/"..argtable["Name"].."Slider"..val["Name"]..".azu") then
                spawn(function()
                    local val2 = tonumber(readfile("azura/configs/"..GameSave.."/"..argtable["Name"].."Slider"..val["Name"]..".azu"))
                    val["Function"](val2)
                end)
            end
        end
        function returnfuncs2:FixSuffix()
            if Button2.TextColor3 == Color and argtable["ExtraText"] ~= nil then
                shared["azuraarray"].Remove(argtable["Name"])
                shared["azuraarray"].Add(argtable["Name"], argtable["ExtraText"]())
            end
        end
        connections[#connections+1] = game:GetService("UserInputService").InputBegan:Connect(function(input)
            if Keybinds[argtable["Name"]] ~= nil then
                if game:GetService("UserInputService"):GetFocusedTextBox() == nil and input.KeyCode == Keybinds[argtable["Name"]][1] then
                    returnfuncs2:ToggleButton(false)
                end
            end
        end)
        spawn(function()
            if Azura["betterisfile"]("azura/configs/"..GameSave.."/"..argtable["Name"]..".azu") then
                local filetext = readfile("azura/configs/"..GameSave.."/"..argtable["Name"]..".azu")
                if filetext == "true" and Button2.TextColor3 == Color3.fromRGB(255, 255, 255) then
                    returnfuncs2:ToggleButton(true)
                end
            end
        end)
        return returnfuncs2
    end
    return returnfuncs
end

spawn(function()
    task.wait()
    local scripts = GuiLibrary:NewTab("Scripts")
    for i,v in pairs(listfiles("azura/Scripts/"..GameSave)) do
        local v2 = loadstring(readfile(v))()
        local script = scripts:NewToggle({
            ["Name"] = v2["Name"],
            ["InfoText"] = v2["InfoText"] or nil,
            ["Function"] = v2["Function"]
        })
    end
end)

return GuiLibrary
