local Library = {  }

-- // Assert Alternative
Library.Throw = function(Condition, String)
    return Condition or error(String)
end

--[[ Compatibility Check ]] do
    cloneref                = cloneref or function(service) return service end

    isfile                  = Library.Throw(isfile, 'Executor is incompatible!')
    isfolder                = Library.Throw(isfolder, 'Executor is incompatible!')
    writefile               = Library.Throw(writefile, 'Executor is incompatible!')
    makefolder              = Library.Throw(makefolder, 'Executor is incompatible!')
    getcustomasset          = Library.Throw(getcustomasset, 'Executor is incompatible!')
end

-- // Metatables 
Library.__index = function(self, key)
    local lowerkey = string.lower(key)

    return 
        rawget(self, lowerkey) or 
        rawget(self, key) or 
        rawget(Library, lowerkey) or 
        rawget(Library, key)
end

-- // Services
local Http = cloneref(game:GetService 'HttpService')

-- // Tables
Library.Fonts = { }

-- // Functions
function Library:Register(Info)
    Info = setmetatable(Info or { }, Library)

    Info.url = Library.Throw(Info.link, 'Link is missing!')
    Info.name = Library.Throw(Info.name, 'Name is missing!')
    Info.id = Library.Throw(Info.id, 'ID is missing!')

    Info.weight = Info.weight or 'Regular'
    Info.style = Info.style or 'Normal'

    Info.path = Library.Throw(Info.path or Library.Path, 'Path is missing!')
    Info.enumweight = Library.Throw(Enum.FontWeight[Info.weight], `Couldn't find enum weight for "{Info.weight}"!`)
    Info.numweight = Library.Throw(Info.enumweight.Value, `Couldn't find numerical weight for "{Info.weight}"!`)

    Info.fullname = `{ Info.numweight ~= '400' and '-' .. Info.weight or '' }{ Info.style ~= 'Normal' and '-' .. Info.style or '' }`
    Info.fontpath = `{ Info.path }\\{ Info.fullname }.font`
    Info.familypath = `{ Info.path }\\Families`

    Info.family = self.family

    Library:CheckPath(Info.path)
    Library:CheckPath(Info.familypath)

    Info:CreateFont()
    Info:CreateFamily()

    Library.Fonts[Info.fullname] = Info
    Library.Path = Info.path

    return Info:Get(), Info
end

function Library:Get(Name)
    local face = Library.Fonts[Name] or self

    return Font.new(face.font, face.enumweight)
end

function Library:CheckPath(Path)
    if isfolder(Path) then return end

    makefoler(Path)
end

function Library:CreateFont()
    local Info = Library.Throw(self.Info, 'Information is missing!')

    if isfile(Info.fontpath) then return end

    local Success, Result = pcall(function()
        return game:HttpGet(Info.url)
    end)

    Library.Throw(Success, `Failed to fetch "{Info.name .. Info.weight .. Info.style}" file!`)
    warn(`Successfully fetched "{Info.name .. Info.weight .. Info.style}" file!`)

    writefile(Info.fontpath, Result)

    Info.fontpath = getcustomasset(Info.fontpath)
end

function Library:CreateFamily()
    local Info = Library.Throw(self.Info, 'Information is missing!')

    Info.family = Info.family or {
        name = Info.name,
        faces = { }
    }

    table.insert({
        name = string.gsub(Info.fullname, '-', ' '),
        weight = Info.numweight,
        style = Info.style,
        assetId = getcustomasset(Info.fontpath),
    }, Info.family.faces)

    writefile(`{ Info.familypath }\\{ Info.name }.json`, Http:JSONEncode(Info.family))
end

return Library
