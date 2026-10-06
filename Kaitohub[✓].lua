local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

-- Pastikan PlayerGui tersedia
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Hapus UI lama jika ada biar tidak bertumpuk
if PlayerGui:FindFirstChild("KaitoHub_System") then
	PlayerGui.KaitoHub_System:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KaitoHub_System"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- Screen Overlay (Menutupi Layar saat Teleport)
local OverlayFrame = Instance.new("Frame")
OverlayFrame.Name = "OverlayFrame"
OverlayFrame.Size = UDim2.new(1, 0, 1, 0)
OverlayFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
OverlayFrame.BackgroundTransparency = 1
OverlayFrame.ZIndex = 100
OverlayFrame.Visible = false
OverlayFrame.Parent = ScreenGui

local OverlayImage = Instance.new("ImageLabel")
OverlayImage.Size = UDim2.new(1, 0, 1, 0)
OverlayImage.BackgroundTransparency = 1
OverlayImage.Image = "rbxassetid://95557629022685"
OverlayImage.ScaleType = Enum.ScaleType.Fit
OverlayImage.ZIndex = 101
OverlayImage.Parent = OverlayFrame

-- Floating Icon (Tombol Buka/Tutup)
local FloatingIcon = Instance.new("ImageButton")
FloatingIcon.Name = "KaitoFloatingIcon"
FloatingIcon.Size = UDim2.new(0, 50, 0, 50)
FloatingIcon.Position = UDim2.new(0.05, 0, 0.2, 0)
FloatingIcon.BackgroundColor3 = Color3.fromRGB(8, 12, 20)
FloatingIcon.Image = "rbxassetid://87630540887682"
FloatingIcon.Active = true
FloatingIcon.Draggable = true
FloatingIcon.Visible = true
FloatingIcon.Parent = ScreenGui

Instance.new("UICorner", FloatingIcon).CornerRadius = UDim.new(1, 0)

local IconGlow = Instance.new("UIStroke", FloatingIcon)
IconGlow.Thickness = 2.5
IconGlow.Color = Color3.fromRGB(0, 195, 255)

-- Main Frame UI (Neon Dark Blue Design)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "KaitoMainFrame"
MainFrame.Size = UDim2.new(0, 330, 0, 180)
MainFrame.Position = UDim2.new(0.5, -165, 0.5, -90)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 14, 23)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true
MainFrame.Visible = true
MainFrame.Parent = ScreenGui

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 10)

-- Gradient Background (Hitam ke Biru Gelap)
local MainGradient = Instance.new("UIGradient", MainFrame)
MainGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(6, 8, 14)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 25, 45))
})
MainGradient.Rotation = 45

local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Thickness = 2
MainStroke.Color = Color3.fromRGB(0, 170, 255)

-- Header Bar
local Header = Instance.new("Frame", MainFrame)
Header.Size = UDim2.new(1, 0, 0, 38)
Header.BackgroundColor3 = Color3.fromRGB(12, 18, 30)
Header.BorderSizePixel = 0

local TitleLabel = Instance.new("TextLabel", Header)
TitleLabel.Size = UDim2.new(1, -15, 1, 0)
TitleLabel.Position = UDim2.new(0, 15, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "KAITO HUB  |  <font color=\"rgb(0, 225, 255)\">GGSIHLUH</font>"
TitleLabel.RichText = true
TitleLabel.TextColor3 = Color3.fromRGB(240, 240, 255)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 12
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

local HeaderLine = Instance.new("Frame", Header)
HeaderLine.Size = UDim2.new(1, 0, 0, 1)
HeaderLine.Position = UDim2.new(0, 0, 1, -1)
HeaderLine.BackgroundColor3 = Color3.fromRGB(0, 150, 230)
HeaderLine.BorderSizePixel = 0

-- Tombol Instant Collect Egg (Neon Blue + Dark Combination)
local CollectBtn = Instance.new("TextButton", MainFrame)
CollectBtn.Size = UDim2.new(0.86, 0, 0, 46)
CollectBtn.Position = UDim2.new(0.07, 0, 0.45, 0)
CollectBtn.BackgroundColor3 = Color3.fromRGB(8, 20, 38)
CollectBtn.Text = "Instant Collect Egg"
CollectBtn.TextColor3 = Color3.fromRGB(0, 230, 255)
CollectBtn.Font = Enum.Font.GothamBold
CollectBtn.TextSize = 13
CollectBtn.AutoButtonColor = false

Instance.new("UICorner", CollectBtn).CornerRadius = UDim.new(0, 8)

local BtnGradient = Instance.new("UIGradient", CollectBtn)
BtnGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(4, 15, 30)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(10, 40, 75)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 90, 160))
})

local BtnStroke = Instance.new("UIStroke", CollectBtn)
BtnStroke.Thickness = 1.5
BtnStroke.Color = Color3.fromRGB(0, 200, 255)

-- Animasi Hover Tombol
CollectBtn.MouseEnter:Connect(function()
	TweenService:Create(BtnStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(100, 240, 255)}):Play()
	TweenService:Create(CollectBtn, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
end)

CollectBtn.MouseLeave:Connect(function()
	TweenService:Create(BtnStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(0, 200, 255)}):Play()
	TweenService:Create(CollectBtn, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(0, 230, 255)}):Play()
end)

-- Event Buka/Tutup UI dari Floating Icon
FloatingIcon.MouseButton1Click:Connect(function()
	MainFrame.Visible = not MainFrame.Visible
end)

-- Fitur Teleport & Overlay Screen
local isProcessing = false

CollectBtn.MouseButton1Click:Connect(function()
	if isProcessing then return end
	isProcessing = true
	
	local char = LocalPlayer.Character
	local hrp = char and char:FindFirstChild("HumanoidRootPart")
	
	if hrp then
		OverlayFrame.Visible = true
		OverlayFrame.BackgroundTransparency = 0
		
		local originalCFrame = hrp.CFrame
		
		-- Teleport 20 studs ke bawah
		hrp.CFrame = originalCFrame * CFrame.new(0, -20, 0)
		
		task.wait(0.5)
		
		-- Teleport balik ke posisi awal
		hrp.CFrame = originalCFrame
		
		task.wait(0.2)
		
		OverlayFrame.Visible = false
	end
	
	isProcessing = false
end)
