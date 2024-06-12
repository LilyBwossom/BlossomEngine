function onCreate()
	makeLuaSprite('Bg', 'stages/rivalarena/rival_arena', -1258, -575);
	setLuaSpriteScrollFactor('Bg', 0.9, 0.9);
   scaleObject('Bg', 2.7, 2.7);

   makeLuaSprite('M', 'stages/rivalarena/mulch', -1240, -450);
	setLuaSpriteScrollFactor('M', 0.9, 0.9);
   scaleObject('M', 2.5, 2.5);

   makeLuaSprite('C', 'stages/rivalarena/computer', -1150, -400);
	setLuaSpriteScrollFactor('C', 0.9, 0.9);
   scaleObject('C', 2.5, 2.5);

   makeLuaSprite('E', 'stages/rivalarena/echo_flower', -1030, -460);
	setLuaSpriteScrollFactor('E', 0.9, 0.9);
   scaleObject('E', 2.3, 2.3);

   makeLuaSprite('P', 'stages/rivalarena/party_hats', -35, 50);
	setLuaSpriteScrollFactor('P', 0.9, 0.9);
   scaleObject('P', 1.25, 1.25);

   
	addLuaSprite('Bg', false);
   addLuaSprite('P', false);
   addLuaSprite('M', false);
   addLuaSprite('C', false);
   addLuaSprite('E', false);
	
end