target = obj_player;
image_speed = 0.35;


var _miltonSprite = asset_get_index("spr_chargeeffect_milton");
if (instance_exists(obj_mainmenu) && obj_mainmenu.miltonMode && _miltonSprite != -1)
{
    sprite_index = _miltonSprite;
}
else
{
    sprite_index = spr_chargeeffect; 
}


if (target.state == UnknownEnum.Value_4)
{
    x = target.x + (16 * image_xscale);
    y = target.y + 5;
    image_angle = 0;
    image_xscale = target.xscale;
}
else if (target.state == UnknownEnum.Value_19)
{
    x = target.x;
    y = target.y + 32;
    image_angle = -90;
    image_xscale = 1;
}
