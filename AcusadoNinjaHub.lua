-- // ACUSADO NINJA HUB - FULL HACKER EDITION 👑 //
-- Key: ACUSADO23

local CLAVE_CORRECTA = "ACUSADO23"

local function ExecuteHub()
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local Lighting = game:GetService("Lighting")
    local L_Plr = Players.LocalPlayer
    local Camera = workspace.CurrentCamera

    -- // CONFIGURACIÓN GUI //
    local ScreenGui = Instance.new("ScreenGui")
    pcall(function() ScreenGui.Parent = (gethui and gethui()) or game:GetService("CoreGui") end)
    ScreenGui.Name = "ACUSADO_FULL_" .. math.random(100,999)

    local Neon_Green = Color3.fromRGB(0, 255, 0)
    local Carbon_Black = Color3.fromRGB(10, 10, 10)

    -- // VENTANA DE KEY //
    local KeyFrame = Instance.new("Frame", ScreenGui)
    KeyFrame.Size = UDim2.new(0, 300, 0, 160); KeyFrame.Position = UDim2.new(0.5, -150, 0.5, -80)
    KeyFrame.BackgroundColor3 = Carbon_Black; KeyFrame.Active = true; KeyFrame.Draggable = true; Instance.new("UICorner", KeyFrame)
    local KeyStroke = Instance.new("UIStroke", KeyFrame); KeyStroke.Color = Neon_Green; KeyStroke.Thickness = 2

    local KeyTitle = Instance.new("TextLabel", KeyFrame)
    KeyTitle.Size = UDim2.new(1, 0, 0, 40); KeyTitle.Text = "INGRESE LA CLAVE"; KeyTitle.TextColor3 = Neon_Green; KeyTitle.BackgroundTransparency = 1; KeyTitle.Font = Enum.Font.Code; KeyTitle.TextSize = 18

    local KeyInput = Instance.new("TextBox", KeyFrame)
    KeyInput.Size = UDim2.new(0, 220, 0, 40); KeyInput.Position = UDim2.new(0.5, -110, 0.45, 0)
    KeyInput.PlaceholderText = "Escribe aquí..."; KeyInput.Text = ""; KeyInput.BackgroundColor3 = Color3.fromRGB(20,20,20); KeyInput.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", KeyInput)

    local KeyBtn = Instance.new("TextButton", KeyFrame)
    KeyBtn.Size = UDim2.new(0, 120, 0, 35); KeyBtn.Position = UDim2.new(0.5, -60, 0.78, 0)
    KeyBtn.Text = "VALIDAR"; KeyBtn.BackgroundColor3 = Color3.fromRGB(0, 40, 0); KeyBtn.TextColor3 = Neon_Green; Instance.new("UICorner", KeyBtn)

    -- // VENTANA PRINCIPAL (TUS OPCIONES INTACTAS) //
    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.Size = UDim2.new(0, 530, 0, 390); MainFrame.Position = UDim2.new(0.5, -265, 0.5, -190)
    MainFrame.BackgroundColor3 = Carbon_Black; MainFrame.Visible = false; MainFrame.Active = true; MainFrame.Draggable = true; Instance.new("UICorner", MainFrame)
    local MainStroke = Instance.new("UIStroke", MainFrame); MainStroke.Color = Neon_Green; MainStroke.Thickness = 2

    -- Lógica de Entrada
    KeyBtn.MouseButton1Click:Connect(function()
        if KeyInput.Text == CLAVE_CORRECTA then
            KeyFrame:Destroy()
            MainFrame.Visible = true
        else
            KeyInput.Text = ""; KeyInput.PlaceholderText = "CLAVE INVÁLIDA"
        end
    end)

    _G.Hitbox_Size = 15
    _G.Hitbox_Active = false
    _G.ESP_Enabled = false

    local Banner = Instance.new("TextLabel", MainFrame)
    Banner.Size = UDim2.new(1, 0, 0, 45); Banner.Text = "  ACUSADO NINJA HUB 👑 [TODAS LAS OPCIONES]"
    Banner.BackgroundColor3 = Color3.fromRGB(20, 20, 20); Banner.TextColor3 = Neon_Green; Banner.Font = Enum.Font.Code; Banner.TextSize = 20; Banner.TextXAlignment = Enum.TextXAlignment.Left; Instance.new("UICorner", Banner)

    -- // TU LÓGICA DE CABEZAS //
    task.spawn(function()
        while task.wait(0.5) do
            if _G.Hitbox_Active then
                for _, p in pairs(Players:GetPlayers()) do
                    if p ~= L_Plr and p.Character and p.Character:FindFirstChild("Head") then
                        pcall(function()
                            local head = p.Character.Head
                            if head.Size.X ~= _G.Hitbox_Size then
                                head.Size = Vector3.new(_G.Hitbox_Size, _G.Hitbox_Size, _G.Hitbox_Size)
                                head.Transparency = 0.7; head.CanCollide = false; head.Massless = true
                            end
                        end)
                    end
                end
            end
        end
    end)

    -- // TU SISTEMA BOX ESP //
    local function CreateESP(plt)
        local Box = Drawing.new("Square"); Box.Thickness = 2; Box.Filled = false; Box.Visible = false; Box.Color = Neon_Green
        local Name = Drawing.new("Text"); Name.Size = 14; Name.Center = true; Name.Outline = true; Name.Color = Neon_Green; Name.Visible = false

        local conn; conn = RunService.RenderStepped:Connect(function()
            if _G.ESP_Enabled and plt.Character and plt.Character:FindFirstChild("HumanoidRootPart") and plt.Character.Humanoid.Health > 0 then
                local hrp = plt.Character.HumanoidRootPart
                local pos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
                if onScreen then
                    local sizeX = 2300 / pos.Z; local sizeY = 3200 / pos.Z
                    Box.Size = Vector2.new(sizeX, sizeY); Box.Position = Vector2.new(pos.X - sizeX / 2, pos.Y - sizeY / 2); Box.Visible = true
                    Name.Text = plt.Name; Name.Position = Vector2.new(pos.X, (pos.Y - sizeY / 2) - 15); Name.Visible = true
                else Box.Visible = false; Name.Visible = false end
            else
                Box.Visible = false; Name.Visible = false
                if not plt.Parent then Box:Remove(); Name:Remove(); conn:Disconnect() end
            end
        end)
    end

    -- // TU CONTENEDOR //
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

    -- --- TUS OPCIONES DE COMBATE ---
    AddBtn(Tabs.Combat, "CARGAR AIMBOT MOBILE", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/DanielHubll/DanielHubll/refs/heads/main/Aimbot%20Mobile"))() end)
    local SizeIn = Instance.new("TextBox", Tabs.Combat); SizeIn.Size = UDim2.new(1, -10, 0, 40); SizeIn.PlaceholderText = "TAMAÑO CABEZA (EJ: 20)"; SizeIn.BackgroundColor3 = Color3.fromRGB(15,15,15); SizeIn.TextColor3 = Neon_Green; SizeIn.Font = Enum.Font.Code; Instance.new("UICorner", SizeIn)
    SizeIn.FocusLost:Connect(function() _G.Hitbox_Size = tonumber(SizeIn.Text) or 15 end)
    AddBtn(Tabs.Combat, "ACTIVAR CABEZAS", function() _G.Hitbox_Active = not _G.Hitbox_Active end)

    -- --- TUS OPCIONES VISUALES ---
    AddBtn(Tabs.Visuals, "ACTIVAR BOX ESP", function() 
        _G.ESP_Enabled = not _G.ESP_Enabled 
        if _G.ESP_Enabled then for _, p in pairs(Players:GetPlayers()) do if p ~= L_Plr then CreateESP(p) end end end
    end)

    -- --- TUS OPCIONES DE SISTEMA (MISC) ---
    AddBtn(Tabs.Misc, "OPTIMIZAR FPS", function() 
        Lighting.GlobalShadows = false
        for _, v in pairs(game:GetDescendants()) do 
            if v:IsA("Part") then v.Material = Enum.Material.SmoothPlastic 
            elseif v:IsA("Decal") then v:Destroy() end 
        end 
    end)
    AddBtn(Tabs.Misc, "ACUSADO DELETE TOOL", function() 
        local t = Instance.new("Tool", L_Plr.Backpack); t.Name = "DEL_TOOL"; t.RequiresHandle = false
        t.Activated:Connect(function() 
            local target = L_Plr:GetMouse().Target 
            if target and not target.Parent:FindFirstChild("Humanoid") then target:Destroy() end 
        end) 
    end)

    -- --- NAVEGACIÓN ---
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

pcall(ExecuteHub)
