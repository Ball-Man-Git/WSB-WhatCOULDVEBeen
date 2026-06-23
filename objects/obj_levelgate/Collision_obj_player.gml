var _rm = targetRoom;
var _dr = "A";
var titlecardSpr = lang_get_asset(string_concat("spr_titlecard", titlecardName));
var titlecardNamesprite = lang_get_asset(string_concat("spr_titlecard", titlecardName, "Title1"));
var titlecardNamesprite2 = lang_get_asset(string_concat("spr_titlecard", titlecardName, "Title2"));
var titlecardMus = titlecardMusic

var _curtain_open_placeholder = spr_genericpoofeffect; 
var _curtain = instance_place(x, y, obj_gate_curtain);
var _curGate = instance_place(x, y, obj_levelgate);
var _locked = (_curtain != noone && _curtain.sprite_index != _curtain_open_placeholder);

if (!_locked)
{
    if (other.grounded && other.key_up && other.state != UnknownEnum.Value_20 && other.state != UnknownEnum.Value_21)
    {
        with (other)
        {
            hallway = false;
            movespeed = 0;
            vsp = 0;
            hsp = 0;
            state = UnknownEnum.Value_20;
            sprite_index = spr_player_entergate;
            image_index = 0;
            targetRoom = _rm;
            door = _dr;
            backtohubRoom = room;
            backtohubX = x;
            backtohubY = y;
        }
        
        with (obj_music)
            stop_music();
    }
}

with (other)
{
    if (image_index == (image_number - 1) && sprite_index == spr_player_entergate && !instance_exists(obj_fadeout))
    {
        state = UnknownEnum.Value_20;
        sprite_index = spr_player_entergate;
        image_index = image_number - 1;
        generalReset();
        global.level = other.level;
        global.resetRoom = _rm;
        
        if (global.level == "tutorial")
        {
            if (!instance_exists(obj_fadeout))
                instance_create(x, y, obj_fadeout);
        }
        else if (!instance_exists(obj_titlecard))
        {
            with instance_create(0, 0, obj_titlecard)
			{
			titlecardSprite = titlecardSpr
			titlecardName.sprite = titlecardNamesprite
			titlecardName.sprite2 = titlecardNamesprite2
			titlecardMusic = titlecardMus
			}
        }
    }
}
