-- // ACUSADO NINJA HUB - MENÚ ORIGINAL //
-- Clave: BACK01

local CLAVE_ACCESO = "BACK01"

local function IniciarHubOriginal()
    local Players = game:GetService("Players")
    local L_Plr = Players.LocalPlayer
    local Lighting = game:GetService("Lighting")

    local ScreenGui = Instance.new("ScreenGui")
    pcall(function() ScreenGui.Parent = (gethui and gethui()) or game:GetService("CoreGui") end)
    
    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.Size = UDim2.new(0, 530, 0, 390)
    MainFrame.Position = UDim2.new(0.5, -265, 0.5, -190)
    MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    Instance.new("UICorner", MainFrame)
    local MainStroke = Instance.new("UIStroke", MainFrame)
    MainStroke.Color = Color3.fromRGB(0, 255, 0)
    MainStroke.Thickness = 2

    local Banner = Instance.new("TextLabel", MainFrame)
    Banner.Size = UDim2.new(1, 0, 0, 45)
    Banner.Text = "  ACUSADO NINJA HUB 👑"
    Banner.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Banner.TextColor3 = Color3.fromRGB(0, 255, 0)
    Banner.Font = Enum.Font.Code; Banner.TextSize = 20; Banner.TextXAlignment = Enum.TextXAlignment.Left

    -- --- CONTENEDORES DE PESTAÑAS ---
    local Container = Instance.new("Frame", MainFrame)
    Container.Position = UDim2.new(0, 150, 0, 55); Container.Size = UDim2.new(1, -160, 1, -65); Container.BackgroundTransparency = 1
    
    local Tabs = { Combat = Instance.new("ScrollingFrame"), Visuals = Instance.new("ScrollingFrame"), Misc = Instance.new("ScrollingFrame") }
    for name, frame in pairs(Tabs) do
        frame.Size = UDim2.new(1, 0, 1, 0); frame.BackgroundTransparency = 1; frame.Visible = (name == "Combat"); frame.Parent = Container; frame.ScrollBarThickness = 0
        Instance.new("UIListLayout", frame).Padding = UDim.new(0, 10)
    end

    local function AddBtn(parent, text, func)
        local b = Instance.new("TextButton", parent); b.Size = UDim2.new(1, -10, 0, 40)
        b.BackgroundColor3 = Color3.fromRGB(30, 30, 30); b.Text = "[ " .. text .. " ]"; b.TextColor3 = Color3.fromRGB(0, 255, 0); b.Font = Enum.Font.Code; Instance.new("UICorner", b)
        b.MouseButton1Click:Connect(function() pcall(func) end)
    end

    -- PESTAÑA COMBATE
    AddBtn(Tabs.Combat, "CARGAR AIMBOT MOBILE", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/DanielHubll/DanielHubll/refs/heads/main/Aimbot%20Mobile"))() end)
    AddBtn(Tabs.Combat, "ACTIVAR HITBOXES", function()
        _G.HitboxActive = true
        task.spawn(function()
            while _G.HitboxActive do
                for _, p in pairs(Players:GetPlayers()) do
                    if p ~= L_Plr and p.Character and p.Character:FindFirstChild("Head") then
                        p.Character.Head.Size = Vector3.new(15, 15, 15)
                        p.Character.Head.Transparency = 0.6; p.Character.Head.CanCollide = false
                    end
                end
                task.wait(1)
            end
        end)
    end)

    -- PESTAÑA VISUALES
    AddBtn(Tabs.Visuals, "ACTIVAR BOX ESP", function() print("ESP Activado") end)

    -- PESTAÑA SISTEMA
    AddBtn(Tabs.Misc, "ACUSADO DELETE TOOL", function()
        local t = Instance.new("Tool", L_Plr.Backpack); t.Name = "DEL_TOOL"; t.RequiresHandle = false
        t.Activated:Connect(function() if L_Plr:GetMouse().Target then L_Plr:GetMouse().Target:Destroy() end end)
    end)
    AddBtn(Tabs.Misc, "OPTIMIZAR FPS", function() 
        Lighting.GlobalShadows = false
        for _, v in pairs(game:GetDescendants()) do if v:IsA("Part") then v.Material = Enum.Material.SmoothPlastic end end 
    end)

    -- NAVEGACIÓN LATERAL
    local Sidebar = Instance.new("Frame", MainFrame); Sidebar.Size = UDim2.new(0, 140, 1, -55); Sidebar.Position = UDim2.new(0, 5, 0, 50); Sidebar.BackgroundTransparency = 1
    local function AddTab(txt, target, y)
        local b = Instance.new("TextButton", Sidebar); b.Size = UDim2.new(1, -10, 0, 45); b.Position = UDim2.new(0, 5, 0, y)
        b.BackgroundColor3 = Color3.fromRGB(20, 20, 20); b.Text = txt; b.TextColor3 = Color3.fromRGB(0, 255, 0); b.Font = Enum.Font.Code; Instance.new("UICorner", b)
        b.MouseButton1Click:Connect(function() for _, t in pairs(Tabs) do t.Visible = false end; Tabs[target].Visible = true end)
    end
    AddTab("COMBATE", "Combat", 0); AddTab("VISUALES", "Visuals", 55); AddTab("SISTEMA", "Misc", 110)
end

-- KEY SYSTEM
local KeyGui = Instance.new("ScreenGui", (gethui and gethui()) or game:GetService("CoreGui"))
local KFrame = Instance.new("Frame", KeyGui); KFrame.Size = UDim2.new(0, 300, 0, 160); KFrame.Position = UDim2.new(0.5, -150, 0.5, -80); KFrame.BackgroundColor3 = Color3.new(0,0,0); Instance.new("UIStroke", KFrame).Color = Color3.fromRGB(0,255,0)
local KInput = Instance.new("TextBox", KFrame); KInput.Size = UDim2.new(0, 200, 0, 40); KInput.Position = UDim2.new(0.5, -100, 0.35, 0); KInput.PlaceholderText = "KEY AQUÍ"
local KBtn = Instance.new("TextButton", KFrame); KBtn.Size = UDim2.new(0, 100, 0, 35); KBtn.Position = UDim2.new(0.5, -50, 0.7, 0); KBtn.Text = "ENTRAR"
KBtn.MouseButton1Click:Connect(function() if KInput.Text == CLAVE_ACCESO then KeyGui:Destroy(); IniciarHubOriginal() end end)
