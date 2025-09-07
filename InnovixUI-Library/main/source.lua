--[=[

██╗███╗   ██╗███╗   ██╗ ██████╗ ██╗   ██╗██╗██╗  ██╗
██║████╗  ██║████╗  ██║██╔═══██╗██║   ██║██║╚██╗██╔╝
██║██╔██╗ ██║██╔██╗ ██║██║   ██║██║   ██║██║ ╚███╔╝ 
██║██║╚██╗██║██║╚██╗██║██║   ██║╚██╗ ██╔╝██║ ██╔██╗ 
██║██║ ╚████║██║ ╚████║╚██████╔╝ ╚████╔╝ ██║██╔╝ ██╗   
╚═╝╚═╝  ╚═══╝╚═╝  ╚═══╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝  ╚═╝	@ script.er

]=]

-- services
local players = game:GetService("Players")
local tweenService = game:GetService("TweenService")
local uis = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local coreGui = game:GetService("CoreGui")

-- vars
local lp = game.Players.LocalPlayer
local mouse = lp:GetMouse()
local viewport = workspace.CurrentCamera.ViewportSize
local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

local Library = {}

function Library:validate(defaults, options)
	for i, v in pairs(defaults) do
		if options[i] == nil then
			options[i] = v
		end
	end
	return options
end

function Library:tween(object, goal, callback)
	local tween = tweenService:Create(object, tweenInfo, goal)
	tween.Completed:Connect(callback or function() end)
	tween:Play()
end

