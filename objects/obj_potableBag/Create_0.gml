event_inherited();
global.collect += 1000;
global.combo.timer = 60;
global.toppins.bag = true;
create_smalltext(1000);
FMODevent_oneshot("event:/Sfx/General/Collects/toppinget", x, y);
var sprites = global.PlayerCharacters[obj_player.character].sprites.tv;
var naomi = obj_player.isNaomi
tv_anim(naomi ? spr_tv_happyN : sprites.collect, 180);

with (obj_player)
{
    if (chance(0.25))
        fmod_studio_event_instance_start(soundsLaugh);
}

spr_idle = spr_potablebag_idle;
spr_walk = spr_potablebag_walk;
spr_panicidle = spr_potablebag_idle;
spr_intro = spr_potablebag_intro;
spr_taunt = spr_potablebag_taunt;

if obj_player.isMilton
{
	spr_idle = spr_miltoppin4_idle;
spr_walk = spr_miltoppin4_idle;
spr_panicidle = spr_miltoppin4_idle;
spr_intro = spr_potablebag_intro;
spr_taunt = spr_miltoppin4_idle;
}
sprite_index = spr_intro;
image_index = 0;
