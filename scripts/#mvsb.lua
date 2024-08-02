events.VisualActionCalled(function(e)
    if e.ActionName == "call" then
        if e.ActionArgs[1] ~= nil then
            local func = e.ActionArgs[1]
            FEScript.RunEvent(FEScript.AllScripts, "function", func)
        else
            MF_CustomError("MVSB Error:", "Attempt to call 'nil'")
        end
    elseif e.ActionName == "callE" then
        MF_CustomError(e.ActionArgs[1], e.ActionArgs[2])
    end
end)