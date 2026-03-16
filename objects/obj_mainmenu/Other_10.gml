var _rm = hotel_outside;
if (current_month == 6 && current_day == 21) _rm = rm_wwdop;
var _dr = (_rm == hotel_outside) ? "B" : "A";

with (obj_player)
{
    generalReset();
    targetRoom = _rm;
    door = _dr;
    
    //if (other.miltonMode) 
    //{
        //character = UnknownEnum.Value_1; 
        //isMilton = true;
        //isMildred = false;
        //sprites = get_characterspr(UnknownEnum.Value_1);
        //global.patternSpr = spr_playerPat_miltonTears;
    //}
    //else 
    //{
        //character = UnknownEnum.Value_0; 
        //isMilton = false;
        //isMildred = true;
        //sprites = get_characterspr(UnknownEnum.Value_0);
        //global.patternSpr = spr_playerPat_threads;
    //}

    state = UnknownEnum.Value_20;
    ini_open(global.saveFile);
    palIndex = ini_read_real("Game", "Palette", 1);
    ini_close();
}

global.level = -4;
global.resetRoom = _rm;

if (!instance_exists(obj_fadeout))
    instance_create(0, 0, obj_fadeout);
