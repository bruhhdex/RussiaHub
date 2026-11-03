-- Load the Rayfield Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Create the Window with Key System Enabled
local Window = Rayfield:CreateWindow({
   Name = "RussiaHub",
   Icon = 0,
   LoadingTitle = "RussiaHub Verification",
   LoadingSubtitle = "by YourName",
   Theme = "Default",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = "RussiaHub",
      FileName = "Config"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },

   KeySystem = true,
   KeySettings = {
      Title = "RussiaHub Key System",
      Subtitle = "Authentication Required",
      Note = "Enter the official key to access RussiaHub.",
      FileName = "RussiaHubKey",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"russiahub_key_678338382"}
   }
})

-- Create Main Tab
local MainTab = Window:CreateTab("Main", 4483362458)

-- Main Tab Section & Features
local MainSection = MainTab:CreateSection("Movement")

local SpeedSlider = MainTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 200},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "SpeedSlider",
   Callback = function(Value)
      if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
      end
   end,
})

-- Create ESP Tab
local ESPTab = Window:CreateTab("ESP", 4483362458)

-- ESP Section
local ESPSection = ESPTab:CreateSection("Visual Features")

-- Player ESP Toggle Example
local ESPToggle = ESPTab:CreateToggle({
   Name = "Enable Player ESP",
   CurrentValue = false,
   Flag = "ESPToggle",
   Callback = function(Value)
      print("ESP Toggled:", Value)
      -- Insert your ESP logic here
   end,
})

-- ESP Tracers Toggle Example
local TracersToggle = ESPTab:CreateToggle({
   Name = "Enable Tracers",
   CurrentValue = false,
   Flag = "TracersToggle",
   Callback = function(Value)
      print("Tracers Toggled:", Value)
      -- Insert your Tracer logic here
