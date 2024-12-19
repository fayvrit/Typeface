# Typeface-Registration
Roblox Custom Typeface Registration

### Example
```lua
local Typeface = loadstring( game:HttpGet "https://github.com/fayvrit/Typeface/raw/refs/heads/main/Register.lua" )()
local Path = "Typefaces"

local Font = Typeface:Register(Path, {
    name = "ProggyClean",
    weight = "Regular",
    style = "Normal",
    link = "https://github.com/fayvrit/Typeface/blob/main/Fonts/ProggyClean.ttf",
}) 
```
