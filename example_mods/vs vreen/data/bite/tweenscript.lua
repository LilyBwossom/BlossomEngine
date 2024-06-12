function onCreate()
	getData();
	setProperty('healthBar.flipX',true)
	runTimer('hello', 10)
end

function onCreatePost()
	swapArrows();
	setProperty('camHUD.alpha', 0);
end

function onBeatHit()
	if curBeat % 504 == 0 then
		setPropertyFromGroup('playerStrums', 0, 'x', 400 - 250)
		setPropertyFromGroup('playerStrums', 1, 'x', 520 - 200)
		setPropertyFromGroup('playerStrums', 2, 'x', 640 + 200)
		setPropertyFromGroup('playerStrums', 3, 'x', 760 + 250)
		
		setPropertyFromGroup('opponentStrums', 0, 'x', -5000)
		setPropertyFromGroup('opponentStrums', 1, 'x', -5000)
		setPropertyFromGroup('opponentStrums', 2, 'x', -5000)
		setPropertyFromGroup('opponentStrums', 3, 'x', -5000)
    end

end

function swapArrows()
	if not doublechart then
		setPropertyFromGroup('opponentStrums', 0, 'x', defaultPlayerStrumX0)
		setPropertyFromGroup('opponentStrums', 1, 'x', defaultPlayerStrumX1)
		setPropertyFromGroup('opponentStrums', 2, 'x', defaultPlayerStrumX2)
		setPropertyFromGroup('opponentStrums', 3, 'x', defaultPlayerStrumX3)
	  
		setPropertyFromGroup('playerStrums', 0, 'x', defaultOpponentStrumX0 + 0)
		setPropertyFromGroup('playerStrums', 1, 'x', defaultOpponentStrumX1 + 0)
		setPropertyFromGroup('playerStrums', 2, 'x', defaultOpponentStrumX2 + 0)
		setPropertyFromGroup('playerStrums', 3, 'x', defaultOpponentStrumX3 + 0)
	end
end

function getData()
	setProperty("dad.x", 1010);
	setProperty("dad.alpha", 0);
end

function onTimerCompleted()
	doTweenX('candyTweenX1', 'dad', 650, 7.5, 'linear')
	doTweenAlpha('candyTweenAlpha1', 'dad', 1, 6.5, 'linear')
	doTweenAlpha('hudTween', 'camHUD', 1, 6, 'linear')
end

function onUpdatePost(elapsed)
	if getProperty('healthBar.flipX') == true then
		P1Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) + (150 * getProperty('iconP1.scale.x') - 150) / 2 - 26)
		P2Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) - (150 * getProperty('iconP2.scale.x')) / 2 - 26 * 2)
		setProperty('iconP1.x',P1Mult - 110)
		setProperty('iconP1.origin.x',240)
		setProperty('iconP1.flipX',true)
		setProperty('iconP2.x',P2Mult + 110)
		setProperty('iconP2.origin.x',-100)
		setProperty('iconP2.flipX',true)
	else
		P1Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) + (150 * getProperty('iconP1.scale.x') - 150) / 2 - 26)
		P2Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) - (150 * getProperty('iconP2.scale.x')) / 2 - 26 * 2)
		setProperty('iconP1.origin.x',0)
		setProperty('iconP1.flipX',false)
		setProperty('iconP2.origin.x',0)
		setProperty('iconP2.flipX',false)
	end
end


