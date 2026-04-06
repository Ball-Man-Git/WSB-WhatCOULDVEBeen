with (obj_player)
{
    shake_camera(25);
    state = UnknownEnum.Value_30;
    sprite_index = asset_get_index(string_concat("spr_player_parry", irandom_range(1, 3)))
    create_particleStatic(spr_parryeffect, x, y, 1);
    FMODevent_oneshot("event:/Sfx/Player/parry", x, y);
    image_index = 0;
    movespeed = -6;
    flash = true;
}
