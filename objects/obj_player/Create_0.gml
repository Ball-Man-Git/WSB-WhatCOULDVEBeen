
vsp = 0;
hsp = 0;
movespeed = 0;
verticalMovespeed = 0;
state = UnknownEnum.Value_0;
xscale = 1;
image_speed = 0.35;


hitstun = { x: x, y: y, time: 0, is: false };
buffers = { 
    step: 0, 
    bigdashcloud: 0, 
    idle: 180, 
    afterimageMach: 0, 
    afterimageBlur: 0, 
    dashcloud: 0, 
    crazyothereffect: 0, 
    breakdanceheld: 0, 
    notes: 0, 
    hammer: 0 
};
tauntVars = { 
    sprite_index: sprite_index, 
    image_index: image_index, 
    state: state, 
    vsp: vsp, 
    hsp: hsp, 
    movespeed: movespeed, 
    image_speed: image_speed 
};


if (!variable_global_exists("saveroom"))
{
    global.saveroom = ds_list_create();
    global.escaperoom = ds_list_create();
    global.followers = ds_list_create();
    global.collected_potables = ds_list_create();
    global.potables_total = 0;
    global.level_gate_unlocked = false; 

    global.collect = 0;
    global.secretCount = 0;
    global.treasure = false;
    global.resetRoom = -4;
    global.pumpkins = { count: 0, amount: 12, activeStein: false };
    global.patternSpr = spr_playerPat_threads;
    global.escape = { active: false, timer: 7200, party: false };
    global.combo = { dropped: false, amt: 0, timer: 60, previouscombo: 0, savecombo: 0, highest: 0 };
    global.toppins = { bean: false, cup: false, lime: false, bag: false, orange: false };
    global.level_timer = 0;
    global.save_timer = 0;
    global.debug = false;
    global.level = -4;
    global.key = false;
}


generalReset(); 
pal_swap_init_system(shd_pal_swapper);


isMildred = true;
isMilton = false;
isErnie = false;
isJuan = false;

global.PlayerCharacters = [];
global.PlayerCharacters[0] = {
    initials: "B",
    name: "Mildred",
    sprites: get_characterspr(UnknownEnum.Value_0),
    patColors: spr_playerPatColors,
    playerPal: spr_playerPal,
    patternSpr: spr_playerPat_threads,
    usesPlaceholderMusic: false
};
global.PlayerCharacters[1] = {
    initials: "T",
    name: "Milton",
    sprites: get_characterspr(UnknownEnum.Value_1),
    patColors: spr_miltonPatColors,
    playerPal: spr_miltonPal,
    patternSpr: spr_playerPat_miltonTears,
    usesPlaceholderMusic: false
};
global.PlayerCharacters[2] = {
    initials: "E",
    name: "Ernie",
    sprites: get_characterspr(UnknownEnum.Value_2),
    patColors: spr_erniePatColors,
    playerPal: spr_erniePal,
    patternSpr: spr_erniePat,
    usesPlaceholderMusic: true
};

character = UnknownEnum.Value_0;
sprites = get_characterspr(UnknownEnum.Value_0);
depth = 0;
scr_collision_init();
grav = 0.5;
spr_palette = spr_playerPal;
palIndex = 1;
jumpstop = false;
door = "A";


onIce = false;
onSnow = false;
xscaleMulti = 1;
yscaleMulti = 1;
poletreeID = -4;
chargeeffect = -4;
breakdancespeed = 0;
breakdanceID = -4;
jumpBuffer = false;
slapBuffer = false;
flash = false;
rainbow = 0;
super = false;


soundsOk = FMODcreate_event("event:/Sfx/Player/yeag");
soundsLaugh = FMODcreate_event("event:/Sfx/Player/yay");
soundsHurt = FMODcreate_event("event:/Sfx/Player/gaey");
soundsMach = FMODcreate_event("event:/Sfx/Player/mach");
soundsSuperjump = FMODcreate_event("event:/Sfx/Player/superjump");
soundsRoll = FMODcreate_event("event:/Sfx/Player/tumble");
soundsGroundpound = FMODcreate_event("event:/Sfx/Player/groundpound");
soundGrab = FMODcreate_event("event:/Sfx/Player/dash");
soundsHammer = FMODcreate_event("event:/Sfx/Player/hammerattack");
soundsHammerAir = FMODcreate_event("event:/Sfx/Player/hammerair");
soundsSkateboard = FMODcreate_event("event:/Sfx/Player/Transformations/Skateboard/move");
soundsSkateAim = FMODcreate_event("event:/Sfx/Player/Transformations/Skateboard/aim");

speedlineseffect = -4;
roomstartX = x;
roomstartY = y;
hallway = false;
hallwayDirection = xscale;
instakill = false;
tauntTimer = 0;
freefallsmash = -4;
crouchslip = 0;
wallgrab = 0;
enemyID = -4;
i_frame = 0;
coyote_time = 0;
mach4mode = false;
movespeedSurfing = 0;
diveboardSaved = { movespeed: movespeed, state: state, sprite_index: sprite_index, image_index: image_index, y: y };
backtohubRoom = room;
backtohubX = x;
backtohubY = y;
prevOnSlope = false;
onSlope = false;
slopeObj = -4;
wasRamp = false;
aimTime = 0;
canHit = true;
sprayCans = 4;
supertaunt = 0;
canSupertaunt = false;
squashX = 1;
squashY = 1;
freefalling = 0;
get_input();
alarm[1] = irandom_range(5, 15);
hasSpray = false;
prev_g_room = 0;
tvsprites = noone;
glow_drain = false;

if (!variable_global_exists("saveroom"))
{
    global.saveroom = ds_list_create();
    global.escaperoom = ds_list_create();
    global.followers = ds_list_create();
    
  
    global.temp_potables = ds_list_create(); 

    global.collected_potables = ds_list_create();

}
