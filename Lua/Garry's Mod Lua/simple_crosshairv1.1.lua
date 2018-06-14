hook.Add("HUDPaint", "DrawMyHud", function()

    function rainbow()
        local frequency = 0.3
        local red = math.sin(frequency * CurTime() + 0) * 127 + 128
        local green = math.sin(frequency * CurTime() + 2) * 127 + 128
        local blue = math.sin(frequency * CurTime() + 4) * 127 + 128
        return Color(red, green, blue)
    end

    local w, h = ScrW(), ScrH(); 
    surface.SetDrawColor(255, 255, 0)
    surface.DrawLine(w / 2 - 20, h / 2, w / 2 - 5, h / 2); 
    surface.DrawLine(w / 2 + 20, h / 2, w / 2 + 5, h / 2); 
    surface.DrawLine(w / 2, h / 2 - 20, w / 2, h / 2 - 5); 
    surface.DrawLine(w / 2, h / 2 + 20, w / 2, h / 2 + 5); 


    draw.SimpleText("Simple Crosshair by 007tropix", "ChatFont", 0, 0, rainbow(), 0, 0)
    draw.SimpleText("v1.1", "ChatFont", 0, 12, rainbow(), 0, 0)


end)

hook.Add("HUDShouldDraw", "hide_crosshair", 
    function(n)
        if n == "CHudCrosshair" then return false end
    end)

    // Thanks to Ludicium for rainbow algorithm

        

       