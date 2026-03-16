
hp = 10;
max_hp = 10;
phase = 1;
state = 144;
intro_state = -1; 
intro_timer = 120;
attack_timer = 60;
bash_count = 0;
invincible = true;
stun_timer = 0;
last_attack = 0;
flash = false;


hsp = 0; 
vsp = 0; 
grav = 0.5;
xscale = 1;
image_xscale = 1;
grounded = false;
dark_alpha = 0;
spotlight_radius = 0;
show_ui = false;
hitstun = { is: false, timer: 0 };
depth = 0;


spr_intro = spr_milton_hammertwirl; 
spr_idle = spr_milton_idle;
spr_run = spr_milton_crazyrun; 
spr_jump = spr_milton_jump;
spr_fall = spr_milton_fall;
spr_land = spr_milton_groundpoundrun;
spr_knife = spr_milton_hammerspin;
spr_pot = spr_milton_hammerspin_prep;
spr_steam = spr_milton_mach3hit;
spr_faint = spr_milton_backhurt;

sprite_index = spr_intro;
image_speed = 0.35;
hitstun_surface = -4; 
