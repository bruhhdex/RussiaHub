-- RussiaHub
-- Version 1.0

local Rayfield = loadstring(game:HttpGet(
    "https://sirius.menu/rayfield"
))()

-- WINDOW

local Window = Rayfield:CreateWindow({
    Name = "RussiaHub",
    LoadingTitle = "RussiaHub",
    LoadingSubtitle = "Universal Script",

    ConfigurationSaving = {
        Enabled = false
    },

    KeySystem = true,

    KeySettings = {
        Title = "RussiaHub",
        Subtitle = "Key System",
        Note = "Enter the RussiaHub key.",
        FileName = "RussiaHub",
        SaveKey = false,
        GrabKeyFromSite = false,
        Key = {"1234"}
    }
})

-- HOME TAB

local HomeTab = Window:CreateTab(
    "Home",
    4483362458
)

HomeTab:CreateSection("Welcome")

HomeTab:CreateParagraph({
    Title = "RussiaHub",
    Content = "Welcome to RussiaHub! Version 1.0"
})

-- ESP TAB

local ESPTab = Window:CreateTab(
    "ESP",
    4483362458
)

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

    if not LarryEnabled then
        return
    end

    if object.Name:lower() ~= "larry" then
        return
    end

    if not object:IsA("Model")
    and not object:IsA("BasePart") then
        return
    end

    if Highlights[object] then
        return
    end

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

-- DETECT NEW LARRY OBJECTS

workspace.DescendantAdded:Connect(function(object)

    task.wait(0.1)

    addLarryESP(object)

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
    Title = "RussiaHub",
    Content = "RussiaHub loaded successfully!",
    Duration = 5
})

