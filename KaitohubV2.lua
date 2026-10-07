local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

if PlayerGui:FindFirstChild("KaitoHub_System") then
	PlayerGui.KaitoHub_System:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KaitoHub_System"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- Overlay Screen
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

-- Floating Icon Utama (Buka/Tutup UI)
local FloatingIcon = Instance.new("ImageButton")
FloatingIcon.Name = "KaitoFloatingIcon"
FloatingIcon.Size = UDim2.new(0, 50, 0, 50)
FloatingIcon.Position = UDim2.new(0.05, 0, 0.2, 0)
FloatingIcon.BackgroundColor3 = Color3.fromRGB(8, 12, 20)
FloatingIcon.Image = "rbxassetid://87630540887682"
FloatingIcon.Active = true
FloatingIcon.Draggable = true
FloatingIcon.Parent = ScreenGui

Instance.new("UICorner", FloatingIcon).CornerRadius = UDim.new(1, 0)

local IconGlow = Instance.new("UIStroke", FloatingIcon)
IconGlow.Thickness = 2.5
IconGlow.Color = Color3.fromRGB(0, 195, 255)

-- Main Frame UI
local MainFrame = Instance.new("Frame")
MainFrame.Name = "KaitoMainFrame"
MainFrame.Size = UDim2.new(0, 330, 0, 260)
MainFrame.Position = UDim2.new(0.5, -165, 0.5, -130)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 14, 23)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 10)

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
TitleLabel.Text = "KAITO HUB V2 |  <font color=\"rgb(0, 225, 255)\">GGSIHLUH</font>"
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

-- Function Pembuat Tombol UI
local function CreateButton(text, pos)
	local Btn = Instance.new("TextButton", MainFrame)
	Btn.Size = UDim2.new(0.86, 0, 0, 40)
	Btn.Position = pos
	Btn.BackgroundColor3 = Color3.fromRGB(8, 20, 38)
	Btn.Text = text
	Btn.TextColor3 = Color3.fromRGB(0, 230, 255)
	Btn.Font = Enum.Font.GothamBold
	Btn.TextSize = 12
	Btn.AutoButtonColor = false

	Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 8)

	local BtnGradient = Instance.new("UIGradient", Btn)
	BtnGradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(4, 15, 30)),
		ColorSequenceKeypoint.new(0.5, Color3.fromRGB(10, 40, 75)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 90, 160))
	})

	local BtnStroke = Instance.new("UIStroke", Btn)
	BtnStroke.Thickness = 1.5
	BtnStroke.Color = Color3.fromRGB(0, 200, 255)

	Btn.MouseEnter:Connect(function()
		TweenService:Create(BtnStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(100, 240, 255)}):Play()
		TweenService:Create(Btn, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
	end)

	Btn.MouseLeave:Connect(function()
		TweenService:Create(BtnStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(0, 200, 255)}):Play()
		TweenService:Create(Btn, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(0, 230, 255)}):Play()
	end)

	return Btn
end

local CollectBtn = CreateButton("Instant Collect Egg", UDim2.new(0.07, 0, 0.2, 0))
local HelperBtn = CreateButton("Helper Player", UDim2.new(0.07, 0, 0.45, 0))
local ShortcutToggleBtn = CreateButton("Shortcut Buttons: OFF", UDim2.new(0.07, 0, 0.7, 0))

-- Function Pembuat Floating Shortcut (Di luar Layar & Draggable)
local function CreateDraggableShortcut(text, pos)
	local ShortBtn = Instance.new("TextButton", ScreenGui)
	ShortBtn.Size = UDim2.new(0, 140, 0, 36)
	ShortBtn.Position = pos
	ShortBtn.BackgroundColor3 = Color3.fromRGB(10, 24, 45)
	ShortBtn.Text = text
	ShortBtn.TextColor3 = Color3.fromRGB(0, 230, 255)
	ShortBtn.Font = Enum.Font.GothamBold
	ShortBtn.TextSize = 11
	ShortBtn.Active = true
	ShortBtn.Draggable = true
	ShortBtn.Visible = false

	Instance.new("UICorner", ShortBtn).CornerRadius = UDim.new(0, 8)

	local Stroke = Instance.new("UIStroke", ShortBtn)
	Stroke.Thickness = 2
	Stroke.Color = Color3.fromRGB(0, 200, 255)

	return ShortBtn
end

-- Membuat 2 Floating Shortcut yang Bebas Digeser
local FloatingCollect = CreateDraggableShortcut("Instant Collect", UDim2.new(0.05, 0, 0.32, 0))
local FloatingHelper = CreateDraggableShortcut("Helper Player", UDim2.new(0.05, 0, 0.39, 0))

-- LOGIKA AKSI TOMBOL
local isProcessing = false

local function RunCollectEgg()
	if isProcessing then return end
	isProcessing = true
	local char = LocalPlayer.Character
	local hrp = char and char:FindFirstChild("HumanoidRootPart")
	if hrp then
		OverlayFrame.Visible = true
		OverlayFrame.BackgroundTransparency = 0
		local originalCFrame = hrp.CFrame
		hrp.CFrame = originalCFrame * CFrame.new(0, -20, 0)
		task.wait(0.5)
		hrp.CFrame = originalCFrame
		task.wait(0.2)
		OverlayFrame.Visible = false
	end
	isProcessing = false
end

local function RunHelperTeleport()
	local char = LocalPlayer.Character
	local hrp = char and char:FindFirstChild("HumanoidRootPart")
	if hrp then
		hrp.CFrame = CFrame.new(25.37, 3.00, 168.03)
	end
end

-- Hubungkan Event Click Ke Tombol Utama & Floating Shortcut
CollectBtn.MouseButton1Click:Connect(RunCollectEgg)
FloatingCollect.MouseButton1Click:Connect(RunCollectEgg)

HelperBtn.MouseButton1Click:Connect(RunHelperTeleport)
FloatingHelper.MouseButton1Click:Connect(RunHelperTeleport)

-- Toggle ON/OFF Shortcut Buttons
local shortcutEnabled = false
ShortcutToggleBtn.MouseButton1Click:Connect(function()
	shortcutEnabled = not shortcutEnabled
	if shortcutEnabled then
		ShortcutToggleBtn.Text = "Shortcut Buttons: ON"
		ShortcutToggleBtn.TextColor3 = Color3.fromRGB(0, 255, 150)
		FloatingCollect.Visible = true
		FloatingHelper.Visible = true
	else
		ShortcutToggleBtn.Text = "Shortcut Buttons: OFF"
		ShortcutToggleBtn.TextColor3 = Color3.fromRGB(0, 230, 255)
		FloatingCollect.Visible = false
		FloatingHelper.Visible = false
	end
end)

-- Event Buka/Tutup Main Frame dari Icon Utama
FloatingIcon.MouseButton1Click:Connect(function()
	MainFrame.Visible = not MainFrame.Visible
end)
