-- // ACUSADO NINJA HUB - VERSIÓN FINAL //
-- Clave según la ley: BACK01

local CLAVE_DE_ACCESO = "BACK01"

local function IniciarHub()
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local Lighting = game:GetService("Lighting")
    local L_Plr = Players.LocalPlayer
    local Camera = workspace.CurrentCamera

    local ScreenGui = Instance.new("ScreenGui")
    pcall(function() ScreenGui.Parent = (gethui and gethui()) or game:GetService("CoreGui") end)
    ScreenGui.Name = "ACUSADO_NINJA_HUB"

    local Neon_Green = Color3.fromRGB(0, 255, 0)
    local Carbon_Black = Color3.fromRGB(10, 10, 10)

    _G.Hitbox_Size = 15
    _G.Hitbox_Active = false
    _G.ESP_Enabled = false

    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.Size = UDim2.new(0, 530, 0, 390); MainFrame.Position = UDim2.new(0.5, -265, 0.5, -190)
    MainFrame.BackgroundColor3 = Carbon_Black; MainFrame.Active = true; MainFrame.Draggable = true; Instance.new("UICorner", MainFrame)
    local MainStroke = Instance.new("UIStroke", MainFrame); MainStroke.Color = Neon_Green; MainStroke.Thickness = 2

    local Banner = Instance.new("TextLabel", MainFrame)
    Banner.Size = UDim2.new(1, 0, 0, 45); Banner.Text = "  ACUSADO NINJA HUB 👑"
    Banner.BackgroundColor3 = Color3.fromRGB(20, 20, 20); Banner.TextColor3 = Neon_Green; Banner.Font = Enum.Font.Code; Banner.TextSize = 20; Banner.TextXAlignment = Enum.TextXAlignment.Left; Instance.new("UICorner", Banner)

    -- HITBOXES
    task.spawn(function()
        while task.wait(0.5) do
            if _G.Hitbox_Active then
                for _, p in pairs(Players:GetPlayers()) do
                    if p ~= L_Plr and p.Character and p.Character:FindFirstChild("Head") then
                        pcall(function()
                            local head = p.Character.Head
                            head.Size = Vector3.new(_G.Hitbox_Size, _G.Hitbox_Size, _G.Hitbox_Size)
                            head.Transparency = 0.7; head.CanCollide = false
                        end)
                    end
                end
            end
        end
    end)

    -- CONTENEDORES
    local Container = Instance.new("Frame", MainFrame)
    Container.Position = UDim2.new(0, 150, 0, 55); Container.Size = UDim2.new(1, -160, 1, -65); Container.BackgroundTransparency = 1
    local Tabs = { Combat = Instance.new("ScrollingFrame"), Visuals = Instance.new("ScrollingFrame"), Misc = Instance.new("ScrollingFrame") }
    for name, frame in pairs(Tabs) do
        frame.Size = UDim2.new(1, 0, 1, 0); frame.BackgroundTransparency = 1; frame.Visible = (name == "Combat"); frame.Parent = Container; frame.ScrollBarThickness = 0
        Instance.new("UIListLayout", frame).Padding = UDim.new(0, 10)
    end

    local function AddBtn(parent, text, func)
        local b = Instance.new("TextButton", parent); b.Size = UDim2.new(1, -10, 0, 40)
        b.BackgroundColor3 = Color3.fromRGB(30, 30, 30); b.Text = "[ " .. text .. " ]"; b.TextColor3 = Neon_Green; b.Font = Enum.Font.Code; b.TextSize = 14; Instance.new("UICorner", b)
        b.MouseButton1Click:Connect(function() pcall(func) end)
    end

    AddBtn(Tabs.Combat, "CARGAR AIMBOT MOBILE", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/DanielHubll/DanielHubll/refs/heads/main/Aimbot%20Mobile"))() end)
    local SizeIn = Instance.new("TextBox", Tabs.Combat); SizeIn.Size = UDim2.new(1, -10, 0, 40); SizeIn.PlaceholderText = "TAMAÑO CABEZA"; SizeIn.BackgroundColor3 = Color3.fromRGB(15,15,15); SizeIn.TextColor3 = Neon_Green; SizeIn.Font = Enum.Font.Code; Instance.new("UICorner", SizeIn)
    SizeIn.FocusLost:Connect(function() _G.Hitbox_Size = tonumber(SizeIn.Text) or 15 end)
    AddBtn(Tabs.Combat, "ACTIVAR CABEZAS", function() _G.Hitbox_Active = not _G.Hitbox_Active end)

    AddBtn(Tabs.Visuals, "ACTIVAR BOX ESP", function() _G.ESP_Enabled = not _G.ESP_Enabled end)

    AddBtn(Tabs.Misc, "OPTIMIZAR FPS", function() 
        Lighting.GlobalShadows = false
        for _, v in pairs(game:GetDescendants()) do if v:IsA("Part") then v.Material = Enum.Material.SmoothPlastic end end 
    end)
    AddBtn(Tabs.Misc, "ACUSADO DELETE TOOL", function() 
        local t = Instance.new("Tool", L_Plr.Backpack); t.Name = "DEL_TOOL"; t.RequiresHandle = false
        t.Activated:Connect(function() 
            local target = L_Plr:GetMouse().Target 
            if target and not target.Parent:FindFirstChild("Humanoid") then target:Destroy() end 
        end) 
    end)

    local Sidebar = Instance.new("Frame", MainFrame); Sidebar.Size = UDim2.new(0, 140, 1, -55); Sidebar.Position = UDim2.new(0, 5, 0, 50); Sidebar.BackgroundTransparency = 1
    local function AddTab(txt, target, y)
        local b = Instance.new("TextButton", Sidebar); b.Size = UDim2.new(1, -10, 0, 45); b.Position = UDim2.new(0, 5, 0, y)
        b.BackgroundColor3 = Color3.fromRGB(20, 20, 20); b.Text = txt; b.TextColor3 = Neon_Green; b.Font = Enum.Font.Code; Instance.new("UICorner", b)
        b.MouseButton1Click:Connect(function() for _, t in pairs(Tabs) do t.Visible = false end; Tabs[target].Visible = true end)
    end
    AddTab("COMBATE", "Combat", 0); AddTab("VISUALES", "Visuals", 55); AddTab("SISTEMA", "Misc", 110)

    local CloseBtn = Instance.new("TextButton", MainFrame); CloseBtn.Size = UDim2.new(0, 30, 0, 30); CloseBtn.Position = UDim2.new(1, -38, 0, 8); CloseBtn.Text = "X"; CloseBtn.BackgroundColor3 = Color3.fromRGB(50,0,0); CloseBtn.TextColor3 = Neon_Green; Instance.new("UICorner", CloseBtn)
    CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)
