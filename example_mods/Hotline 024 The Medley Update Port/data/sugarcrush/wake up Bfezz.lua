--Codigo original por Asbel Sen y Muy mejorado por Nickobelit
local width = 0 

function onCreate() 
originy = getProperty('nikkup.y')
originy2 = getProperty('exe.y')

makeLuaSprite('bg3', 'skatepark/cutscene/background', -100, 0);
  scaleObject('bg3', 4, 3.6);  
  addLuaSprite('bg3', false);

  setObjectCamera('bg3','hud')

makeLuaSprite('bg1', 'skatepark/cutscene/background', -100, 0);
  scaleObject('bg1', 4, 3.6);  
  addLuaSprite('bg1', false);

  setObjectCamera('bg1','hud')
  
  makeLuaSprite('bg2', 'skatepark/cutscene/background', -100, 0);
  scaleObject('bg2', 4, 3.6);  
  addLuaSprite('bg2', false);

  setObjectCamera('bg2','hud')
  
 

makeLuaSprite('nikkup', 'skatepark/cutscene/nikkup', 600, 300);
setObjectCamera('nikkup','hud')
scaleObject('nikkup', 4, 4);  
addLuaSprite('nikkup', false); 

makeLuaSprite('exe', 'skatepark/cutscene/exe', 20, 350);
setObjectCamera('exe','hud')
scaleObject('exe', 5, 5);  
addLuaSprite('exe', false); 

setProperty('nikkup.antialiasing', false);  
setProperty('exe.antialiasing', false);  
setProperty('bg2.antialiasing', false);  
setProperty('bg1.antialiasing', false);  


setProperty('nikkup.alpha', 0);  
setProperty('exe.alpha', 0);  
setProperty('bg1.alpha', 0); 
setProperty('bg2.alpha', 0); 
setProperty('bg3.alpha', 0); 


makeLuaSprite('Flash2', 'Flash2', 0, 0);
    setLuaSpriteScrollFactor('Flash2', 0, 0);
    setProperty('Flash2.alpha', 0.0001);
    addLuaSprite('Flash2', true);
    scaleObject('Flash2', 5, 5); 
    setObjectCamera('Flash2', 'other');    
    
    setProperty('bg2.x',2300)
doTweenX("bg2Tweene", "bg2", -3000, 7, 'linear'); 
end 

function onTweenCompleted(tag)

if tag == "exe" then
setProperty('Flash2.alpha', 1);
doTweenAlpha('tweenCutOffAlpha', 'Flash2', 0, 0.5, 'linear');
setObjectCamera('Flash2', 'other');   
removeLuaSprite('bg2', true);
removeLuaSprite('nikkup', true);
removeLuaSprite('exe', true);
removeLuaSprite('bg1', true);
removeLuaSprite('bg3', true);
setProperty('bartop.visible',true);
setProperty('barbot.visible',true)
end
end

function onEvent(name, value1, value2)
if name == "Sonic.EXE Cutscene" then
doTweenX("exe", "exe", 480, 6.5, "linear") 		
setProperty('nikkup.alpha', 1);  
setProperty('exe.alpha', 1);  
setProperty('bg2.alpha', 1);  
setProperty('bg3.alpha', 1); 
setProperty('bartop.visible',false);
setProperty('barbot.visible',false)
runTimer('nomeatraparas',1.5);    
runTimer('chau',2);    
end
end

function onBeatHit()
if getProperty('nikkup')  then
setProperty('nikkup.y',270)
		doTweenY('aaaaaaa','nikkup',300,0.5,'sineOut')
		end
if getProperty('exe')  then
setProperty('exe.y',270)
		doTweenY('IamGod','exe',300,0.5,'sineOut')
end
end

function onTimerCompleted(tag, loops, loopsleft)
if tag == 'nomeatraparas' then
setProperty('bg1.x',0)
doTweenX("bg1Tweene", "bg1", -3900, 6, 'linear'); 
end
if tag == 'chau' then
setProperty('bg1.alpha', 1); 
removeLuaSprite('bg2', true)
end
end
