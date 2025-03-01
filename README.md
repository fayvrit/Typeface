# Typeface-Registration
Roblox Custom Typeface Registration

### Example
```lua
local Typeface = loadstring( game:HttpGet "https://github.com/fayvrit/Typeface/raw/refs/heads/main/Register.lua" )()
local Path = "Typefaces"

local Font, Face = Typeface:Register{
    url = "https://github.com/fayvrit/Typeface/blob/main/Fonts/Verdana.ttf",
    name = "Verdana",
    weight = "Regular",
    style = "Normal",
    path = "Fonts",
}

local BoldFont = Face:Register{
    url = "https://github.com/fayvrit/Typeface/blob/main/Fonts/VerdanaBold.ttf",
    weight = "Bold",
}

BoldFont:Get()

Typeface:Get('Verdana-Bold')
```
