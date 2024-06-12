--Event note hooks
function onEvent(name, value1, value2)
    if name == 'Subtitles' then
        fade = 0
        setTextString('subtitle', value1)
        setTextColor('subtitle', value2)
    end
end

function onCreate()
    fade = 0
    makeLuaText('subtitle', '', 400, 445, 500)
    addLuaText('subtitle')
    setTextSize('subtitle', 60)
	if songName == "bite" then
		setObjectCamera('subtitle', 'other');
	end
end

function onUpdate()
    fade = fade + 1
    if fade > 200 then
        setTextString('subtitle', '')
    end
end