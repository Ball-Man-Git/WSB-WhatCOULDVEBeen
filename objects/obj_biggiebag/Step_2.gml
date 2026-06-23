if (hitstun.is == false)
{
    event_inherited();
    
    switch (state)
    {
        case UnknownEnum.Value_11:
            scr_enemy_stun();
            break;
        
        case UnknownEnum.Value_10:
            scr_enemy_hit();
            break;
        
        case UnknownEnum.Value_8:
            scr_enemy_turn();
            break;
        
        case UnknownEnum.Value_9:
            scr_enemy_move();
            break;
        
        case UnknownEnum.Value_22:
            scr_enemy_grabbed();
            break;
        
        case UnknownEnum.Value_25:
            scr_enemy_thrown();
            break;
    }
		hitbox = (UnknownEnum.Value_9 || state == UnknownEnum.Value_8) && plosher
	if hitbox == true
	{
		if !instance_exists(hitboxInst)
		{
			hitboxInst = instance_create(x, y, obj_forkbox)
			with hitboxInst
				enemy_inst = other
		}
	}
	else {
		if instance_exists(hitboxInst)
		{
			instance_destroy(hitboxInst)
			hitboxInst = noone
		}
	}
}
else
{
	if (hitstun.time >= 0)
{
    image_speed = 0;
    x = hitstun.x + irandom_range(-5, 5);
    y = hitstun.y + irandom_range(-5, 5);
    hitstun.time--;
}
else
{
    x = hitstun.x;
    y = hitstun.y;
    hitstun.is = false;
}
}