instance_create(x, y, obj_technicaldifficulty);

with (obj_player)
{
    state = UnknownEnum.Value_27;
    targetDoor = "A"; 
    room_goto(room); 
}

instance_destroy();