if (animation_end() && sprite_index == spr_stickcollect_billlargestack_open)
{
    image_index = 0;
    sprite_index = spr_stickcollect_billlargestack_end;
}
else if (animation_end() && sprite_index == spr_stickcollect_billlargestack_end)
{
    image_speed = 0;
    image_index = image_number - 1;
}

var _transfoPass = [UnknownEnum.Value_41, UnknownEnum.Value_42, UnknownEnum.Value_47, UnknownEnum.Value_44, UnknownEnum.Value_45, UnknownEnum.Value_46, UnknownEnum.Value_43];

if (array_contains(_transfoPass, obj_player.state) || obj_player.hasSpray)
    canGive = false;
else
    canGive = true;
