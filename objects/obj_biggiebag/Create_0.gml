event_inherited();
if irandom_range(1, 10) == 10
{
	spr_move = spr_plosher;
spr_turn = spr_plosher_turn;
spr_stun = spr_plosher_stun;
spr_scared = spr_plosher_scared;
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

plosher = false
if spr_move == spr_plosher
plosher = true