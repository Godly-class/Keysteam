-- NovaHub Key System - 只認兩個 Key 版
-- 錯誤超過 3 次就踢出 + 聊天發訊息

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local key1 = "NovaHub-free_key"
local key2 = "NOVA-UNIVERSAL-am9pbiBOb19HcmVlbl9iZWFucyB0ZWFtIGluIHRvZGF5ISE="

local inputKey = ""
local errorCount = 0
local maxErrors = 3

local KeyWin = WindUI:CreateWindow({
    Title = "NovaHub - Key 驗證",
    Icon = "key",
    Size = UDim2.fromOffset(420, 300),
    Acrylic = true,
    Theme = "Dark"
})

local tab = KeyWin:Tab({Title = "輸入 Key", Icon = "key-round"})

tab:Paragraph({
    Title = "輸入正確key",
    Desc = "如果不知道請加入discord"
})

tab:Divider()

tab:Input({
    Title = "Key",
    Placeholder = "輸入你的 Key...",
    Callback = function(value)
        inputKey = value
    end
})

tab:Button({
    Title = "驗證並載入",
    Icon = "check-circle",
    Callback = function()
        if inputKey == key1 then
            WindUI:Notify({
                Title = "驗證成功",
                Content = "腳本載入中...",
                Duration = 4,
                Icon = "check-circle"
            })
            KeyWin:Destroy()
            loadstring(game:HttpGet("https://pastebin.com/raw/v4DkDbpU"))()
            
        elseif inputKey == key2 then
            WindUI:Notify({
                Title = "驗證成功",
                Content = "載入腳本中...",
                Duration = 4,
                Icon = "check-circle"
            })
            KeyWin:Destroy()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Godly-class/NovaHub/refs/heads/main/important%20script.lua"))()
          
        else
            errorCount = errorCount + 1
            WindUI:Notify({
                Title = "Key 錯誤",
                Content = "剩餘嘗試次數：" .. (maxErrors - errorCount),
                Duration = 5,
                Icon = "alert-triangle"
            })
            
            if errorCount >= maxErrors then
                -- 踢出 + 聊天發訊息
                while task.wait() do
                game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
                    Text = "我是外掛！i am idiot!",
                    Color = Color3.fromRGB(255, 0, 0),
                    Font = Enum.Font.SourceSansBold,
                    FontSize = Enum.FontSize.Size24
                })
                
                
                WindUI:Notify({
                    Title = "fuck you nigger",
                    Content = "輸入錯誤超過 3 次，已被踢出",
                    Duration = 10,
                    Icon = "alert-octagon"
                })
                
                -- 延遲 1 秒後踢出（給通知時間顯示）
                task.delay(1, function()
                    game.Players.LocalPlayer:Kick("fuck you - too many wrong keys")
                end)
            end
        end
    end
end
})

tab:Button({
    Title = "加入 Discord",
    Icon = "users",
    Callback = function()
        setclipboard("https://discord.gg/4WSmx666DP")
        WindUI:Notify({Title = "已複製", Content = "Discord 連結已複製", Duration = 4})
    end
})
