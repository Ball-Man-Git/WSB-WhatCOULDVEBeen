event_inherited();
var sprites = global.PlayerCharacters[obj_player.character].sprites.tv;
tv_anim(sprites.collect, 180);
global.combo.timer = 60;

with (obj_player)
{
    if (chance(0.25))
        fmod_studio_event_instance_start(soundsLaugh);
}

spr_idle = spr_magician_idle;
spr_walk = spr_magician_move;
spr_panicidle = spr_magician_idle;
spr_intro = spr_magician_intro;
spr_taunt = spr_magician_taunt;
sprite_index = spr_intro;
image_index = 0;
