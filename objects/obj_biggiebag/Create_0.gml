event_inherited();
if global.hardMode
{
	spr_move = spr_biggiebag;
spr_turn = spr_biggiebag_turn;
spr_stun = spr_plosher_stun;
spr_scared = spr_biggiebag_scared;
spr_dead = spr_plosher_dead;
alarm[1] = 10
}
else
{
spr_move = spr_biggiebag;
spr_turn = spr_biggiebag_turn;
spr_stun = spr_biggiebag_stun;
spr_scared = spr_biggiebag_scared;
spr_dead = spr_biggiebag_dead;
}
hitbox = false
hitboxInst = noone
