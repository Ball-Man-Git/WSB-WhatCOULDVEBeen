spr_idle = spr_pumpkinstein_idle;       
spr_alert = spr_tutorialBlock; 
spr_chase = spr_tutorialBlock; 
spr_dig = spr_tutorialBlock; 

state = UnknownEnum.Value_0; 
movespeed = 0;
depth = -10;

hitstun = { is: false, time: 0, X: x, Y: y };

if (ds_list_find_index(global.saveroom, id) != -1) 
    instance_destroy();