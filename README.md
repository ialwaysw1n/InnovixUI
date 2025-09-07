# Welcome to Innovix UI (The worst UI I've ever released)

## Getting Your Loadstring:

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/ialwaysw1n/InnovixUI/main/InnovixUI-Library/main/source.lua"))()
```


## Initiating Our UI

```lua
local main = Library:Init({name = "YOUR UI NAME"})
```

## Creating A Tab

```lua
local Tab = main:CreateTab({
    title = "Home",
    icon = "rbxassetid://16884179038"
})
```


## Creating A Label / Section

```lua
local Label = Tab:Label({
    message = "This is a label"
})
```


## Creating A Button

```lua
local Button = Tab:Button({
    title = "Button",
    callback = function()
        print("Button clicked")
    end
})
```


## Creating A Slider

```lua
local Slider = Tab:Slider({
    title = "Slider",
    min = 0,
    max = 100,
    default = 50,
    callback = function(value)
        print("slider set to:", value)
    end
})
```


## Creating A Toggle

```lua
local Toggle = Tab:Toggle({
    title = "Toggle",
    callback = function(value)
        print("Toggle state:", value)
    end
})
```


## Creating A Dropdown

```lua
local Dropdown = Tab:Dropdown({
    title = "Dropdown Options",
    callback = function(value)
        print("Selected:", value)
    end,
    items = {}
})

Dropdown:Add("Option 1", 1)
Dropdown:Add("Option 2", 2)
Dropdown:Add("Option 3", 3)
```



- Made by lua.u.
