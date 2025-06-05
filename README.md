# Example
Roblox Custom Typeface Registration

```lua
local Typeface = loadstring( game:HttpGet "https://github.com/fayvrit/Typeface/raw/feacecc2e6595be12f7a382e6da3efc35180b87d/Register.lua" )()

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

-- BoldFont:Get()
-- Typeface:Get('Verdana-Bold')
```
