function onCreate()
	makeLuaSprite('thumbnail', 'thumbnail', -400, -30);
	setLuaSpriteScrollFactor('thumbnail', 0.95, 0.95);

	addLuaSprite('thumbnail', false);
    close(true)
end
--function onCreatePost()
    --setObjectOrder('gfGroup', getObjectOrder('bfGroup' + 15))
    --debugPrint('onCreatePost triggered')
    --end