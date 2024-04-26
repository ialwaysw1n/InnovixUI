# Welcome to Innovix UI 

## Getting Your Loadstring:

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/TheRealInnovix/InnovixUI/main/InnovixUI-Library/main/source.lua"))()
```


## Initiating Our UI

```lua
local main = Library:Init{name = "YOUR UI NAME"}
```

## Creating A Tab

```lua
local Tab = main:CreateTab({title = "YOUR TITLE"})
```


## Creating A Label / Section

```lua
local Label = YourTabName:Label({message = "YOUR MESSAGE OR LABEL"})
```


## Creating A Button

```lua
local Button =
	YourTabName:Button(
		{
			title = "YOUR TITLE",
			callback = function()
				-- Your Code Here
			end
		}
	)
```


## Creating A Slider
(I forgot how this shit works. This UI Library isn't for public use anyways.)
```lua
local Slider = YourTabName:Slider()
```


## Creating A Toggle

```lua
local Toggle = YourTabName:Toggle({
	title = "YOUR TITLE",
	callback = function()
		-- Your Code Here
	end,
})
```


## Creating A Dropdown

```lua
local Dropdown = YourTabName:Dropdown({
	title = "YOUR TITLE",
	callback = function()
		-- Your Code Here
	end,
})
Dropdown:Add("THING #1", 1)
Dropdown:Add("THING #2", 2)
```



- Made by lua.u.
