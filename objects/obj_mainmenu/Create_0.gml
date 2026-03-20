// --- 1. CORE INITIALIZATION ---
obj_player.state = -4;
miltonMode = false;        
glitchTimer = 0;           
miltonTransition = false;  
staticIndex = 0;           
driveX = 720; 
driveY = 460;

// --- 2. MENU STATE ---
roomPaletteIndex = 0;
scene = -2;
menuscale = 0;
moviefade = 255;
moviefadeC = make_color_rgb(moviefade, moviefade, moviefade);
dark = true;
title_timer = 0;
saveFiles = [];

// --- 3. SAVE FILE CONSTRUCTOR (THE ID SCRAPER HIJACK) ---
createSave = function(arg0) constructor
{
    file = arg0;
    savePath = working_directory + string("/saves/save{0}.ini", arg0 + 1);
    movie = {};
    
    // Position Logic
    switch (arg0)
    {
        default: movie.x = 374; movie.y = 362; break;
        case 1:  movie.x = 272; movie.y = 369; break;
        case 2:  movie.x = 168; movie.y = 376; break;
        case 3:  movie.x = 60;  movie.y = 383; break;
    }
    
    movie.saveX = movie.x;
    movie.saveY = movie.y;
    movie.index = arg0;
    movie.alpha = 1;
    movie.scale = 1;
    
    ini_open(savePath);
    created = ini_read_real("General", "created", false);
    
    // --- MILTON ID RECALL ---
    // We grab the scrambled string and un-scramble it into the list
    // This is what makes Lester remember your 5/15 tickets!
    var _miltonData = ini_read_string("Potables", "confirmed_list", "");
    
    // If this slot is currently selected, we fill the global list for the Lobby
    if (instance_exists(obj_mainmenu) && obj_mainmenu.selectedFile == arg0)
    {
        ds_list_clear(global.confirmed_ids);
        if (_miltonData != "") ds_list_read(global.confirmed_ids, _miltonData);
        global.potables_total = ds_list_size(global.confirmed_ids);
    }

    // --- STANDARD COMPLETION CALC ---
    var _completionNum = 0;
    var _levels = ["forest", "shell", "beach", "kingdom", "castle", "market", "liminal", "spy", "carnival"];
    var _countTotems = (ini_read_real("General", "Totem0", false) == true) + (ini_read_real("General", "Totem1", false) == true) + (ini_read_real("General", "Totem2", false) == true);
    _completionNum += _countTotems;
    
    for (var i = 0; i < array_length(_levels); i++)
    {
        var _n = 0;
        var _rank = ini_read_string(_levels[i], "Rank", "D");
        switch (_rank)
        {
            case "D": _n = 0; break;
            case "C": _n = 1; break;
            case "B": _n = 2; break;
            case "A": _n = 3; break;
            case "S": _n = 4; break;
            case "P": _n = 5; break;
        }
        _completionNum += _n;
    }
    ini_close();

    var _finalNum = (array_length(_levels) * 5) + 3;
    completion = (_completionNum / _finalNum) * 100;
    
    // FACE SELECTION
    var _faceSpr = (instance_exists(obj_mainmenu) && obj_mainmenu.miltonMode) ? spr_player_idle : spr_mainmenu_tomatoface;
    faceIndex = (round(completion) / 100) * (sprite_get_number(_faceSpr) - 1);
    faceAlpha = 0;
};


selectedFile = 0; 
array_push(saveFiles, new createSave(0));
array_push(saveFiles, new createSave(1));
array_push(saveFiles, new createSave(2));
array_push(saveFiles, new createSave(3));


hudAlpha = 0;
percentageReal = 0;
percentage = 0;
music = FMODcreate_event("event:/Music/General/mainmenu");
TVsprite = spr_mainmenu_tv;
TVindex = 0;
TVsnd = FMODcreate_event("event:/Sfx/UI/Mainmenu/static");
depth = -300;
created = false;

for (var i = 0; i < array_length(saveFiles); i++)
{
    if (saveFiles[i].created) created = true;
}

bg_frame = 0;
dark_frame = 0;
bg_speed = 0.4;
dark_speed = 0.4;
title_x = 60;
title_y = 0;
title_alpha = 1;
corner_alpha = 1;

corner_x = obj_screensizer.displayWidth - 80;
corner_y = obj_screensizer.displayHeight - 80;
