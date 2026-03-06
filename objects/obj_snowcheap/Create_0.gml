event_inherited();
spr_move = spr_crab_stun;
spr_stun = spr_crab_stun;
spr_dead = spr_crab_dead;

state = UnknownEnum.Value_0;
substate = 0;
hitstun = { x: x, y: y, time: 0, is: false };

grav = 0.25;
jump_vsp = -14;
jump_hsp = 2;
air_dir = 1;
timer = 0;

image_speed = 0.35;
image_blend = make_color_rgb(100, 150, 255);