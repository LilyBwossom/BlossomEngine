function onCreate()
	--creates the bar's object
	makeLuaSprite('barText','barText',-72,522)
	addLuaSprite('barText',true);
	setScrollFactor('barText',0,0);
	setObjectCamera('barText','hud');
	
	--creates the song name text
	makeLuaText('songname',songName,300,getProperty('barText.x') + 100,560)
	addLuaSprite('songname',false);
	setTextFont('songname','vcr.ttf')
	setTextSize('songname','27')
	setTextAlignment('songname','left')
	setObjectOrder('barText',2)
	setObjectOrder('songname',3)
	
	--runs the timer for the bar and text to move off the screen
	runTimer('sair',5)
end
--makes the bar and text move off the screen
function onStepHit(sair)
if curStep ==1 then
	doTweenX('saindo1','barText',-526,1,'cubeInOut')
	doTweenX('saindo2','songname',-526,1,'cubeInOut')
end
end