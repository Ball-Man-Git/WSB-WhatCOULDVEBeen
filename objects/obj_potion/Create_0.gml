// Inherit the parent event
event_inherited();

spr_idle = spr_doug_walk;       
spr_wobble = spr_doug_turn;     
spr_fall = spr_doug_stun;       
spr_splash = spr_genericpoofeffect; 

spr_move = spr_crab_move; 
spr_puddle_jump = spr_crab_roll; 
spr_stun = spr_crab_stun;
spr_dead = spr_crab_dead;
spr_scared = spr_crab_scared;

state = UnknownEnum.Value_0; 
substate = 0; 
invincable = true; 
grav = 0.5;
vsp = 0;
hsp = 0;
grounded = false;
movespeed = 0;
image_blend = c_gray; 

hitstun = { is: false, time: 0, X: x, Y: y };