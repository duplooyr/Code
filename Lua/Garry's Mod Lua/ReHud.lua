hook.Add("HUDPaint", "DrawMyHud", function()
    local health = LocalPlayer():Health()
    local shields = LocalPlayer():Armor()
    local health_code = health.."%"
    local w, h = ScrW(), ScrH(); 
    local client = LocalPlayer()



    function rainbow()
        local frequency = 0.3
        local red = math.sin(frequency * CurTime() + 0) * 127 + 128
        local green = math.sin(frequency * CurTime() + 2) * 127 + 128
        local blue = math.sin(frequency * CurTime() + 4) * 127 + 128
        return Color(red, green, blue)
    end // Rainbow Function


    if health <= 0 then health_code = "DEAD" end
    draw.RoundedBox(0, 4, ScrH() - 33.5, 202, 12, Color(0, 0, 0))
    draw.RoundedBox(0, 5, ScrH() - 33, 200, 10, Color(255, 0, 0))
    draw.RoundedBox(0, 5, ScrH() - 33, health * 2, 10, Color(57, 223, 39))
    draw.SimpleText(health_code, "ChatFont", 85, ScrH() - 36, Color(255, 255, 255)) // Health Bar


    if shields > 0 && health > 0 then
        draw.RoundedBox(0, 4, ScrH() - 20.5, 202, 12, Color(0, 0, 0))
        draw.RoundedBox(0, 5, ScrH() - 20, 200, 10, Color(39, 39, 39))
        draw.RoundedBox(0, 5, ScrH() - 20, shields * 2, 10, Color(5, 73, 233))
        draw.SimpleText(shields.."%", "ChatFont", 85, ScrH() - 23, Color(255, 255, 255)) // Shield Bar
    end



    if IsValid(LocalPlayer():GetActiveWeapon()) then
        local a_box_w = 130
        local a_box_h = 40

        draw.RoundedBox(0, w - 130, h - 75, a_box_w, a_box_h, Color(0, 0, 0))
        draw.RoundedBox(0, w - 129, h - 74, a_box_w - 2, a_box_h - 2, Color(63, 63, 63))
        draw.SimpleText(LocalPlayer():GetActiveWeapon():GetPrintName(), "ChatFont", w - 130, h - 75, Color(255, 255, 255))

        if (LocalPlayer():GetActiveWeapon():Clip1() != -1) then
            draw.SimpleText("AMMO: " .. LocalPlayer():GetActiveWeapon():Clip1() .. "/" .. LocalPlayer():GetAmmoCount(LocalPlayer():GetActiveWeapon():GetPrimaryAmmoType()), "ChatFont", w - 130, h - 63, Color(255, 255, 255))
        else
            draw.SimpleText("AMMO: " .. LocalPlayer():GetAmmoCount(LocalPlayer():GetActiveWeapon():GetPrimaryAmmoType()), "ChatFont", w - 130, h - 63, Color(255, 255, 255))
        end

        if (LocalPlayer():GetAmmoCount(LocalPlayer():GetActiveWeapon():GetSecondaryAmmoType()) > 0) then
            draw.SimpleText("Secondary " .. LocalPlayer():GetAmmoCount(LocalPlayer():GetActiveWeapon():GetSecondaryAmmoType()), "ChatFont", w - 130, h - 50, Color(255, 255, 255))
        end

    end // Weapon Info




    surface.SetDrawColor(255, 255, 0)
    surface.DrawLine(w / 2 - 20, h / 2, w / 2 - 5, h / 2); 
    surface.DrawLine(w / 2 + 20, h / 2, w / 2 + 5, h / 2); 
    surface.DrawLine(w / 2, h / 2 - 20, w / 2, h / 2 - 5); 
    surface.DrawLine(w / 2, h / 2 + 20, w / 2, h / 2 + 5); // Crosshair
    

    draw.SimpleText("HUD Rework by 007tropix", "ChatFont", 0, 0, rainbow(), 0, 0)
    draw.SimpleText("v1", "ChatFont", 0, 12, rainbow(), 0, 0) // Credits




end)

hook.Add("HUDShouldDraw", "hide_health", 
    function(n)
        if n == "CHudHealth" then return false end
    end)
    hook.Add("HUDShouldDraw", "hide_shields", 
        function(n)
            if n == "CHudBattery" then return false end
        end)
        hook.Add("HUDShouldDraw", "hide_crosshair", 
            function(n)
                if n == "CHudCrosshair" then return false end
            end)

            hook.Add("HUDShouldDraw", "hide_ammo", 
                function(n)
                    if n == "CHudAmmo" then return false end
                end)
                hook.Add("HUDShouldDraw", "hide_secondaryammo", 
                    function(n)
                        if n == "CHudSecondaryAmmo" then return false end
                    end)
                    // Hiding Hud Elements

                    

                    

                    

                    

                    

                    

                    

                   