if (canGive == false)
    sprite_index = spr_spraycannone;
else
    sprite_index = spr_spraycan;

var _transfoPass = [UnknownEnum.Value_41, UnknownEnum.Value_42, UnknownEnum.Value_47, UnknownEnum.Value_44, UnknownEnum.Value_45, UnknownEnum.Value_46, UnknownEnum.Value_43];

if (array_contains(_transfoPass, obj_player.state) || obj_player.hasSpray)
    canGive = false;
else
    canGive = true;
