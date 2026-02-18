FMODSet3dPos(moveSnd, x, y);
eyecolor += 0.5;

if (eyecolor > 255)
    eyecolor = 0;

if (image_alpha == 1)
{
    if (obj_player.x < x)
        hsp -= slow ? 0.15 : 0.3;
    else if (obj_player.x > x)
        hsp += slow ? 0.15 : 0.3;
    
    if (obj_player.y < y)
        vsp -= slow ? 0.15 : 0.3;
    else if (obj_player.y > y)
        vsp += slow ? 0.15 : 0.3;
    
    if (place_meeting(x, y, obj_player))
        room_goto(timesup_room);
}
else
{
    image_alpha = approach(image_alpha, 1, 0.01);
    hsp = 0;
    vsp = 0;
}

if (obj_player.state == UnknownEnum.Value_20 || obj_player.state == UnknownEnum.Value_21 || instance_exists(obj_fadeout) || obj_player.state == -4)
    image_alpha = 0;

vsp = clamp(vsp, -12, 12);
hsp = clamp(hsp, -12, 12);
x += hsp;
y += vsp;
locatorIndex += 0.1;
