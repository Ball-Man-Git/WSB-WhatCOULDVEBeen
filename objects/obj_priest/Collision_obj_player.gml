var _transfoPass = [UnknownEnum.Value_38, UnknownEnum.Value_39, UnknownEnum.Value_40, UnknownEnum.Value_42, UnknownEnum.Value_47, UnknownEnum.Value_44, UnknownEnum.Value_45, UnknownEnum.Value_46, UnknownEnum.Value_43, UnknownEnum.Value_50, UnknownEnum.Value_52, UnknownEnum.Value_53];

if other.hasSpray
{
	other.hasSpray = false
	if other.sprite_index = spr_ernie_runwithspray
	other.sprite_index = spr_ernie_run
	sprite_index = spr_priest_pray;
alarm[0] = 250;
}

if (!array_contains(_transfoPass, other.state))
    exit;

if (other.key_attack)
{
    other.state = UnknownEnum.Value_3;
    other.sprite = spr_player_mach2;
}
else
{
    other.state = UnknownEnum.Value_0;
    other.sprite_index = spr_player_idle;
}

sprite_index = spr_priest_pray;
alarm[0] = 250;
