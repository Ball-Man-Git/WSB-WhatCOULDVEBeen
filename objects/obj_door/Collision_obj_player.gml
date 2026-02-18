var _transfoPass = [UnknownEnum.Value_38, UnknownEnum.Value_39, UnknownEnum.Value_40, UnknownEnum.Value_42, UnknownEnum.Value_47, UnknownEnum.Value_44, UnknownEnum.Value_45, UnknownEnum.Value_46, UnknownEnum.Value_43, UnknownEnum.Value_50, UnknownEnum.Value_52, UnknownEnum.Value_53];

if (array_contains(_transfoPass, other.state))
    exit;

if (other.grounded && other.key_up && other.state != UnknownEnum.Value_20 && other.state != UnknownEnum.Value_21 && other.state != UnknownEnum.Value_38)
{
    with (other)
    {
        targetRoom = other.targetRoom;
        door = other.targetDoor;
        hallway = false;
        movespeed = 0;
        vsp = 0;
        hsp = 0;
        state = UnknownEnum.Value_20;
        sprite_index = spr_player_lookdoor;
        image_index = 0;
    }
}
