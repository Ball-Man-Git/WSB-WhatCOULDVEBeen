event_inherited();
spr_move = spr_doug_walk;
spr_turn = spr_doug_turn;
spr_stun = spr_doug_stun;
spr_scared = spr_doug_scared;
spr_dead = spr_doug_dead;
hitbox = true;
hitboxInst = -4;
if global.level == "crashout"
{
spr_move = spr_kibidi_walk;
spr_turn = spr_doug_turn;
spr_stun = spr_kibidi_stun;
spr_scared = spr_kibidi_scared;
spr_dead = spr_kibidi_dead;
}