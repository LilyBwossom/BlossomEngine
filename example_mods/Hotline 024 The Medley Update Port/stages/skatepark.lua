
local u = false;
local r = 0;
local i =0
local shot = false;
local agent = 1
local health = 0;
local xx = 1100.95;
local yy = 570;
local xx2 = 1672.9;
local yy2 = 925;
local ofs = 35;
local followchars = true;
local del = 0;
local del2 = 0;
function onCreate()
    setProperty('defaultCamZoom',0.65)
    makeLuaSprite('bartop','',0,-30)
    makeGraphic('bartop',1280,100,'000000')
    addLuaSprite('bartop',true)
    setObjectCamera('bartop','hud')
    setScrollFactor('bartop',0,0)

    makeLuaSprite('barbot','',0,650)
    makeGraphic('barbot',1280,100,'000000')
    addLuaSprite('barbot',true)
    setScrollFactor('barbot',0,0)
    setObjectCamera('barbot','hud')

    makeLuaSprite('bg', 'skatepark/floor', 0, 0)
    addLuaSprite('bg', false)
    if not lowQuality then

    makeLuaSprite('bg2', 'skatepark/light', 0, 0)
    addLuaSprite('bg2', true)
end
end

function onUpdate(elapsed)

	daElapsed = elapsed * 30
	i = i + daElapsed

	daYvalue = 
	
	setProperty('dad.y', (math.sin(i/20)*75) + 200)
	yy = (math.sin(i/20)*75) + 650

	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
     if followchars == true then
        if mustHitSection == false then
            setProperty('defaultCamZoom',0.65)
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else
      
            setProperty('defaultCamZoom',0.75)
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    
end
function onStepHit()
if curStep == 1025 then

        setProperty('scoreTxt.visible', false)

        setProperty('healthBar.visible', false) -- change this & next 3 to true if u want health

        setProperty('healthBarBG.visible', false)

        setProperty('iconP1.visible', false)

        setProperty('iconP2.visible', false)

        setProperty('timeTxt.visible', false)

        setProperty('timeBar.visible', false)

        setProperty('timeBarBG.visible', false)

        setPropertyFromGroup('opponentStrums', 0, 'alpha', 0)

        setPropertyFromGroup('opponentStrums', 1, 'alpha', 0)

        setPropertyFromGroup('opponentStrums', 2, 'alpha', 0)

        setPropertyFromGroup('opponentStrums', 3, 'alpha', 0)

        setPropertyFromGroup('playerStrums', 0, 'alpha', 0)

        setPropertyFromGroup('playerStrums', 1, 'alpha', 0)

        setPropertyFromGroup('playerStrums', 2, 'alpha', 0)

        setPropertyFromGroup('playerStrums', 3, 'alpha', 0)

    end

if curStep == 1088 then

        setProperty('scoreTxt.visible', true)

        setProperty('healthBar.visible', true)

        setProperty('healthBarBG.visible', true)

        setProperty('iconP1.visible', true)

        setProperty('iconP2.visible', true)

        setProperty('timeTxt.visible', true)

        setProperty('timeBar.visible', true)

        setProperty('timeBarBG.visible', true)

        setPropertyFromGroup('opponentStrums', 0, 'alpha', 1)

        setPropertyFromGroup('opponentStrums', 1, 'alpha', 1)

        setPropertyFromGroup('opponentStrums', 2, 'alpha', 1)

        setPropertyFromGroup('opponentStrums', 3, 'alpha', 1)

        setPropertyFromGroup('playerStrums', 0, 'alpha', 1)

        setPropertyFromGroup('playerStrums', 1, 'alpha', 1)

        setPropertyFromGroup('playerStrums', 2, 'alpha', 1)

        setPropertyFromGroup('playerStrums', 3, 'alpha', 1)

end
end
