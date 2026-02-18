if !showFmod
{
with instance_create(obj_screensizer.displayWidth / 2, obj_screensizer.displayHeight / 2, obj_explosion)
{
	depth = -900
	image_xscale = 3.5
	image_yscale = 3.5
}
FMODevent_oneshot("event:/Sfx/Player/slam", obj_screensizer.displayWidth / 2, obj_screensizer.displayHeight / 2);
FMODevent_oneshot("event:/Sfx/Player/scream", obj_screensizer.displayWidth / 2, obj_screensizer.displayHeight / 2);
alarm[1] = 180
alarm[2] = 240 / 3
showHeart = false
showTu = true
    var i = 0;
    
    repeat (sprite_get_number(spr_intro_logo_heartDebris))
    {
            with (instance_create(obj_screensizer.displayWidth / 2, obj_screensizer.displayHeight / 2, obj_baddiedead))
			{
				depth = -1000
        sprite_index = spr_intro_logo_heartDebris;
		image_index = i
		hsp = irandom_range(-8, 8)
			}
        i++;
    }
}