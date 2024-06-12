-- Script by GifTrif.IF FNF 2
Composer  = 'smily'

function onCreate()
    makeLuaSprite('So', 'songSign', -300, 180)
    setObjectCamera('So', 'hud')
    addLuaSprite('So', true)
end

function onCreatePost()
    makeLuaText("S", songName, 0, -300, 187)
    setTextSize('S', 35)
    setObjectCamera('S', 'hud')
    addLuaText('S', true)

    makeLuaText('C', ''..Composer..'', 0, -300, 225)
    setTextSize('C', 35)
    setObjectCamera('C', 'hud')
    addLuaText('C', true)
end
	
function onSongStart()
    doTweenX('Sox','So' , 40 , 1, 'cubeInOut')
	 doTweenX('Sx','S' , 50 , 1, 'cubeInOut')
	 doTweenX('Cx','C' , 50 , 1, 'cubeInOut')
    runTimer('End', 3.9);
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'End' then
    doTweenX('Sox','So' , -300 , 1.5, 'cubeInOut')
	 doTweenX('Sx','S' , -300 , 1.5, 'cubeInOut')
	 doTweenX('Cx','C' , -300 , 1.5, 'cubeInOut')
 end
end
	