end

-- // KEY SYSTEM //
local KeyGui = Instance.new("ScreenGui", (gethui and gethui()) or game:GetService("CoreGui"))
local KFrame = Instance.new("Frame", KeyGui); KFrame.Size = UDim2.new(0, 300, 0, 160); KFrame.Position = UDim2.new(0.5, -150, 0.5, -80); KFrame.BackgroundColor3 = Carbon_Black; KFrame.Active = true; KFrame.Draggable = true; Instance.new("UICorner", KFrame)
local KTitle = Instance.new("TextLabel", KFrame); KTitle.Size = UDim2.new(1,0,0,40); KTitle.Text = "INGRESE KEY"; KTitle.TextColor3 = Neon_Green; KTitle.BackgroundTransparency = 1; KTitle.Font = Enum.Font.Code
local KInput = Instance.new("TextBox", KFrame); KInput.Size = UDim2.new(0,200,0,40); KInput.Position = UDim2.new(0.5,-100,0.4,0); KInput.PlaceholderText = "Escribir aquí..."; KInput.BackgroundColor3 = Color3.fromRGB(25,25,25); KInput.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", KInput)
local KBtn = Instance.new("TextButton", KFrame); KBtn.Size = UDim2.new(0,100,0,30); KBtn.Position = UDim2.new(0.5,-50,0.75,0); KBtn.Text = "ENTRAR"; KBtn.BackgroundColor3 = Color3.fromRGB(0,80,0); KBtn.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", KBtn)

KBtn.MouseButton1Click:Connect(function()
    if KInput.Text == CLAVE_DE_ACCESO then
        KeyGui:Destroy()
        IniciarHub()
    else
        KInput.Text = ""; KInput.PlaceholderText = "KEY INCORRECTA"
    end
end)
