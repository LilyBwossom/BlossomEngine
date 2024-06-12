function onCreate()
	makeLuaSprite('sky', 'sky', -10, -226.75);
	setLuaSpriteScrollFactor('sky', 0.9, 0.9);

    makeLuaSprite('housesback', 'housesback', -100, -368.3);
    setLuaSpriteScrollFactor('housesback', 0.9, 0.9);

    makeLuaSprite('bushes', 'bushes', 144.85, 65.35);
    setLuaSpriteScrollFactor('bushes', 0.85, 0.85);

    makeLuaSprite('sidewalk', 'sidewalk', -300.4, 418);
    setLuaSpriteScrollFactor('sidewalk', 1, 1);

    makeLuaSprite('housesfront', 'housesfront', -981.3, -673.35);
    setLuaSpriteScrollFactor('housesfront', 1, 1);

	addLuaSprite('sky', false);
    addLuaSprite('housesback', false);
    addLuaSprite('bushes', false);
    addLuaSprite('sidewalk', false);
    addLuaSprite('housesfront', false);
    close(true)
end
--function onCreatePost()
    --setObjectOrder('gfGroup', getObjectOrder('bfGroup' + 15))
    --debugPrint('onCreatePost triggered')
    --end