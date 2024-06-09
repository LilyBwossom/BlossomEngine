function onCountdownStarted()
	for i = 0, 3 do
		setPropertyFromGroup('opponentStrums', i, 'x', -900);
	end
	if difficulty == 1 then
	setPropertyFromGroup('playerStrums', 0, 'x', 115);
	setPropertyFromGroup('playerStrums', 1, 'x', 265);
	setPropertyFromGroup('playerStrums', 2, 'x', 905);
	setPropertyFromGroup('playerStrums', 3, 'x', 1055);
	else
	if not middlescroll then
	setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0 - 320);
    setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1 - 320);
    setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2 - 320);
    setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3 - 320);
	end
	end
	setProperty('iconP2.alpha', tonumber(0))
end