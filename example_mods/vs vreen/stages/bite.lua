dadX = 0
dadY = 0
function onCreate() 
	addCharacterToList('foxy', 'dad')
	precacheImage('bg/bite/freddy-jumpscare')
	precacheImage('bg/bite/cindybg')
	precacheImage('bg/bite/monkeybg')
	precacheImage('bg/bite/foxy-run')
	precacheImage('bg/bite/golden')
	makeLuaSprite('backstage','bg/bite/office', -330, 100)
	--setProperty('backstage.antialiasing', false)
	addLuaSprite('backstage',false)
	
	makeAnimatedLuaSprite('cindy', 'bg/bite/cindybg', 330, 310)
	addAnimationByPrefix('cindy', 'dance', 'Cindy', 30, false)
	setProperty('cindy.visible', false)
	addLuaSprite('cindy')
	
      makeAnimatedLuaSprite('candy', 'characters/candy', 130, 280)
	scaleObject('candy', 0.70, 0.75); 
	addAnimationByPrefix('candy', 'dance', 'candy idle', 24, true)
	addAnimationByPrefix('candy', 'up', 'candy up', 24, true)
	addAnimationByPrefix('candy', 'right', 'candy right', 24, true)
	addAnimationByPrefix('candy', 'down', 'candy down', 24, true)
	setProperty('candy.visible', false)
	addLuaSprite('candy')
	
	makeAnimatedLuaSprite('monkey', 'bg/bite/monkeybg', 690, 240)
	addAnimationByPrefix('monkey', 'dance', 'Monkey', 30, false)
	setProperty('monkey.visible', false)
	addLuaSprite('monkey')
     
      makeAnimatedLuaSprite('penguin', 'characters/penguin', 930, 480)
	scaleObject('penguin', 0.70, 0.75); 
	addAnimationByPrefix('penguin', 'dance', 'penguin idle', 24, true)
	addAnimationByPrefix('penguin', 'up', 'penguin up', 24, true)
	addAnimationByPrefix('penguin', 'down', 'penguin down', 24, true)
	addAnimationByPrefix('penguin', 'right', 'penguin right', 24, true)
	setProperty('penguin.visible', false)
	addLuaSprite('penguin')
	
      makeLuaSprite('golden', 'bg/bite/golden', 0, 0)
	setScrollFactor('golden', 0, 0)
	setProperty('golden.visible', false)
	addLuaSprite('golden', true)
end

function onCreatePost() 
	setProperty('dad.alpha', 0)
	dadX = getProperty('dad.x') + 100
	dadY = getProperty('dad.y')
end

function onUpdate(elapsed)
	if mustHitSection then
		setProperty('defaultCamZoom', 1.1)
	else
		setProperty('defaultCamZoom', 1.5)
	end
end

function onBeatHit()
	if curBeat % 2 == 0 then
		objectPlayAnimation('cindy', 'dance', true)
		objectPlayAnimation('monkey', 'dance', true)
	end
end

function onEvent(n, v1, v2)
	if n == 'Freddy Intro' then
		doTweenX('freddyMove', 'dad', getProperty('dad.x') + 100, 4, 'cubeOut')
		doTweenAlpha('freddyFade', 'dad', 1, 4, 'cubeOut')
	end
	
	if n == 'Change Character' and v2 == 'freddy' then
		setProperty('dad.x', dadX)
		setProperty('dad.y', dadY)
	end
end