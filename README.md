# Example
Roblox Custom Typeface Registration

```lua
local Typeface = loadstring( game:HttpGet "https://github.com/fayvrit/Typeface/raw/refs/heads/main/Register.lua" )()

local Font, Face = Typeface:Register{
    url = "https://github.com/fayvrit/Typeface/raw/refs/heads/main/Fonts/Verdana.ttf", -- make sure the url is raw link
    name = "Verdana",
    weight = "Regular",
    style = "Normal",
    path = "Fonts",
}

local BoldFont = Face:Register{
    url = "https://github.com/fayvrit/Typeface/raw/refs/heads/main/Fonts/VerdanaBold.ttf",
    weight = "Bold",
}

local TextInstance = Instance.new 'TextLabel'
TextInstance.FontFace = BoldFont -- or BoldFont:Get() or Typeface:Get('Verdana-Bold')

```
