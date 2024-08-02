-- Table to store saved AIs globally
savedAI = {}

events.VisualActionCalled(function(e)
    if e.ActionName == "aio" then
        local anim = game.Animatronics[e.ActionArgs[1]]
        if savedAI[anim.Name] then return end -- Return if already disabled
        savedAI[anim.Name] = anim.AI[game.Night]
        anim.AI[game.Night] = 0

    elseif e.ActionName == "aion" then
        local anim = game.Animatronics[e.ActionArgs[1]]
        if not savedAI[anim.Name] then return end -- If its on already then return
        anim.AI[game.Night] = savedAI[anim.Name]
        savedAI[anim.Name] = nil 
    end
end)