function onCreate()
	makeLuaSprite('3', '3', 250, 180);
	scaleObject('3', 1.1, 1.1);
   setObjectCamera('3', 'hud')
   setProperty('3.visible', false)
	addLuaSprite('3', true);
	
end

function onCountdownTick(counter)
    if counter == 0 then
    setProperty('3.visible', true)
    doTweenAlpha('Alpha','3', 0,0.3)
    end
    if counter == 1 then
    
    end
    if counter == 2 then
        
    end
    if counter == 3 then

    end
end
