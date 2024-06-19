flipped = true
flippedIdle = false
defaultY = 0
function onCreatePost()
	defaultY = getProperty('boyfriend.y')
end
function onBeatHit() 
	if getProperty('healthBar.percent') < 80 then
		flipped = not flipped
		setProperty('iconP1.flipX', flipped)
	end
	
	if curBeat % 1 == 0 and getProperty('boyfriend.animation.curAnim.name') == 'idle' then
		triggerEvent('Play Animation', 'idle', 'boyfriend', false);
		flippedIdle = not flippedIdle
		setProperty('boyfriend.flipX', flippedIdle)
		setProperty('boyfriend.y', getProperty('boyfriend.y') + 20)
		doTweenY('raise', 'boyfriend', getProperty('boyfriend.y') - 20, 0.15, 'cubeOut')
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if not getPropertyFromGroup('notes', id, 'gfNote') then
	cancelTween('raise')
	setProperty('boyfriend.y', defaultY)
	setProperty('boyfriend.flipX', true)
	end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if not getPropertyFromGroup('notes', id, 'gfNote') then
	cancelTween('raise')
	setProperty('boyfriend.y', defaultY)
	setProperty('boyfriend.flipX', true)
	end
end

function onStepHit() 
	if getProperty('healthBar.percent') > 80 and curStep % 2 == 0 then
		flipped = not flipped
		setProperty('iconP1.flipX', flipped)
	end
end