-- Russia Hub by evil werumov

-- Version 1.1

-- Game Compatibility Check DO NOT CHANGE IN ANY WAY


local SupportedGame = 4987467534


if game.PlaceId ~= SupportedGame then

    game.Players.LocalPlayer:Kick("Game not supported, See our supported games list at discord")

    return

end



local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()


-- WINDOW


local Window = Rayfield:CreateWindow({

    Name = "Russia Hub 1.1",

    LoadingTitle = "Russia Hub",

    LoadingSubtitle = "Loading, Please be patient!",


    ConfigurationSaving = {

        Enabled = false

    },


    KeySystem = true,


    KeySettings = {

        Title = "Russia Hub",

        Subtitle = "andrey pups kstati",

        Note = "Enter the Russia Hub key from our discord server.",

        FileName = "RussiaHub",

        SaveKey = false,

        GrabKeyFromSite = false,

        Key = {"russiahub_key_678338382"}

    }

})


-- HOME TAB


local HomeTab = Window:CreateTab("Home", 4483362458)


HomeTab:CreateSection("Welcome")


HomeTab:CreateParagraph({

    Title = "Russia Hub",

    Content = "Welcome to Russia Hub! Version 1.1"

})


HomeTab:CreateSection("Credits")


HomeTab:CreateParagraph({

    Title = "Made by evil werumov",

    Content = "Russia Hub — developed and maintained by evil werumov. Thanks for using the hub."

})


-- ESP TAB


local ESPTab = Window:CreateTab("ESP", 4483362458)


ESPTab:CreateSection("Larry ESP")


local LarryEnabled = false

local LarryColor = Color3.fromRGB(255, 0, 0)

local Highlights = {}


local function removeLarryESP()

    for object, highlight in pairs(Highlights) do

        if highlight then

            highlight:Destroy()

        end

        Highlights[object] = nil

    end

end


local function addLarryESP(object)

    if not LarryEnabled then return end

    if object.Name ~= "DeathHitbox" then return end

    if not (object:IsA("Model") or object:IsA("BasePart")) then return end

    if Highlights[object] then return end


    local Highlight = Instance.new("Highlight")

    Highlight.Name = "LarryHighlight"

    Highlight.Adornee = object

    Highlight.FillColor = LarryColor

    Highlight.OutlineColor = Color3.new(1, 1, 1)

    Highlight.FillTransparency = 0.5

    Highlight.OutlineTransparency = 0

    Highlight.Parent = object


    Highlights[object] = Highlight

end


local function scanWorkspace()

    for _, object in ipairs(workspace:GetDescendants()) do

        addLarryESP(object)

    end

end


ESPTab:CreateToggle({

    Name = "Larry ESP",

    CurrentValue = false,

    Callback = function(Value)

        LarryEnabled = Value

        if Value then

            scanWorkspace()

        else

            removeLarryESP()

        end

    end

})


ESPTab:CreateColorPicker({

    Name = "Larry ESP Color",

    Color = LarryColor,

    Callback = function(Color)

        LarryColor = Color

        for _, highlight in pairs(Highlights) do

            highlight.FillColor = Color

        end

    end

})


-- detect new Larry objects (name-gated before the delay)


workspace.DescendantAdded:Connect(function(object)

    if object.Name ~= "DeathHitbox" then return end

    task.wait(0.1)

    addLarryESP(object)

end)


-- PLAYER TAB


local PlayerTab = Window:CreateTab("Player", 4483362458)


PlayerTab:CreateSection("Movement")


local TPWalkSpeed = 2

local SpeedEnabled = false


PlayerTab:CreateToggle({

    Name = "Speedhack (WalkSpeed)",

    CurrentValue = false,

    Callback = function(Value)

        SpeedEnabled = Value

        if not Value then

            local char = game.Players.LocalPlayer.Character

            local hum = char and char:FindFirstChildOfClass("Humanoid")

            if hum then hum.WalkSpeed = 16 end

        end

    end

})


PlayerTab:CreateSlider({

    Name = "Speed Multiplier",

    Range = {1, 10},

    Increment = 0.5,

    Suffix = "x",

    CurrentValue = 2,

    Callback = function(Value)

        TPWalkSpeed = Value

    end

})


game:GetService("RunService").Heartbeat:Connect(function()

    if not SpeedEnabled then return end

    local char = game.Players.LocalPlayer.Character

    local hum = char and char:FindFirstChildOfClass("Humanoid")

    if hum then

        hum.WalkSpeed = 16 * TPWalkSpeed

    end

end)


-- CLEANUP


workspace.DescendantRemoving:Connect(function(object)

    if Highlights[object] then

        Highlights[object]:Destroy()

        Highlights[object] = nil

    end

end)


-- FINISHED


Rayfield:Notify({

    Title = "Russia Hub",

    Content = "Russia Hub loaded!",

    Duration = 5

})
