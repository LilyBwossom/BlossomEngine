function onCreate()
      
    makeLuaSprite('back','bg/lore/stageback', -500,-300);
	scaleObject('back', 1, 1);
	updateHitbox('back');
	setProperty('back.antialiasing', false);
	setObjectOrder('back',0)
	addLuaSprite('back',false);
      
      makeLuaSprite('front','bg/lore/stagefront', -500,560);
	scaleObject('front', 1, 1);
	updateHitbox('front');
	setProperty('front.antialiasing', false);
	setObjectOrder('front',1)
	addLuaSprite('front',false);
     
      makeLuaSprite('curtains','bg/lore/stagecurtains', -500,-300);
	scaleObject('curtains', 1, 1);
	updateHitbox('curtains');
	setProperty('curtains.antialiasing', false);
	setObjectOrder('curtains',6)
	addLuaSprite('curtains',false);

     makeLuaSprite('object','bg/lore/object', 500, 280);
	scaleObject('object', 0.5, 0.5);
	updateHitbox('object');
	setProperty('object.antialiasing', false);
	setProperty('object.visible', false);
	setObjectOrder('object',7)
	addLuaSprite('object',false);

    --setProperty('gfGroup.visible', false);
end      	

function onUpdate(elapsed)
	if gfSection then
		setProperty('defaultCamZoom', 1.2)
	else
		setProperty('defaultCamZoom', 0.9)
	end
end