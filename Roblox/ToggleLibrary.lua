local library = {}

local togglelib = Instance.new("ScreenGui", game.CoreGui)
togglelib.Name = "togglelib"
togglelib.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
togglelib.ResetOnSpawn = false

function library:CreateToggle(toggletext, callback)
  callback = callback or function()end

  local toggle = Instance.new("Frame", togglelib)
  local UICorner = Instance.new("UICorner", toggle)
  local text = Instance.new("TextLabel", toggle)
  local togglebutton = Instance.new("TextButton", toggle)
  local UICorner_2 = Instance.new("UICorner", togglebutton)
  local state = false

  toggle.Name = "toggle"
  toggle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
  toggle.Position = UDim2.new(0.426386237, 0, 0.450199217, 0)
  toggle.Size = UDim2.new(0.125506695, 0, 0.0784063745, 0)

  text.Name = "text"
  text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  text.BackgroundTransparency = 1.000
  text.Position = UDim2.new(0, 0, -0.0202429146, 0)
  text.Size = UDim2.new(0.862023652, 0, 1, 0)
  text.Font = Enum.Font.GothamSemibold
  text.Text = toggletext or "text"
  text.TextColor3 = Color3.fromRGB(255, 255, 255)
  text.TextSize = 16.000

  togglebutton.Name = "togglebutton"
  togglebutton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
  togglebutton.Position = UDim2.new(0.762154877, 0, 0.222672105, 0)
  togglebutton.Size = UDim2.new(0.17214182, 0, 0.53441292, 0)
  togglebutton.AutoButtonColor = false
  togglebutton.Font = Enum.Font.SourceSans
  togglebutton.Text = ""
  togglebutton.TextColor3 = Color3.fromRGB(0, 0, 0)
  togglebutton.TextSize = 14.000
  togglebutton.MouseButton1Click:Connect(function()
    local info = TweenInfo.new(.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
    local toggleon = game:GetService("TweenService"):Create(togglebutton, info, {
      BackgroundColor3 = Color3.fromRGB(0, 200, 0)})
    local toggleoff = game:GetService("TweenService"):Create(togglebutton, info, {
      BackgroundColor3 = Color3.fromRGB(200, 0, 0)})
    if state then
      state = false
      callback(state)
      toggleoff:Play()
      repeat wait() until toggleoff.Completed
    else
      state = true
      callback(state)
      toggleon:Play()
      repeat wait() until toggleon.Completed
    end
  end)

  local Drag = toggle
  local gsCoreGui = game:GetService("CoreGui")
  local gsTween = game:GetService("TweenService")
  local UserInputService = game:GetService("UserInputService")
  local dragging
  local dragInput
  local dragStart
  local startPos
  local function update(input)
    local delta = input.Position - dragStart
    local dragTime = .04
    local SmoothDrag = {}
    SmoothDrag.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    local dragSmoothFunction = gsTween:Create(Drag, TweenInfo.new(dragTime, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), SmoothDrag)
    dragSmoothFunction:Play()
  end
  Drag.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
      dragging = true
      dragStart = input.Position
      startPos = Drag.Position
      input.Changed:Connect(function()
        if input.UserInputState == Enum.UserInputState.End then
          dragging = false
        end
      end)
    end
  end)
  Drag.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
      dragInput = input
    end
  end)
  UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging and Drag.Size then
      update(input)
    end
  end)

  local function rainbow()
    local r = { 
      Color3.fromRGB(254, 0, 0);  
      Color3.fromRGB(255, 127, 0); 
      Color3.fromRGB(255, 221, 1); 
      Color3.fromRGB(0, 200, 0);  
      Color3.fromRGB(0, 160, 199); 
      Color3.fromRGB(0, 55, 230);  
      Color3.fromRGB(129, 16, 210)} 
    local info = TweenInfo.new(.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
    text.TextColor3 = r[1] 
    local i = 1
    while true do
      local tween = game:GetService("TweenService"):Create(text, info, {
        TextColor3 = r[i]}) 
      tween:Play()
      repeat wait() until tween.Completed
      wait(.4)
      if i == #r then i = 1 else i = i + 1 end
    end
  end

  coroutine.wrap(rainbow())
end

return library