function Library:Init(options)
	options = Library:validate({
		name = "InnovixUI"
	}, options or {})
	
	local GUI = {
		CurrentTab = nil
	}
	
	-- Main Frame
	do
		-- StarterGui.Innovix
		GUI["1"] = Instance.new("ScreenGui", runService:IsStudio() and players.LocalPlayer:WaitForChild("PlayerGui") or coreGui);
		GUI["1"]["Name"] = [[Innovix]];
		GUI["1"]["IgnoreGuiInset"] = true;

		-- StarterGui.Innovix.MainFrame
		GUI["2"] = Instance.new("Frame", GUI["1"]);
		GUI["2"]["BorderSizePixel"] = 0;
		GUI["2"]["BackgroundColor3"] = Color3.fromRGB(43, 43, 43);
		GUI["2"]["Size"] = UDim2.new(0, 566, 0, 332);
		GUI["2"]["Position"] = UDim2.fromOffset((viewport.X/2) - (GUI["2"].Size.X.Offset / 2), (viewport.Y/2) - (GUI["2"].Size.Y.Offset / 2));
		GUI["2"]["Name"] = [[MainFrame]];

		-- StarterGui.Innovix.MainFrame.UICorner
		GUI["3"] = Instance.new("UICorner", GUI["2"]);
		GUI["3"]["CornerRadius"] = UDim.new(0, 10);

		-- StarterGui.Innovix.MainFrame.DropShadowHolder
		GUI["4"] = Instance.new("Frame", GUI["2"]);
		GUI["4"]["ZIndex"] = 0;
		GUI["4"]["BorderSizePixel"] = 0;
		GUI["4"]["Size"] = UDim2.new(1, 0, 1, 0);
		GUI["4"]["Name"] = [[DropShadowHolder]];
		GUI["4"]["BackgroundTransparency"] = 1;

		-- StarterGui.Innovix.MainFrame.DropShadowHolder.DropShadow
		GUI["5"] = Instance.new("ImageLabel", GUI["4"]);
		GUI["5"]["ZIndex"] = 0;
		GUI["5"]["BorderSizePixel"] = 0;
		GUI["5"]["SliceCenter"] = Rect.new(49, 49, 450, 450);
		GUI["5"]["ScaleType"] = Enum.ScaleType.Slice;
		GUI["5"]["ImageTransparency"] = 0.5;
		GUI["5"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["5"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		GUI["5"]["Image"] = [[rbxassetid://6014261993]];
		GUI["5"]["Size"] = UDim2.new(1, 47, 1, 47);
		GUI["5"]["BackgroundTransparency"] = 1;
		GUI["5"]["Name"] = [[DropShadow]];
		GUI["5"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

		-- StarterGui.Innovix.MainFrame.TopBar
		GUI["6"] = Instance.new("Frame", GUI["2"]);
		GUI["6"]["BorderSizePixel"] = 0;
		GUI["6"]["BackgroundColor3"] = Color3.fromRGB(29, 131, 255);
		GUI["6"]["Size"] = UDim2.new(1, 0, 0, 30);
		GUI["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["6"]["Name"] = [[TopBar]];
		

		-- StarterGui.Innovix.MainFrame.TopBar.UICorner
		GUI["7"] = Instance.new("UICorner", GUI["6"]);
		GUI["7"]["CornerRadius"] = UDim.new(0, 10);

		-- StarterGui.Innovix.MainFrame.TopBar.Extension
		GUI["8"] = Instance.new("Frame", GUI["6"]);
		GUI["8"]["BorderSizePixel"] = 0;
		GUI["8"]["BackgroundColor3"] = Color3.fromRGB(29, 131, 255);
		GUI["8"]["AnchorPoint"] = Vector2.new(0, 1);
		GUI["8"]["Size"] = UDim2.new(1, 0, 0.5, 0);
		GUI["8"]["Position"] = UDim2.new(0, 0, 1, 0);
		GUI["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["8"]["Name"] = [[Extension]];

		-- StarterGui.Innovix.MainFrame.TopBar.Title
		GUI["9"] = Instance.new("TextLabel", GUI["6"]);
		GUI["9"]["TextWrapped"] = true;
		GUI["9"]["BorderSizePixel"] = 0;
		GUI["9"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		GUI["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["9"]["TextSize"] = 14;
		GUI["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
		GUI["9"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["9"]["BackgroundTransparency"] = 1;
		GUI["9"]["Size"] = UDim2.new(0.5, 0, 1, 0);
		GUI["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["9"]["Text"] = options["name"];
		GUI["9"]["Name"] = options["name"];

		-- StarterGui.Innovix.MainFrame.TopBar.Title.UIPadding
		GUI["a"] = Instance.new("UIPadding", GUI["9"]);
		GUI["a"]["PaddingTop"] = UDim.new(0, 1);
		GUI["a"]["PaddingLeft"] = UDim.new(0, 8);

		-- StarterGui.Innovix.MainFrame.TopBar.ExitButton
		GUI["b"] = Instance.new("ImageLabel", GUI["6"]);
		GUI["b"]["BorderSizePixel"] = 0;
		GUI["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["b"]["AnchorPoint"] = Vector2.new(1, 0);
		GUI["b"]["Image"] = [[rbxassetid://16884179279]];
		GUI["b"]["ImageRectSize"] = Vector2.new(48, 48);
		GUI["b"]["Size"] = UDim2.new(0, 22, 0, 22);
		GUI["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["b"]["BackgroundTransparency"] = 1;
		GUI["b"]["ImageRectOffset"] = Vector2.new(690, 752);
		GUI["b"]["Name"] = [[ExitButton]];
		GUI["b"]["Position"] = UDim2.new(1, -4, 0, 4);
		
		local function onExitButtonInput(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				if GUI["2"] then
					GUI["2"]:Destroy()
				end
			end
		end

		GUI["b"].InputBegan:Connect(onExitButtonInput)
		

		-- StarterGui.Innovix.MainFrame.TopBar.Line
		GUI["c"] = Instance.new("Frame", GUI["6"]);
		GUI["c"]["BorderSizePixel"] = 0;
		GUI["c"]["BackgroundColor3"] = Color3.fromRGB(150, 150, 150);
		GUI["c"]["AnchorPoint"] = Vector2.new(0, 1);
		GUI["c"]["Size"] = UDim2.new(1, 0, 0, 1);
		GUI["c"]["Position"] = UDim2.new(0, 0, 1, 0);
		GUI["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["c"]["Name"] = [[Line]];
		
		-- StarterGui.Innovix.MainFrame.ContentContainer
		GUI["1b"] = Instance.new("Frame", GUI["2"]);
		GUI["1b"]["BorderSizePixel"] = 0;
		GUI["1b"]["BackgroundColor3"] = Color3.fromRGB(76, 76, 76);
		GUI["1b"]["AnchorPoint"] = Vector2.new(1, 0);
		GUI["1b"]["Size"] = UDim2.new(1, -133, 1, -42);
		GUI["1b"]["Position"] = UDim2.new(1, -6, 0, 36);
		GUI["1b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["1b"]["Name"] = [[ContentContainer]];
		GUI["1b"]["BackgroundTransparency"] = 1;
	end
	
	-- function to make the ui draggable
	local function makeDraggable(topBar, mainFrame)
		local dragging
		local dragInput
		local dragStart
		local startPos

		local function update(input)
			local delta = input.Position - dragStart
			mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end

		topBar.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				dragging = true
				dragStart = input.Position
				startPos = mainFrame.Position

				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragging = false
					end
				end)
			end
		end)

		topBar.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement then
				dragInput = input
			end
		end)

		game:GetService("UserInputService").InputChanged:Connect(function(input)
			if input == dragInput and dragging then
				update(input)
			end
		end)
	end

	-- actually make it drag
	makeDraggable(GUI["6"], GUI["2"])
	
	-- Navigation
	do
		-- StarterGui.Innovix.MainFrame.Navigation
		GUI["d"] = Instance.new("Frame", GUI["2"]);
		GUI["d"]["BorderSizePixel"] = 0;
		GUI["d"]["BackgroundColor3"] = Color3.fromRGB(35, 35, 35);
		GUI["d"]["Size"] = UDim2.new(0, 120, 1, -30);
		GUI["d"]["Position"] = UDim2.new(0, 0, 0, 30);
		GUI["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["d"]["Name"] = [[Navigation]];

		-- StarterGui.Innovix.MainFrame.Navigation.UICorner
		GUI["e"] = Instance.new("UICorner", GUI["d"]);
		GUI["e"]["CornerRadius"] = UDim.new(0, 6);

		-- StarterGui.Innovix.MainFrame.Navigation.Hide
		GUI["f"] = Instance.new("Frame", GUI["d"]);
		GUI["f"]["BorderSizePixel"] = 0;
		GUI["f"]["BackgroundColor3"] = Color3.fromRGB(35, 35, 35);
		GUI["f"]["Size"] = UDim2.new(1, 0, 0, 20);
		GUI["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["f"]["Name"] = [[Hide]];

		-- StarterGui.Innovix.MainFrame.Navigation.Hide2
		GUI["10"] = Instance.new("Frame", GUI["d"]);
		GUI["10"]["BorderSizePixel"] = 0;
		GUI["10"]["BackgroundColor3"] = Color3.fromRGB(35, 35, 35);
		GUI["10"]["AnchorPoint"] = Vector2.new(1, 0);
		GUI["10"]["Size"] = UDim2.new(0, 20, 1, 0);
		GUI["10"]["Position"] = UDim2.new(1, 0, 0, 0);
		GUI["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["10"]["Name"] = [[Hide2]];

		-- StarterGui.Innovix.MainFrame.Navigation.ButtonHolder
		GUI["11"] = Instance.new("Frame", GUI["d"]);
		GUI["11"]["BorderSizePixel"] = 0;
		GUI["11"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["11"]["Size"] = UDim2.new(1, 0, 1, 0);
		GUI["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["11"]["Name"] = [[ButtonHolder]];
		GUI["11"]["BackgroundTransparency"] = 1;

		-- StarterGui.Innovix.MainFrame.Navigation.ButtonHolder.UIPadding
		GUI["12"] = Instance.new("UIPadding", GUI["11"]);
		GUI["12"]["PaddingTop"] = UDim.new(0, 8);
		GUI["12"]["PaddingBottom"] = UDim.new(0, 8);

		-- StarterGui.Innovix.MainFrame.Navigation.ButtonHolder.UIListLayout
		GUI["13"] = Instance.new("UIListLayout", GUI["11"]);
		GUI["13"]["Padding"] = UDim.new(0, 1);
		GUI["13"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

		-- StarterGui.Innovix.MainFrame.Navigation.Line
		GUI["1a"] = Instance.new("Frame", GUI["d"]);
		GUI["1a"]["BorderSizePixel"] = 0;
		GUI["1a"]["BackgroundColor3"] = Color3.fromRGB(150, 150, 150);
		GUI["1a"]["Size"] = UDim2.new(0, 1, 1, 0);
		GUI["1a"]["Position"] = UDim2.new(1, 0, 0, 0);
		GUI["1a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["1a"]["Name"] = [[Line]];
	end
	
	function GUI:CreateTab(options)
		options = Library:validate({
			title = "Tab",
			icon = "rbxassetid://16884179038"
		}, options or {})
		
		local Tab = {
			Hover = false,
			Active = false
		}
		
		-- render
		do 
			-- StarterGui.Innovix.MainFrame.Navigation.ButtonHolder.Inactive
			Tab["17"] = Instance.new("TextLabel", GUI["11"]);
			Tab["17"]["BorderSizePixel"] = 0;
			Tab["17"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			Tab["17"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["17"]["TextSize"] = 12;
			Tab["17"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
			Tab["17"]["TextColor3"] = Color3.fromRGB(150, 150, 150);
			Tab["17"]["BackgroundTransparency"] = 1;
			Tab["17"]["Size"] = UDim2.new(1, 0, 0, 24);
			Tab["17"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["17"]["Text"] = options.title;
			Tab["17"]["Name"] = [[Inactive]];

			-- StarterGui.Innovix.MainFrame.Navigation.ButtonHolder.Inactive.UIPadding
			Tab["18"] = Instance.new("UIPadding", Tab["17"]);
			Tab["18"]["PaddingLeft"] = UDim.new(0, 28);

			-- StarterGui.Innovix.MainFrame.Navigation.ButtonHolder.Inactive.Icon
			Tab["19"] = Instance.new("ImageLabel", Tab["17"]);
			Tab["19"]["BorderSizePixel"] = 0;
			Tab["19"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["19"]["ImageColor3"] = Color3.fromRGB(150, 150, 150);
			Tab["19"]["AnchorPoint"] = Vector2.new(0, 0.5);
			Tab["19"]["Image"] = options.icon;
			Tab["19"]["ImageRectSize"] = Vector2.new(108, 108);
			Tab["19"]["Size"] = UDim2.new(0, 20, 0, 20);
			Tab["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["19"]["BackgroundTransparency"] = 1;
			Tab["19"]["ImageRectOffset"] = Vector2.new(578, 220);
			Tab["19"]["Name"] = [[Icon]];
			Tab["19"]["Position"] = UDim2.new(0, -24, 0.5, 0);
			
			-- StarterTab.Innovix.MainFrame.ContentContainer.HomeTab
			Tab["1c"] = Instance.new("ScrollingFrame", GUI["1b"]);
			Tab["1c"]["BorderSizePixel"] = 0;
			Tab["1c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["1c"]["Name"] = [[HomeTab]];
			Tab["1c"]["Selectable"] = false;
			Tab["1c"]["Size"] = UDim2.new(1, 0, 1, 0);
			Tab["1c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["1c"]["ScrollBarThickness"] = 0;
			Tab["1c"]["BackgroundTransparency"] = 1;
			Tab["1c"]["SelectionGroup"] = false;
			Tab["1c"]["Visible"] = false;
			
			-- StarterTab.Innovix.MainFrame.ContentContainer.HomeTab.UIPadding
			Tab["23"] = Instance.new("UIPadding", Tab["1c"]);
			Tab["23"]["PaddingTop"] = UDim.new(0, 1);
			Tab["23"]["PaddingRight"] = UDim.new(0, 1);
			Tab["23"]["PaddingLeft"] = UDim.new(0, 1);
			Tab["23"]["PaddingBottom"] = UDim.new(0, 1);
			-- StarterTab.Innovix.MainFrame.ContentContainer.HomeTab.UIListLayout
			Tab["29"] = Instance.new("UIListLayout", Tab["1c"]);
			Tab["29"]["Padding"] = UDim.new(0, 6);
			Tab["29"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

		end
		
		-- methods
		function Tab:Activate()
			if not Tab.Activethen then
				if GUI.CurrentTab ~= nil then
					GUI.CurrentTab:Deactivate()
				end
				
				Tab.Active = true
				Library:tween(Tab["17"], {BackgroundTransparency = .8})
				Library:tween(Tab["17"], {TextColor3 = Color3.fromRGB(255, 255, 255)})
				Library:tween(Tab["19"], {ImageColor3 = Color3.fromRGB(255, 255, 255)})
				Tab["1c"].Visible = true
				
				GUI.CurrentTab = Tab
			end
		end
		
		function Tab:Deactivate()
			if Tab.Active then
				Tab.Active = false
				Tab.Hover = false
				Library:tween(Tab["17"], {TextColor3 = Color3.fromRGB(149, 149, 149)})
				Library:tween(Tab["19"], {ImageColor3 = Color3.fromRGB(149, 149, 149)})
				Library:tween(Tab["17"], {BackgroundTransparency = 1})
				Tab["1c"].Visible = false
			end
		end
		
		-- logic
		do
			Tab["17"].MouseEnter:Connect(function()
				Tab.Hover = true

				if not Tab.Active then
					Library:tween(Tab["17"], {TextColor3 = Color3.fromRGB(255, 255, 255)})
					Library:tween(Tab["19"], {ImageColor3 = Color3.fromRGB(255, 255, 255)})
				end
			end)

			Tab["17"].MouseLeave:Connect(function()
				Tab.Hover = false

				if not Tab.Active then
					Library:tween(Tab["17"], {TextColor3 = Color3.fromRGB(149, 149, 149)})
					Library:tween(Tab["19"], {ImageColor3 = Color3.fromRGB(149, 149, 149)})
				end
			end)

			uis.InputBegan:Connect(function(input, gpe)
				if gpe then return end

				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					if Tab.Hover then
						Tab:Activate()
					end
				end
			end)
		end
		
		
		if GUI.CurrentTab == nil then
			Tab:Activate()
		end
		
		function Tab:Button(options)
			options = Library:validate({
				title = "Button",
				callback = function() end
			}, options or {})
			
			local Button = {
				Hover = false,
				MouseDown = false
			}
			
			-- Render
			do 
				-- StarterButton.Innovix.MainFrame.ContentContainer.HomeTab.Button
				Button["1d"] = Instance.new("Frame", Tab["1c"]);
				Button["1d"]["BorderSizePixel"] = 0;
				Button["1d"]["BackgroundColor3"] = Color3.fromRGB(48, 48, 48);
				Button["1d"]["Size"] = UDim2.new(1, 0, 0, 32);
				Button["1d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["1d"]["Name"] = [[Button]];

				-- StarterButton.Innovix.MainFrame.ContentContainer.HomeTab.Button.UICorner
				Button["1e"] = Instance.new("UICorner", Button["1d"]);
				Button["1e"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterButton.Innovix.MainFrame.ContentContainer.HomeTab.Button.UIStroke
				Button["1f"] = Instance.new("UIStroke", Button["1d"]);
				Button["1f"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
				Button["1f"]["Color"] = Color3.fromRGB(149, 149, 149);

				-- StarterButton.Innovix.MainFrame.ContentContainer.HomeTab.Button.Title
				Button["20"] = Instance.new("TextLabel", Button["1d"]);
				Button["20"]["BorderSizePixel"] = 0;
				Button["20"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Button["20"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Button["20"]["TextSize"] = 14;
				Button["20"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
				Button["20"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Button["20"]["BackgroundTransparency"] = 1;
				Button["20"]["RichText"] = true;
				Button["20"]["Size"] = UDim2.new(1, -20, 1, 0);
				Button["20"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["20"]["Text"] = options.title;
				Button["20"]["Name"] = [[Title]];

				-- StarterButton.Innovix.MainFrame.ContentContainer.HomeTab.Button.UIPadding
				Button["21"] = Instance.new("UIPadding", Button["1d"]);
				Button["21"]["PaddingTop"] = UDim.new(0, 6);
				Button["21"]["PaddingRight"] = UDim.new(0, 6);
				Button["21"]["PaddingLeft"] = UDim.new(0, 6);
				Button["21"]["PaddingBottom"] = UDim.new(0, 6);

				-- StarterButton.Innovix.MainFrame.ContentContainer.HomeTab.Button.Icon
				Button["22"] = Instance.new("ImageLabel", Button["1d"]);
				Button["22"]["BorderSizePixel"] = 0;
				Button["22"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Button["22"]["AnchorPoint"] = Vector2.new(1, 0);
				Button["22"]["Image"] = [[rbxassetid://14976970435]];
				Button["22"]["ImageRectSize"] = Vector2.new(108, 108);
				Button["22"]["Size"] = UDim2.new(0, 20, 0, 20);
				Button["22"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["22"]["BackgroundTransparency"] = 1;
				Button["22"]["ImageRectOffset"] = Vector2.new(512, 908);
				Button["22"]["Name"] = [[Icon]];
				Button["22"]["Position"] = UDim2.new(1, 0, 0, 0);

				-- StarterButton.Innovix.MainFrame.ContentContainer.HomeTab.UIPadding
				Button["23"] = Instance.new("UIPadding", Button["1c"]);
				Button["23"]["PaddingTop"] = UDim.new(0, 1);
				Button["23"]["PaddingRight"] = UDim.new(0, 1);
				Button["23"]["PaddingLeft"] = UDim.new(0, 1);
				Button["23"]["PaddingBottom"] = UDim.new(0, 1);
			end
			
			function Button:SetText(text)
				Button["20"].Text = text
				options.name = text
			end
			
			function Button:SetCallback(fn)
				options.callback = fn
			end
			
			-- logic
			
			do
				Button["1d"].MouseEnter:Connect(function()
					Button.Hover = true
					
					Library:tween(Button["1f"], {Color = Color3.fromRGB(162, 162, 162)})
				end)
				
				Button["1d"].MouseLeave:Connect(function()
					Button.Hover = false
					
					if not Button.MouseDown then
						Library:tween(Button["1f"], {Color = Color3.fromRGB(149, 149, 149)})
					end
				end)
				
				uis.InputBegan:Connect(function(input, gpe)
					if gpe then return end
					
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Button.Hover then
						Button.MouseDown = true
						Library:tween(Button["1d"], {BackgroundColor3 = Color3.fromRGB(88, 88, 88)})
						Library:tween(Button["1f"], {Color = Color3.fromRGB(200, 200, 200)})
						options.callback()
					end
				end)
				
				uis.InputEnded:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Button.MouseDown = false
						
						if Button.Hover then
							-- hover
							Library:tween(Button["1d"], {BackgroundColor3 = Color3.fromRGB(48, 48, 48)})
							Library:tween(Button["1f"], {Color = Color3.fromRGB(62, 62, 62)})
							
						else
							-- reset
							Library:tween(Button["1d"], {BackgroundColor3 = Color3.fromRGB(48, 48, 48)})
							Library:tween(Button["1f"], {Color = Color3.fromRGB(150, 150, 150)})
						end
					end
				end)
			end
			
			
			return Button
		end
		
		function Tab:Label(options)
			options = Library:validate({
				message = "Label"
			}, options or {})
			
			local Label = {}
			
			-- render 
			do 
				-- StarterLabel.Innovix.MainFrame.ContentContainer.HomeTab.Label
				Label["24"] = Instance.new("Frame", Tab["1c"]);
				Label["24"]["BorderSizePixel"] = 0;
				Label["24"]["BackgroundColor3"] = Color3.fromRGB(29, 131, 255);
				Label["24"]["Size"] = UDim2.new(1, 0, 0, 26);
				Label["24"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Label["24"]["Name"] = [[Label]];
				Label["24"]["BackgroundTransparency"] = 0.4;

				-- StarterLabel.Innovix.MainFrame.ContentContainer.HomeTab.Label.UICorner
				Label["25"] = Instance.new("UICorner", Label["24"]);
				Label["25"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterLabel.Innovix.MainFrame.ContentContainer.HomeTab.Label.UIStroke
				Label["26"] = Instance.new("UIStroke", Label["24"]);
				Label["26"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
				Label["26"]["Color"] = Color3.fromRGB(35, 197, 255);

				-- StarterLabel.Innovix.MainFrame.ContentContainer.HomeTab.Label.Title
				Label["27"] = Instance.new("TextLabel", Label["24"]);
				Label["27"]["TextWrapped"] = true;
				Label["27"]["BorderSizePixel"] = 0;
				Label["27"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Label["27"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Label["27"]["TextSize"] = 14;
				Label["27"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
				Label["27"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Label["27"]["BackgroundTransparency"] = 1;
				Label["27"]["RichText"] = true;
				Label["27"]["Size"] = UDim2.new(1, 0, 1, 0);
				Label["27"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Label["27"]["Name"] = [[Title]];
				Label["27"]["Text"] = options.message;
				Label["27"]["TextWrapped"] = true;
				Label["27"]["TextYAlignment"] = Enum.TextYAlignment.Top;

				Label["28"] = Instance.new("UIPadding", Label["24"]);
				Label["28"]["PaddingTop"] = UDim.new(0, 6);
				Label["28"]["PaddingRight"] = UDim.new(0, 6);
				Label["28"]["PaddingLeft"] = UDim.new(0, 6);
				Label["28"]["PaddingBottom"] = UDim.new(0, 6);
			end
			
			
			
			-- methods
			function Label:SetText(text)
				options.message = text
				Label:_update()
			end
			
			function Label:_update()
				Label["27"].Text = options.message
				
				Label["27"].Size = UDim2.new(Label["27"].Size.X.Scale, Label["27"].Size.X.Offset, 0, math.huge)
				Label["27"].Size = UDim2.new(Label["27"].Size.X.Scale, Label["27"].Size.X.Offset, 0, Label["27"].TextBounds.Y)
				Label["24"].Size = UDim2.new(Label["24"].Size.X.Scale, Label["24"].Size.X.Offset, 0, Label["27"].TextBounds.Y + 12)
			end
			
			Label:_update()
			return Label
		end
		
		function Tab:Toggle(options)
			options = Library:validate({
				title = "Toggle",
				callback = function(v) print(v) end
			}, options or {})
			
			local Toggle = {
				MouseDown = false,
				Hover = false,
				State = false
			}
			
			-- render
			do
				Toggle["46"] = Instance.new("Frame", Tab["1c"]);
				Toggle["46"]["BorderSizePixel"] = 0;
				Toggle["46"]["BackgroundColor3"] = Color3.fromRGB(48, 48, 48);
				Toggle["46"]["Size"] = UDim2.new(1, 0, 0, 32);
				Toggle["46"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["46"]["Name"] = [[ToggleInactive]];

				Toggle["47"] = Instance.new("UICorner", Toggle["46"]);
				Toggle["47"]["CornerRadius"] = UDim.new(0, 4);

				Toggle["48"] = Instance.new("UIStroke", Toggle["46"]);
				Toggle["48"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
				Toggle["48"]["Color"] = Color3.fromRGB(150, 150, 150);
				
				Toggle["49"] = Instance.new("TextLabel", Toggle["46"]);
				Toggle["49"]["BorderSizePixel"] = 0;
				Toggle["49"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Toggle["49"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["49"]["TextSize"] = 14;
				Toggle["49"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
				Toggle["49"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["49"]["BackgroundTransparency"] = 1;
				Toggle["49"]["RichText"] = true;
				Toggle["49"]["Size"] = UDim2.new(1, -26, 1, 0);
				Toggle["49"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["49"]["Text"] = options.title;
				Toggle["49"]["Name"] = [[Title]];

				-- StarterToggle.Innovix.MainFrame.ContentContainer.HomeTab.ToggleInactive.UIPadding
				Toggle["4a"] = Instance.new("UIPadding", Toggle["46"]);
				Toggle["4a"]["PaddingTop"] = UDim.new(0, 6);
				Toggle["4a"]["PaddingRight"] = UDim.new(0, 6);
				Toggle["4a"]["PaddingLeft"] = UDim.new(0, 6);
				Toggle["4a"]["PaddingBottom"] = UDim.new(0, 6);

				-- StarterToggle.Innovix.MainFrame.ContentContainer.HomeTab.ToggleInactive.CheckmarkHolder
				Toggle["4b"] = Instance.new("Frame", Toggle["46"]);
				Toggle["4b"]["BorderSizePixel"] = 0;
				Toggle["4b"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
				Toggle["4b"]["AnchorPoint"] = Vector2.new(1, 0.5);
				Toggle["4b"]["Size"] = UDim2.new(0, 18, 0, 18);
				Toggle["4b"]["Position"] = UDim2.new(1, -3, 0.5, 0);
				Toggle["4b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["4b"]["Name"] = [[CheckmarkHolder]];

				-- StarterToggle.Innovix.MainFrame.ContentContainer.HomeTab.ToggleInactive.CheckmarkHolder.UICorner
				Toggle["4c"] = Instance.new("UICorner", Toggle["4b"]);
				Toggle["4c"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterToggle.Innovix.MainFrame.ContentContainer.HomeTab.ToggleInactive.CheckmarkHolder.UIStroke
				Toggle["4d"] = Instance.new("UIStroke", Toggle["4b"]);
				Toggle["4d"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
				Toggle["4d"]["Color"] = Color3.fromRGB(150, 150, 150);

				-- StarterToggle.Innovix.MainFrame.ContentContainer.HomeTab.ToggleInactive.CheckmarkHolder.Checkmark
				Toggle["4e"] = Instance.new("ImageLabel", Toggle["4b"]);
				Toggle["4e"]["BorderSizePixel"] = 0;
				Toggle["4e"]["ImageTransparency"] = 1;
				Toggle["4e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["4e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
				Toggle["4e"]["Image"] = [[rbxassetid://17287594570]];
				Toggle["4e"]["Size"] = UDim2.new(1, -2, 1, -2);
				Toggle["4e"]["Visible"] = false;
				Toggle["4e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["4e"]["BackgroundTransparency"] = 1;
				Toggle["4e"]["Name"] = [[Checkmark]];
				Toggle["4e"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
			end
			
			--methods
			do
				function Toggle:Toggle(b)
					if b == nil then
						Toggle.State = not Toggle.State
					else
						Toggle.State = b
					end
					
					if Toggle.State then
						Library:tween(Toggle["4b"], {BackgroundColor3 = Color3.fromRGB(27, 88, 163)})
						Library:tween(Toggle["4e"], {ImageTransparency = 0})
						Library:tween(Toggle["4e"], {Visible = true})
					else
						Library:tween(Toggle["4b"], {BackgroundColor3 = Color3.fromRGB(31, 31, 31)})
						Library:tween(Toggle["4e"], {ImageTransparency = 1})
						Library:tween(Toggle["4e"], {Visible = false})
					end

					options.callback(Toggle.State)
				end
			end
			
			-- logic
			do
				Toggle["46"].MouseEnter:Connect(function()
					Toggle.Hover = true

					Library:tween(Toggle["48"], {Color = Color3.fromRGB(162, 162, 162)})
				end)

				Toggle["46"].MouseLeave:Connect(function()
					Toggle.Hover = false

					if not Toggle.MouseDown then
						Library:tween(Toggle["48"], {Color = Color3.fromRGB(149, 149, 149)})
					end
				end)

				uis.InputBegan:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 and Toggle.Hover then
						Toggle.MouseDown = true
						Library:tween(Toggle["46"], {BackgroundColor3 = Color3.fromRGB(88, 88, 88)})
						Library:tween(Toggle["48"], {Color = Color3.fromRGB(200, 200, 200)})
						Toggle:Toggle()
					end
				end)

				uis.InputEnded:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Toggle.MouseDown = false

						if Toggle.Hover then
							Library:tween(Toggle["46"], {BackgroundColor3 = Color3.fromRGB(48, 48, 48)})
							Library:tween(Toggle["48"], {Color = Color3.fromRGB(162, 162, 162)})
						else
							Library:tween(Toggle["46"], {BackgroundColor3 = Color3.fromRGB(48, 48, 48)})
							Library:tween(Toggle["48"], {Color = Color3.fromRGB(150, 150, 150)})
						end
					end
				end)
			end
			
			return Toggle
		end
		
		function Tab:Slider(options)
			options = Library:validate({
				title = "Slider",
				min = 0,
				max = 100,
				default = 100,
				callback = function(v) print(v) end
			}, options or {})
			
			local Slider = {
				MouseDown = false,
				Hover = false,
				Connection = nil
			}
			
			-- render
			do
				-- StarterSlider.Innovix.MainFrame.ContentContainer.HomeTab.Slider
				Slider["2a"] = Instance.new("Frame", Tab["1c"]);
				Slider["2a"]["BorderSizePixel"] = 0;
				Slider["2a"]["BackgroundColor3"] = Color3.fromRGB(48, 48, 48);
				Slider["2a"]["Size"] = UDim2.new(1, 0, 0, 38);
				Slider["2a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["2a"]["Name"] = [[Slider]];

				-- StarterSlider.Innovix.MainFrame.ContentContainer.HomeTab.Slider.UICorner
				Slider["2b"] = Instance.new("UICorner", Slider["2a"]);
				Slider["2b"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterSlider.Innovix.MainFrame.ContentContainer.HomeTab.Slider.UIStroke
				Slider["2c"] = Instance.new("UIStroke", Slider["2a"]);
				Slider["2c"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
				Slider["2c"]["Color"] = Color3.fromRGB(150, 150, 150);

				-- StarterSlider.Innovix.MainFrame.ContentContainer.HomeTab.Slider.Title
				Slider["2d"] = Instance.new("TextLabel", Slider["2a"]);
				Slider["2d"]["BorderSizePixel"] = 0;
				Slider["2d"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Slider["2d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["2d"]["TextSize"] = 14;
				Slider["2d"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
				Slider["2d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["2d"]["BackgroundTransparency"] = 1;
				Slider["2d"]["RichText"] = true;
				Slider["2d"]["Size"] = UDim2.new(1, -24, 1, -10);
				Slider["2d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["2d"]["Text"] = options.title;
				Slider["2d"]["Name"] = [[Title]];

				-- StarterSlider.Innovix.MainFrame.ContentContainer.HomeTab.Slider.UIPadding
				Slider["2e"] = Instance.new("UIPadding", Slider["2a"]);
				Slider["2e"]["PaddingTop"] = UDim.new(0, 6);
				Slider["2e"]["PaddingRight"] = UDim.new(0, 6);
				Slider["2e"]["PaddingLeft"] = UDim.new(0, 6);
				Slider["2e"]["PaddingBottom"] = UDim.new(0, 6);

				-- StarterSlider.Innovix.MainFrame.ContentContainer.HomeTab.Slider.Value
				Slider["2f"] = Instance.new("TextLabel", Slider["2a"]);
				Slider["2f"]["BorderSizePixel"] = 0;
				Slider["2f"]["TextXAlignment"] = Enum.TextXAlignment.Right;
				Slider["2f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["2f"]["TextSize"] = 14;
				Slider["2f"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
				Slider["2f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["2f"]["BackgroundTransparency"] = 1;
				Slider["2f"]["RichText"] = true;
				Slider["2f"]["AnchorPoint"] = Vector2.new(1, 0);
				Slider["2f"]["Size"] = UDim2.new(0, 24, 1, -10);
				Slider["2f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["2f"]["Text"] = tostring(options.default);
				Slider["2f"]["Name"] = [[Value]];
				Slider["2f"]["Position"] = UDim2.new(1, 0, 0, 0);

				-- StarterSlider.Innovix.MainFrame.ContentContainer.HomeTab.Slider.SliderBack
				Slider["30"] = Instance.new("Frame", Slider["2a"]);
				Slider["30"]["BorderSizePixel"] = 0;
				Slider["30"]["BackgroundColor3"] = Color3.fromRGB(13, 13, 13);
				Slider["30"]["AnchorPoint"] = Vector2.new(0, 1);
				Slider["30"]["Size"] = UDim2.new(1, 0, 0, 4);
				Slider["30"]["Position"] = UDim2.new(0, 0, 1, 0);
				Slider["30"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["30"]["Name"] = [[SliderBack]];

				-- StarterSlider.Innovix.MainFrame.ContentContainer.HomeTab.Slider.SliderBack.UICorner
				Slider["31"] = Instance.new("UICorner", Slider["30"]);


				-- StarterSlider.Innovix.MainFrame.ContentContainer.HomeTab.Slider.SliderBack.UIStroke
				Slider["32"] = Instance.new("UIStroke", Slider["30"]);
				Slider["32"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
				Slider["32"]["Color"] = Color3.fromRGB(108, 108, 108);

				-- StarterSlider.Innovix.MainFrame.ContentContainer.HomeTab.Slider.SliderBack.Draggable
				Slider["33"] = Instance.new("Frame", Slider["30"]);
				Slider["33"]["BorderSizePixel"] = 0;
				Slider["33"]["BackgroundColor3"] = Color3.fromRGB(64, 64, 64);
				Slider["33"]["Size"] = UDim2.new(0.5, 0, 1, 0);
				Slider["33"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["33"]["Name"] = [[Draggable]];

				-- StarterSlider.Innovix.MainFrame.ContentContainer.HomeTab.Slider.SliderBack.Draggable.UICorner
				Slider["34"] = Instance.new("UICorner", Slider["33"]);
			end
			
			-- methods
			function Slider:SetValue(v)
				if v == nil then
					local percentage = math.clamp((mouse.X - Slider["30"].AbsolutePosition.X) / (Slider["2a"].AbsoluteSize.X), 0, 1)
					local value = math.floor(((options.max - options.min) * percentage) + options.min)
				
					Slider["2f"].Text = tostring(value)
					Slider["33"].Size = UDim2.fromScale(percentage, 1)
				else
					Slider["2f"].Text = tostring(v)
					Slider["33"].Size = UDim2.fromScale(((v - options.min) / (options.max - options.min)), 1)
				end
				options.callback(tonumber(Slider["2f"].Text))
			end
			
			function Slider:GetValue(v)
				return tonumber(Slider["2f"].Text)
			end
			
			-- logic
			do
				Slider["2a"].MouseEnter:Connect(function()
					Slider.Hover = true

					Library:tween(Slider["2c"], {Color = Color3.fromRGB(162, 162, 162)})
					Library:tween(Slider["32"], {Color = Color3.fromRGB(162, 162, 162)})
					Library:tween(Slider["33"], {BackgroundColor3 = Color3.fromRGB(162, 162, 162)})
				end)

				Slider["2a"].MouseLeave:Connect(function()
					Slider.Hover = false

					if not Slider.MouseDown then
						Library:tween(Slider["2c"], {Color = Color3.fromRGB(149, 149, 149)})
						Library:tween(Slider["32"], {Color = Color3.fromRGB(149, 149, 149)})
						Library:tween(Slider["33"], {BackgroundColor3 = Color3.fromRGB(149, 149, 149)})
					end
				end)

				uis.InputBegan:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 and Slider.Hover then
						Slider.MouseDown = true
						Library:tween(Slider["2a"], {BackgroundColor3 = Color3.fromRGB(88, 88, 88)})
						Library:tween(Slider["2c"], {Color = Color3.fromRGB(200, 200, 200)})
						Library:tween(Slider["32"], {Color = Color3.fromRGB(200, 200, 200)})
						Library:tween(Slider["33"], {BackgroundColor3 = Color3.fromRGB(200, 200, 200)})
						
						if not Slider.Connection then
							Slider.Connection = runService.RenderStepped:Connect(function()
								Slider.SetValue()
							end)
						end
					end
				end)

				uis.InputEnded:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Slider.MouseDown = false

						if Slider.Hover then
							-- hover
							Library:tween(Slider["2a"], {BackgroundColor3 = Color3.fromRGB(48, 48, 48)})
							Library:tween(Slider["2c"], {Color = Color3.fromRGB(62, 62, 62)})
							Library:tween(Slider["32"], {Color = Color3.fromRGB(62, 62, 62)})
							Library:tween(Slider["33"], {BackgroundColor3 = Color3.fromRGB(62, 62, 62)})
						else
							-- reset
							Library:tween(Slider["2a"], {BackgroundColor3 = Color3.fromRGB(48, 48, 48)})
							Library:tween(Slider["2c"], {Color = Color3.fromRGB(150, 150, 150)})
							Library:tween(Slider["32"], {Color = Color3.fromRGB(150, 150, 150)})
							Library:tween(Slider["33"], {BackgroundColor3 = Color3.fromRGB(150, 150, 150)})
						end 
						
						if Slider.Connection then Slider.Connection:Disconnect() end
						Slider.Connection = nil
					end
				end)
				
				
				
			end
			
			return Slider
		end
		
		function Tab:Dropdown(options)
    options = Library:validate({
        title = "Dropdown",
        callback = function(v) print(v) end,
        items = {}
    }, options or {})
    
    local Dropdown = {
        Items = {},
        Open = false,
        MouseDown = false,
        Hover = false,
        HoveringItem = false
    }
    
    -- render
    do
        -- StarterDropdown.Innovix.MainFrame.ContentContainer.HomeTab.Dropdown
        Dropdown["35"] = Instance.new("Frame", Tab["1c"])
        Dropdown["35"]["BorderSizePixel"] = 0
        Dropdown["35"]["BackgroundColor3"] = Color3.fromRGB(48, 48, 48)
        Dropdown["35"]["ClipsDescendants"] = true
        Dropdown["35"]["Size"] = UDim2.new(1, 0, 0, 30)
        Dropdown["35"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
        Dropdown["35"]["Name"] = "Dropdown"

        -- StarterDropdown.Innovix.MainFrame.ContentContainer.HomeTab.Dropdown.UICorner
        Dropdown["36"] = Instance.new("UICorner", Dropdown["35"])
        Dropdown["36"]["CornerRadius"] = UDim.new(0, 4)

        -- StarterDropdown.Innovix.MainFrame.ContentContainer.HomeTab.Dropdown.UIStroke
        Dropdown["37"] = Instance.new("UIStroke", Dropdown["35"])
        Dropdown["37"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
        Dropdown["37"]["Color"] = Color3.fromRGB(150, 150, 150)

        -- StarterDropdown.Innovix.MainFrame.ContentContainer.HomeTab.Dropdown.Title
        Dropdown["38"] = Instance.new("TextLabel", Dropdown["35"])
        Dropdown["38"]["BorderSizePixel"] = 0
        Dropdown["38"]["TextXAlignment"] = Enum.TextXAlignment.Left
        Dropdown["38"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
        Dropdown["38"]["TextSize"] = 14
        Dropdown["38"]["FontFace"] = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
        Dropdown["38"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
        Dropdown["38"]["BackgroundTransparency"] = 1
        Dropdown["38"]["RichText"] = true
        Dropdown["38"]["Size"] = UDim2.new(1, -20, 0, 20)
        Dropdown["38"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
        Dropdown["38"]["Text"] = options.title
        Dropdown["38"]["Name"] = "Title"

        -- StarterDropdown.Innovix.MainFrame.ContentContainer.HomeTab.Dropdown.UIPadding
        Dropdown["39"] = Instance.new("UIPadding", Dropdown["35"])
        Dropdown["39"]["PaddingTop"] = UDim.new(0, 6)
        Dropdown["39"]["PaddingRight"] = UDim.new(0, 6)
        Dropdown["39"]["PaddingLeft"] = UDim.new(0, 6)
        Dropdown["39"]["PaddingBottom"] = UDim.new(0, 6)

        -- StarterDropdown.Innovix.MainFrame.ContentContainer.HomeTab.Dropdown.Icon
        Dropdown["3a"] = Instance.new("ImageLabel", Dropdown["35"])
        Dropdown["3a"]["BorderSizePixel"] = 0
        Dropdown["3a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
        Dropdown["3a"]["AnchorPoint"] = Vector2.new(1, 0)
        Dropdown["3a"]["Image"] = "rbxassetid://16884179507"
        Dropdown["3a"]["ImageRectSize"] = Vector2.new(48, 48)
        Dropdown["3a"]["Size"] = UDim2.new(0, 20, 0, 20)
        Dropdown["3a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
        Dropdown["3a"]["BackgroundTransparency"] = 1
        Dropdown["3a"]["ImageRectOffset"] = Vector2.new(578, 350)
        Dropdown["3a"]["Name"] = "Icon"
        Dropdown["3a"]["Position"] = UDim2.new(1, 0, 0, 0)

        -- StarterDropdown.Innovix.MainFrame.ContentContainer.HomeTab.Dropdown.OptionHolder
        Dropdown["3b"] = Instance.new("Frame", Dropdown["35"])
        Dropdown["3b"]["Visible"] = false
        Dropdown["3b"]["BorderSizePixel"] = 0
        Dropdown["3b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
        Dropdown["3b"]["Size"] = UDim2.new(1, 0, 1, -24)
        Dropdown["3b"]["Position"] = UDim2.new(0, 0, 0, 26)
        Dropdown["3b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
        Dropdown["3b"]["Name"] = "OptionHolder"
        Dropdown["3b"]["BackgroundTransparency"] = 1

        -- StarterDropdown.Innovix.MainFrame.ContentContainer.HomeTab.Dropdown.OptionHolder.UIListLayout
        Dropdown["3c"] = Instance.new("UIListLayout", Dropdown["3b"])
        Dropdown["3c"]["Padding"] = UDim.new(0, 4)
        Dropdown["3c"]["SortOrder"] = Enum.SortOrder.LayoutOrder
    end
    
    -- methods 
    do
        function Dropdown:Add(id, value)
            local Item = {
                Hover = false,
                MouseDown = false
            }
            
            if Dropdown.Items[id] ~= nil then
                return
            end
            
            -- Create the dropdown item
            local itemInstance = Instance.new("TextLabel")
            itemInstance.BorderSizePixel = 0
            itemInstance.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
            itemInstance.TextSize = 14
            itemInstance.FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
            itemInstance.TextColor3 = Color3.fromRGB(210, 210, 210)
            itemInstance.Size = UDim2.new(1, 0, 0, 16)
            itemInstance.BorderColor3 = Color3.fromRGB(0, 0, 0)
            itemInstance.Text = id
            itemInstance.Name = "InactiveOption"
            itemInstance.Parent = Dropdown["3b"]
            
            local uiStroke = Instance.new("UIStroke", itemInstance)
            uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            uiStroke.Color = Color3.fromRGB(28, 28, 28)
            
            local uiCorner = Instance.new("UICorner", itemInstance)
            uiCorner.CornerRadius = UDim.new(0, 3)
            
            Dropdown.Items[id] = {
                instance = itemInstance,
                value = value
            }
            
            -- Mouse events
            itemInstance.MouseEnter:Connect(function()
                Item.Hover = true
                Dropdown.HoveringItem = true
                Library:tween(uiStroke, {Color = Color3.fromRGB(162, 162, 162)})
            end)

            itemInstance.MouseLeave:Connect(function()
                Item.Hover = false
                Dropdown.HoveringItem = false
                if not Item.MouseDown then
                    Library:tween(uiStroke, {Color = Color3.fromRGB(149, 149, 149)})
                end
            end)

            itemInstance.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 and Item.Hover then
                    Item.MouseDown = true
                    Library:tween(itemInstance, {BackgroundColor3 = Color3.fromRGB(88, 88, 88)})
                    Library:tween(uiStroke, {Color = Color3.fromRGB(200, 200, 200)})
                    options.callback(value)
                    Dropdown:Toggle()
                end
            end)

            itemInstance.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    Item.MouseDown = false
                    if Item.Hover then
                        Library:tween(itemInstance, {BackgroundColor3 = Color3.fromRGB(48, 48, 48)})
                        Library:tween(uiStroke, {Color = Color3.fromRGB(62, 62, 62)})
                    else
                        Library:tween(itemInstance, {BackgroundColor3 = Color3.fromRGB(48, 48, 48)})
                        Library:tween(uiStroke, {Color = Color3.fromRGB(150, 150, 150)})
                    end
                end
            end)
        end

        function Dropdown:Remove(id)
            if Dropdown.Items[id] ~= nil then
                if Dropdown.Items[id].instance ~= nil then
                    Dropdown.Items[id].instance:Destroy()
                end
                Dropdown.Items[id] = nil
            end
        end

        function Dropdown:Clear()
            for id, _ in pairs(Dropdown.Items) do
                Dropdown:Remove(id)
            end
        end

        function Dropdown:Toggle()
            if Dropdown.Open then
                Library:tween(Dropdown["35"], {Size = UDim2.new(1, 0, 0, 30)}, function()
                    Dropdown["3b"].Visible = false
                end)
            else
                local count = 0
                for _ in pairs(Dropdown.Items) do
                    count += 1
                end
                
                Dropdown["3b"].Visible = true
                Library:tween(Dropdown["35"], {Size = UDim2.new(1, 0, 0, 30 + (count * 20) + 4)})
            end
            Dropdown.Open = not Dropdown.Open
        end
    end
    
    -- logic
    do
        Dropdown["35"].MouseEnter:Connect(function()
            Dropdown.Hover = true
            Library:tween(Dropdown["37"], {Color = Color3.fromRGB(162, 162, 162)})
        end)

        Dropdown["35"].MouseLeave:Connect(function()
            Dropdown.Hover = false
            if not Dropdown.MouseDown then
                Library:tween(Dropdown["37"], {Color = Color3.fromRGB(149, 149, 149)})
            end
        end)

        Dropdown["35"].InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 and Dropdown.Hover then
                Dropdown.MouseDown = true
                Library:tween(Dropdown["35"], {BackgroundColor3 = Color3.fromRGB(88, 88, 88)})
                Library:tween(Dropdown["37"], {Color = Color3.fromRGB(200, 200, 200)})
                
                if not Dropdown.HoveringItem then
                    Dropdown:Toggle()
                end
            end
        end)

        Dropdown["35"].InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                Dropdown.MouseDown = false
                if Dropdown.Hover then
                    Library:tween(Dropdown["35"], {BackgroundColor3 = Color3.fromRGB(48, 48, 48)})
                    Library:tween(Dropdown["37"], {Color = Color3.fromRGB(62, 62, 62)})
                else
                    Library:tween(Dropdown["35"], {BackgroundColor3 = Color3.fromRGB(48, 48, 48)})
                    Library:tween(Dropdown["37"], {Color = Color3.fromRGB(150, 150, 150)})
                end
            end
        end)
    end
    
    return Dropdown
end
		
		
		return Tab
	end
	
	return GUI
end

return Library



