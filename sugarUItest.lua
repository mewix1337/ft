loadstring(game:HttpGet("https://wexly.vercel.app/core/assets"))()

local SugarLibrary = loadstring(game:HttpGet('https://wexly-cdn.vercel.app/library/sugar/sourceR'))()
local Notification = SugarLibrary.Notification()

Notification.new({
    Title = "SugarUI",
    Description = "Loaded successfully",
    Duration = 4,
    Icon = "check"
})

local Window = SugarLibrary.new({
    Title = "SugarUI Test",
    Description = "All features demo",
    Keybind = Enum.KeyCode.RightShift,
    Logo = assets.bgswnmo,
    ConfigFolder = "SugarTest",
    -- Темы
    Theme = Color3.fromRGB(0, 0, 0),
    Background = Color3.fromRGB(31, 9, 36),
    PanelColor = Color3.fromRGB(0, 0, 0),
    Accent = Color3.fromRGB(255, 255, 255),
    -- Фон меню
    MenuBGImage = assets.bgswnmo,
    MenuBGImageTransparency = 0.75,
	HiddenBGImage =  assets.swanmo_b,
	HiddenBGTransparency = 0.1,
})

local Tab1 = Window:NewTab({
    Title = "Elements",
    Description = "All elements",
    Icon = "layout-list"
})

local LeftSection = Tab1:NewSection({
    Title = "Left Section",
    Icon = "list",
    Position = "Left"
})

LeftSection:NewToggle({
    Title = "Toggle",
    Name = "Toggle1",
    Default = false,
    Callback = function(v)
        print("Toggle:", v)
    end
})

LeftSection:NewToggle({
    Title = "Toggle On",
    Name = "Toggle2",
    Default = true,
    Callback = function(v)
        print("Toggle2:", v)
    end
})

LeftSection:NewButton({
    Title = "Button",
    Callback = function()
        print("Button clicked")
        Notification.new({
            Title = "Button",
            Description = "Clicked!",
            Duration = 2,
            Icon = "mouse-pointer-click"
        })
    end
})

LeftSection:NewButton({
    Title = "Button with Notify",
    Callback = function()
        Notification.new({
            Title = "Hello",
            Description = "This is a notification",
            Duration = 3,
            Icon = "bell"
        })
    end
})

LeftSection:NewSlider({
    Title = "Slider",
    Name = "Slider1",
    Min = 0,
    Max = 100,
    Default = 50,
    Callback = function(v)
        print("Slider:", v)
    end
})

LeftSection:NewSlider({
    Title = "WalkSpeed",
    Name = "WalkSpeed",
    Min = 16,
    Max = 100,
    Default = 16,
    Callback = function(v)
        local char = game:GetService("Players").LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = v
        end
    end
})

LeftSection:NewKeybind({
    Title = "Keybind",
    Name = "Keybind1",
    Default = Enum.KeyCode.E,
    Callback = function(k)
        print("Keybind:", k)
    end
})

LeftSection:NewDropdown({
    Title = "Dropdown",
    Name = "Dropdown1",
    Data = {"Option 1", "Option 2", "Option 3", "Option 4"},
    Default = "Option 1",
    Callback = function(v)
        print("Dropdown:", v)
    end
})

LeftSection:NewTextbox({
    Title = "Textbox",
    Name = "Textbox1",
    Default = "",
    FileType = ".txt",
    Callback = function(v)
        print("Textbox:", v)
    end
})

LeftSection:NewLabel("This is a label")
LeftSection:NewTitle("This is a title")

LeftSection:NewImage({
    ImageId = assets.swanmo_b,
})

local RightSection = Tab1:NewSection({
    Title = "Right Section",
    Icon = "layout-list",
    Position = "Right"
})

RightSection:NewToggle({
    Title = "Right Toggle",
    Name = "RightToggle",
    Default = false,
    Callback = function(v)
        print("Right Toggle:", v)
    end
})

RightSection:NewButton({
    Title = "Right Button",
    Callback = function()
        print("Right button clicked")
    end
})

RightSection:NewSlider({
    Title = "Right Slider",
    Name = "RightSlider",
    Min = 0,
    Max = 50,
    Default = 25,
    Callback = function(v)
        print("Right Slider:", v)
    end
})

local Tab2 = Window:NewTab({
    Title = "Collapsible",
    Description = "Collapsible sections",
    Icon = "folder"
})

local CollapsibleOpen = Tab2:NewSection({
    Title = "Open by default",
    Icon = "folder-open",
    Position = "Left",
    DefaultOpen = true
})

CollapsibleOpen:NewToggle({
    Title = "Toggle in collapsible",
    Name = "ColToggle1",
    Default = false,
    Callback = function(v) print("ColToggle:", v) end
})

CollapsibleOpen:NewButton({
    Title = "Button in collapsible",
    Callback = function() print("Col button") end
})

CollapsibleOpen:NewSlider({
    Title = "Slider in collapsible",
    Name = "ColSlider1",
    Min = 0,
    Max = 100,
    Default = 30,
    Callback = function(v) print("Col slider:", v) end
})

