-- // ACUSADO NINJA HUB OFICIAL //
-- Clave establecida: BACK01

local CLAVE_REAL = "BACK01"

local function IniciarScript()
    local Players = game:GetService("Players")
    local L_Plr = Players.LocalPlayer
    local Camera = workspace.CurrentCamera
    
    local ScreenGui = Instance.new("ScreenGui", (gethui and gethui()) or game:GetService("CoreGui"))
    local Main = Instance.new("Frame", ScreenGui)
    Main.Size = UDim2.new(0, 500, 0, 380); Main.Position = UDim2.new(0.5, -250, 0.5, -190)
    Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10); Main.Active = true; Main.Draggable = true
    Instance.new("UIStroke", Main).Color = Color3.fromRGB(0, 255, 0)
    
    local Title = Instance.new("TextLabel", Main)
    Title.Size = UDim2.new(1, 0, 0, 45); Title.Text = "ACUSADO NINJA HUB 👑"; Title.TextColor3 = Color3.fromRGB(0, 255, 0)
    Title.BackgroundColor3 = Color3.fromRGB(20, 20, 20); Title.TextSize = 20

    -- --- FUNCIONES ---
    
    -- 1. DELETE TOOL
    local DelBtn = Instance.new("TextButton", Main)
    DelBtn.Size = UDim2.new(0, 200, 0, 40); DelBtn.Position = UDim2.new(0.05, 0, 0.2, 0)
    DelBtn.Text = "ACUSADO DELETE TOOL"; DelBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30); DelBtn.TextColor3 = Color3.new(1,1,1)
    DelBtn.MouseButton1Click:Connect(function()
        local t = Instance.new("Tool", L_Plr.Backpack); t.Name = "DEL_TOOL"; t.RequiresHandle = false
        t.Activated:Connect(function() if L_Plr:GetMouse().Target then L_Plr:GetMouse().Target:Destroy() end end)
    end)

    -- 2. HITBOXES (CABEZAS)
    _G.HSize = 15
    local HitBoxBtn = Instance.new("TextButton", Main)
    HitBoxBtn.Size = UDim2.new(0, 200, 0, 40); HitBoxBtn.Position = UDim2.new(0.05, 0, 0.35, 0)
    HitBoxBtn.Text = "ACTIVAR CABEZOTAS"; HitBoxBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30); HitBoxBtn.TextColor3 = Color3.new(1,1,1)
    HitBoxBtn.MouseButton1Click:Connect(function()
        task.spawn(function()
            while task.wait(0.5) do
                for _, p in pairs(Players:GetPlayers()) do
                    if p ~= L_Plr and p.Character and p.Character:FindFirstChild("Head") then
                        p.Character.Head.Size = Vector3.new(_G.HSize, _G.HSize, _G.HSize)
                        p.Character.Head.Transparency = 0.6; p.Character.Head.CanCollide = false
                    end
                end
            end
        end)
    end)

    -- 3. ESP (BOXES)
    local ESPBtn = Instance.new("TextButton", Main)
    ESPBtn.Size = UDim2.new(0, 200, 0, 40); ESPBtn.Position = UDim2.new(0.55, 0, 0.2, 0)
    ESPBtn.Text = "ACTIVAR ESP BOX"; ESPBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30); ESPBtn.TextColor3 = Color3.new(1,1,1)
    ESPBtn.MouseButton1Click:Connect(function()
        -- Lógica de ESP simple aquí
    end)

    -- 4. OPTIMIZAR FPS
    local FPSBtn = Instance.new("TextButton", Main)
    FPSBtn.Size = UDim2.new(0, 200, 0, 40); FPSBtn.Position = UDim2.new(0.55, 0, 0.35, 0)
    FPSBtn.Text = "OPTIMIZAR FPS"; FPSBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30); FPSBtn.TextColor3 = Color3.new(1,1,1)
    FPSBtn.MouseButton1Click:Connect(function()
        for _, v in pairs(game:GetDescendants()) do 
            if v:IsA("Part") or v:IsA("MeshPart") then v.Material = Enum.Material.SmoothPlastic 
            elseif v:IsA("Decal") then v:Destroy() end 
        end
    end)
end

-- --- KEY SYSTEM ---
local KeyGui = Instance.new("ScreenGui", (gethui and gethui()) or game:GetService("CoreGui"))
local KFrame = Instance.new("Frame", KeyGui)
KFrame.Size = UDim2.new(0, 300, 0, 160); KFrame.Position = UDim2.new(0.5, -150, 0.5, -80); KFrame.BackgroundColor3 = Color3.new(0,0,0)
Instance.new("UIStroke", KFrame).Color = Color3.fromRGB(0, 255, 0)

local KInput = Instance.new("TextBox", KFrame)
KInput.Size = UDim2.new(0, 220, 0, 40); KInput.Position = UDim2.new(0.5, -110, 0.35, 0); KInput.PlaceholderText = "Escribe BACK01"

local KBtn = Instance.new("TextButton", KFrame)
KBtn.Size = UDim2.new(0, 100, 0, 35); KBtn.Position = UDim2.new(0.5, -50, 0.7, 0); KBtn.Text = "ENTRAR"
KBtn.MouseButton1Click:Connect(function()
    if KInput.Text == CLAVE_REAL then KeyGui:Destroy(); IniciarScript() end
end)
