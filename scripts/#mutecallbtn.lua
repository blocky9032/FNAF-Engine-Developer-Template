--Modified by Blocky for the Updated FNAF 1 Template
--The script now destroy the mute call when the Night is 6 or 7
--Original script by SealedKiller

SKMuteCall = {
    Object = nil,
    Settings = nil
}

events.OnEngineStart(function(e)

    -- Load settings
    SKMuteCall.Settings = GameData.ext_data.skmutecall

    SKMuteCall.Object = Fusion.Object.New {x=26}
    SKMuteCall.Object:LoadImage(1, "mutecall.png")
    SKMuteCall.Object.Layer = 10

    -- Define the timer event in here since our settings are loaded here
    events.TickTimerEquals(SKMuteCall.Settings.HideDelay, function(e)
        if not SKMuteCall.Object then return end
        SKMuteCall.Object:Destroy()
    end)
end)

events.OnNightStart(function(e)
    if game.Settings.Toxic then
        SKMuteCall.Object.y = 76
    else
        SKMuteCall.Object.y = 24
    end

    SKMuteCall.Object:Update()
end)

events.Update(function(e)
    if not MF_IsChannelPlaying(4) and SKMuteCall.Object then
        SKMuteCall.Object:Destroy()
        SKMuteCall.Object = nil
    end
	--Blocky Edit Begin
	if game.Night == 6 and SKMuteCall.Object then
		SKMuteCall.Object:Destroy()
        SKMuteCall.Object = nil
	end
	if game.Night == 7 and SKMuteCall.Object then
		SKMuteCall.Object:Destroy()
        SKMuteCall.Object = nil
	end
	--Blocky Edit End
end)

events.UserClicked(function(e)
    if e.ClickType == "left" and SKMuteCall.Object and SKMuteCall.Object.IsMouseOver then
        SKMuteCall.Object:Destroy()
        SKMuteCall.Object = nil
        MF_StopChannel(4)
    end
end)