CollapsibleOpen:NewDropdown({
    Title = "Dropdown in collapsible",
    Name = "ColDrop1",
    Data = {"A", "B", "C"},
    Default = "A",
    Callback = function(v) print("Col dropdown:", v) end
})

CollapsibleOpen:NewTextbox({
    Title = "Textbox in collapsible",
    Name = "ColText1",
    Default = "",
    FileType = "",
    Callback = function(v) print("Col textbox:", v) end
})

CollapsibleOpen:NewKeybind({
    Title = "Keybind in collapsible",
    Name = "ColKeybind1",
    Default = Enum.KeyCode.F,
    Callback = function(k) print("Col keybind:", k) end
})

CollapsibleOpen:NewLabel("Label in collapsible")
CollapsibleOpen:NewTitle("Title in collapsible")

CollapsibleOpen:NewImage({
    ImageId =  assets.bgswnmo
})

local CollapsibleClosed = Tab2:NewCollapsibleSection({
    Title = "Closed by default",
    Icon = "folder",
    Position = "Right",
    DefaultOpen = false
})

CollapsibleClosed:NewToggle({
    Title = "Hidden toggle",
    Name = "HiddenToggle",
    Default = false,
    Callback = function(v) print("Hidden:", v) end
})

CollapsibleClosed:NewButton({
    Title = "Hidden button",
    Callback = function() print("Hidden button") end
})

local Tab3 = Window:NewTab({
    Title = "Configs",
    Description = "Config management",
    Icon = "save"
})

local ConfigSection = Tab3:NewSection({
    Title = "Config Tools",
    Icon = "file-cog",
    Position = "Left"
})

local configNames = Window.ListConfigs()
local configDropdown = ConfigSection:NewDropdown({
    Title = "Configs",
    Name = "ConfigList",
    Data = #configNames > 0 and configNames or {"None"},
    Default = configNames[1] or "None",
    Callback = function(v) print("Selected:", v) end
})

local configNameBox = ConfigSection:NewTextbox({
    Title = "Config Name",
    Name = "ConfigName",
    Default = "",
    FileType = "",
    Callback = function(v) print("Name:", v) end
})

ConfigSection:NewButton({
    Title = "Save Config",
    Callback = function()
        local name = configNameBox.Get()
        if name and name ~= "" then
            Window.SaveConfig(name)
            configNames = Window.ListConfigs()
            configDropdown.Refresh(configNames)
            Notification.new({ Title = "Saved", Description = name, Duration = 2, Icon = "save" })
        end
    end
})

ConfigSection:NewButton({
    Title = "Load Config",
    Callback = function()
        local selected = configDropdown.Get()
        if selected and selected ~= "None" then
            Window.LoadConfig(selected)
            Notification.new({ Title = "Loaded", Description = selected, Duration = 2, Icon = "check" })
        end
    end
})

ConfigSection:NewButton({
    Title = "Delete Config",
    Callback = function()
        local selected = configDropdown.Get()
        if selected and selected ~= "None" then
            Window.DeleteConfig(selected)
            configNames = Window.ListConfigs()
            configDropdown.Refresh(#configNames > 0 and configNames or {"None"})
            Notification.new({ Title = "Deleted", Description = selected, Duration = 2, Icon = "trash" })
        end
    end
})

ConfigSection:NewButton({
    Title = "Refresh",
    Callback = function()
        configNames = Window.ListConfigs()
        configDropdown.Refresh(#configNames > 0 and configNames or {"None"})
    end
})

ConfigSection:NewKeybind({
    Title = "UI Toggle Key",
    Name = "UIToggle",
    Default = Enum.KeyCode.RightShift,
    Callback = function(k)
        Window.SetKeybind(k)
        print("New keybind:", k)
    end
})

local Tab4 = Window:NewTab({
    Title = "Info",
    Description = "About",
    Icon = "info"
})

local InfoSection = Tab4:NewSection({
    Title = "About",
    Icon = "circle-help",
    Position = "Left"
})

InfoSection:NewTitle("SugarUI Test Script")
InfoSection:NewLabel("Version: 1.0.0")
InfoSection:NewLabel("All elements demo")

local statusLabel = InfoSection:NewLabel("Status: Ready")

InfoSection:NewButton({
    Title = "Update Status",
    Callback = function()
        statusLabel.Set("Status: Updated at " .. os.clock())
    end
})

InfoSection:NewImage({
    ImageId = "rbxassetid://104381302798685"
})

local visSection = Tab4:NewSection({
    Title = "Visibility Test",
    Icon = "eye",
    Position = "Right"
})

local hiddenToggle = visSection:NewToggle({
    Title = "Hidden Toggle",
    Name = "HiddenVis",
    Default = true,
    Callback = function(v) print("Hidden:", v) end
})

visSection:NewButton({
    Title = "Hide Toggle above",
    Callback = function()
        hiddenToggle.Visible(false)
    end
})

visSection:NewButton({
    Title = "Show Toggle above",
    Callback = function()
        hiddenToggle.Visible(true)
    end
})


