roomname = string_letters(room_get_name(room));
var _darkRooms = string_pos("castle", roomname) > 0;
dark = _darkRooms;


var _drain = false;
if (instance_exists(obj_player) && variable_instance_exists(obj_player, "glow_drain"))
{
    _drain = obj_player.glow_drain;
}

if (_drain)
{
    circleSize = approach(circleSize, 0, 12); 
}
else 
{
    var follow_count = instance_number(obj_pumpkinfollow);
    circleSize = approach(circleSize, follow_count * 64, 5);
}
