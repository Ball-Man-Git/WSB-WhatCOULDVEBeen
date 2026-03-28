event_inherited();


var _save_num = (variable_global_exists("current_save")) ? global.current_save : 1;
filename = "save" + string(_save_num) + ".ini";
if (variable_global_exists("saveFile")) filename = global.saveFile;


ini_open(filename);
var _marker = ini_read_real("Markers", "w1lester", 0);
ini_close();


if (_marker >= 1) {
    global.level_gate_unlocked = true;
    instance_destroy(); 
    exit; 
}


state = 0; 
needed = 15;
image_speed = 0.35;
BGX = 0;
BGY = 0;
text = "";
borderTargetpos = -160;
borderY = borderTargetpos;
borderX = 32;
borderscaleYmult = 1;
borderVsp = 0;
borderpart = 0;
rescaled = false;
surf = -4;
triggered_by_bump = false;
bump_timer = 0;
waitTimer = -1; 


snd_voice = FMODcreate_event("event:/Sfx/Player/yay");
spr_idle = spr_lester_idle;
spr_talk = spr_flotalk;
spr_snap = spr_genericpoofeffect; 
spr_die  = spr_bacon1_idle; 
spr_lesterbox = spr_flobox; 


spr_escape_idle = spr_bacon1_idle; 
spr_escape_talk = spr_ballofbeer;
spr_escape_die  = spr_genericpoofeffect;

depth = 90;
myTimer = 0;
_total_potables = 0; 
