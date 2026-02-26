var _rm = hotel_receptionentrance;
if current_month == 6 && current_day == 21
_rm = rm_wwdop
var _dr = "A";

with (obj_player)
{
    generalReset();
    targetRoom = _rm;
    door = _dr;
    movespeed = 0;
    vsp = 0;
    hsp = 0;
    state = UnknownEnum.Value_20;
	ini_open(global.saveFile);
	palIndex = ini_read_real("Game", "Palette", 1);
	ini_close();
}

global.level = -4;
global.resetRoom = _rm;

if (!instance_exists(obj_fadeout))
    instance_create(0, 0, obj_fadeout);
