if (obj_player.state != UnknownEnum.Value_15)
    instance_destroy();

image_xscale = obj_player.xscale;
x = obj_player.x;
y = obj_player.y;

if (place_meeting(x, y, obj_forkbox))
{
    with (instance_place(x, y, obj_forkbox))
    {
        with (enemy_inst)
        {
            hitHsp = 25 * obj_player.xscale;
            hitVsp = 0;
            state = UnknownEnum.Value_25;
        }
    }
    
    event_user(0);
}

if (place_meeting(x, y, obj_dart))
{
    with (instance_place(x, y, obj_dart))
    {
        image_xscale *= -1;
        hurtenemy = true;
    }
    
    event_user(0);
}

if (place_meeting(x, y, obj_hipnatuese) && obj_hipnatuese.image_alpha == 1 && global.hardMode)
{
	instance_create(obj_hipnatuese.x, obj_hipnatuese.y, obj_hipnatueseDead)
	global.escape.timer = 750
	global.combo.timer += 10
    instance_destroy(obj_hipnatuese)
    event_user(0);
}

