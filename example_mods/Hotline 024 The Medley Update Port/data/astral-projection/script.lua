function onCreate()
    setProperty('healthBar.alpha', tonumber(0))
    setProperty('iconP1.alpha', tonumber(0))
    setProperty('iconP2.alpha', tonumber(0))
end

function onStepHit()
	if curStep == 1280 then
		setProperty('bg.visible', false)
		setProperty('bg2.visible', false)
		setProperty('bg3.visible', false)
		setProperty('bg4.visible', true)
		setProperty('bg5.visible', true)
		setProperty('bg6.visible', true)
		setProperty('bg7.visible', true)
		setProperty('bg8.visible', true)
		setProperty('bg9.visible', true)
		setProperty('bg10.visible', true)
		addVCREffect('camHUD')
	end
end