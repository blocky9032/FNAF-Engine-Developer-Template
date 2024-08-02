events.OnEngineStart(function(e)
    local PanoramaSettings = GameData.ext_data.skpanoramamodifier
    MF_SetPanoramaValue(PanoramaSettings.Office)
    MF_SetCameraPanoramaValue(PanoramaSettings.Camera)
end)