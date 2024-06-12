function onCreate()
   makeLuaSprite('KW', 'stages/kitchen/kitchenwall', -858, -435);
	setLuaSpriteScrollFactor('KW', 1.0, 1.0);
	scaleObject('KW', 6.26, 6.26);

	makeLuaSprite('KF', 'stages/kitchen/kitchenfloor', -1100, -650);
	setLuaSpriteScrollFactor('KF', 1.0, 1.0);
	scaleObject('KF', 8.0, 8.0);

   makeLuaSprite('K', 'stages/kitchen/kitchen', -873, -460);
	setLuaSpriteScrollFactor('K', 1.0, 1.0);
	scaleObject('K', 6.5, 6.5);

	addLuaSprite('KW', false);
	addLuaSprite('KF', false);
   addLuaSprite('K', false);
	
	
end