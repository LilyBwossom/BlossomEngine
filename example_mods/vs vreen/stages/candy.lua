function onCreate()

	setProperty('defaultCamZoom',1)

	makeLuaSprite('office', 'bg/candy/office', -270, -100)
	setScrollFactor('office', 1, 1)

	makeLuaSprite('window', 'bg/candy/window', -300, 0)
	setScrollFactor('window', 1, 1)
	scaleObject('window', 1, 1)

	makeLuaSprite('back', 'bg/candy/back', -200, 100)
	setScrollFactor('back', 1, 1)

	makeLuaSprite('objects', 'bg/candy/objects', -700, 400)
	setScrollFactor('objects', 1.5, 1.5)

	makeLuaSprite('doors', 'bg/candy/doors', -270, -55)
	setScrollFactor('doors', 1, 1)

	makeLuaSprite('vignette', 'bg/candy/vignette', 0, 0)
	setScrollFactor('vignette', 0, 0)

	makeLuaSprite('vignette2', 'bg/candy/vignette', 0, 0)
	setScrollFactor('vignette2', 0, 0)

	makeLuaSprite('streamers', 'bg/candy/streamers', -320, -100)
	setScrollFactor('streamers', 1, 1)

	makeLuaSprite('lamp', 'bg/candy/lamp', 300, -50)
	setScrollFactor('lamp', 1, 1)

	makeLuaSprite('light', 'bg/candy/light', -120, -100)
	setScrollFactor('light', 1, 1)
	setBlendMode('light','add')

	makeLuaSprite('blur', 'bg/candy/blur', -520, -250)
	setScrollFactor('blur', 1.5, 1.5)

	makeLuaSprite('chair', 'bg/candy/chair', 250, 300)
	setScrollFactor('chair', 1, 1)

	makeAnimatedLuaSprite('crash','bg/candy/crash', 196, 55)
	addAnimationByPrefix('crash','dance','crash crash',24,false);
	scaleObject('crash', 1, 1)
	setScrollFactor('crash', 1, 1)

	setPropertyFromClass('GameOverSubstate', 'characterName', 'pewdie');

	addLuaSprite('office', false);
	addLuaSprite('crash', false);
	addLuaSprite('chair', false);
	addLuaSprite('doors', true);
	addLuaSprite('streamers', false);
	addLuaSprite('light', true);
	addLuaSprite('lamp', true);
	addLuaSprite('blur', true);
	addLuaSprite('back', false);
	addLuaSprite('window', true);
	addLuaSprite('objects', true);
	addLuaSprite('vignette', true);
	addLuaSprite('vignette2', true);


	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end