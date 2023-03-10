local xx = -100; --750
local yy = 930; --750
local xx2 = 200; --1500
local yy2 = 930; --750
local ofs = 15;
local followchars = true;
local del = 0;
local del2 = 0;
local damage = false;
local beating = true;
local beat_skip = 0;

function onCreatePost()
    triggerEvent('Camera Follow Pos',xx,yy)
end

function onCreate()
	--background boi
	
	makeLuaSprite('floor','Mira/glasses', -1500, -100)
	makeLuaSprite('sky','Mira/bg sky', -1650, -200)
	makeLuaSprite('what is this','Mira/what is this', -300, 0)
	makeLuaSprite('front pot','Mira/front pot', -1300, 1250)
	setScrollFactor('front pot', 0.9, 0.9);
	makeLuaSprite('lmao','Mira/lmao', -1050, 650)
	
	makeAnimatedLuaSprite('vines','Mira/vines', -1200, -600)
	addAnimationByPrefix('vines','loop','green',24,true)
    objectPlayAnimation('vines','loop',true);
	setScrollFactor('vines', 0.9, 0.9);
	

    makeAnimatedLuaSprite('grey','Backgroundbois', -750, 600)
	addAnimationByPrefix('grey','loop','grey',24,false)
    objectPlayAnimation('grey','loop',false);
	
	makeAnimatedLuaSprite('coral','Backgroundbois', 400, 600)
	addAnimationByPrefix('coral','loop','corhal',24,false)
    objectPlayAnimation('coral','loop',false);
	
	makeAnimatedLuaSprite('flowerguy','Backgroundbois', -1200, 600)
	addAnimationByPrefix('flowerguy','loop','flowerguy',24,false)
    objectPlayAnimation('flowerguy','loop',false);
	setScrollFactor('flowerguy', 0.9, 0.9);
	
	makeAnimatedLuaSprite('righthandman','Backgroundbois', 800, 800)
	addAnimationByPrefix('righthandman','loop','righthandman',24,false)
    objectPlayAnimation('righthandman','loop',false);
	setScrollFactor('righthandman', 0.9, 0.9);

    addLuaSprite('sky')
	addLuaSprite('floor')
	addLuaSprite('grey')
	addLuaSprite('coral')
	addLuaSprite('what is this')
	addLuaSprite('lmao')
	
	
	
	addLuaSprite('flowerguy', true)
	addLuaSprite('righthandman', true)
	addLuaSprite('front pot', true)
	addLuaSprite('vines', true)
	

	
	
end

function onBeatHit()
    if curBeat % 1 == 0 then
		 playAnim('flowerguy','loop', true);
	end
    if curBeat % 2 == 0 then
	     playAnim('grey','loop', true);
		 playAnim('righthandman','loop', true);
		 playAnim('coral','loop', true);
	end
	if curBeat % 4 == 0 then
		if beating == true then
	        triggerEvent('Add Camera Zoom', 0.02, 0.02)
		end
	end
end



function onUpdate()
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
			if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
			end

        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
			if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
			end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    
end


function opponentNoteHit()
	
    health = getProperty('health')
    if damage == true then
        if getProperty('health') > 0.4 then
            setProperty('health', health- 0.02);
		end
    end
end

