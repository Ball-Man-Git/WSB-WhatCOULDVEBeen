if (hitstun.is == false)
{
    scr_collision();
    if (instance_exists(obj_player)) targetplayer = obj_player.id;
    image_xscale = xscale;


    if (hp <= 5 && phase == 1) {
        phase = 2; state = 11;
        sprite_index = spr_steam;
        fmod_studio_event_instance_start(obj_player.soundsLaugh); 
        instance_create(x, y, obj_boss_defeatflash);
    }

    switch (state)
    {
        case 144: 
            hsp = 0;
            if (instance_exists(obj_player)) obj_player.state = -4; 

            if (intro_state == -1 && !instance_exists(obj_boss_gateform)) intro_state = 0;
            
            dark_alpha = approach(dark_alpha, 0.8, 0.05);
            if (intro_state == 0 && --intro_timer <= 0) intro_state = 1;
            
            if (intro_state == 1) {
                spotlight_radius = approach(spotlight_radius, 250, 15);
                if (spotlight_radius >= 250) {
                    intro_state = 2;
                    instance_create(x, y, obj_boss_announcement);
                 
                    with(obj_lester_referee) state = 1; 
                }
            }
            
            if (intro_state == 2 && !instance_exists(obj_boss_announcement)) {
                state = 0; show_ui = true; dark_alpha = 0; spotlight_radius = 0;
                if (instance_exists(obj_player)) obj_player.state = 0;
                invincible = false;
            }
            break;

        case 0: 
            hsp = 0; sprite_index = spr_idle;
            if (attack_timer > 0) attack_timer--;
            else {
                state = (last_attack == 1 || last_attack == 4) ? choose(2, 3) : choose(1, 4);
                last_attack = state;
                bash_count = 0;
                attack_timer = (phase == 2 ? 30 : 60);
                xscale = (obj_player.x > x) ? 1 : -1;
            }
            break;

        case 1: 
            hsp = xscale * (phase == 2 ? 18 : 12);
            sprite_index = spr_run;
            if (floor(image_index) % 3 == 0) {
                create_miltonAfterimage(sprite_index, image_index, x, y, xscale);
                instance_create(x, y, obj_chargeeffect);
            }
     
            if (instance_exists(obj_player) && sign(obj_player.x - x) != xscale && bash_count < 6) {
                hsp = 0; xscale = sign(obj_player.x - x);
                bash_count++;
                fmod_studio_event_instance_start(obj_player.soundsMach);
            }
            if (place_meeting(x + hsp, y, obj_player)) with(obj_player) scr_player_hurt(id);
            if (place_meeting(x + hsp, y, obj_solid) && bash_count >= 6) {
                state = 11; sprite_index = spr_faint;
                vsp = -8; hsp = -xscale * 5;
                stun_timer = 60; 
                fmod_studio_event_instance_start(obj_player.soundsHurt);
            }
            break;

        case 11: 
            hsp = approach(hsp, 0, 0.2);
            if (stun_timer > 0) stun_timer--;
            var _m = instance_place(x, y, obj_player);
            if (_m != -4 && _m.instakill == true && !invincible) {
                hp--; invincible = true; stun_timer = 0;
                fmod_studio_event_instance_start(obj_player.soundsHurt);
            }
            if (grounded && vsp >= 0) {
                if (hp <= 0) state = 98; 
                else if (stun_timer <= 0 || invincible) { state = 0; invincible = false; }
            }
            break;
            
        case 98: 
            hsp = 0;
            if (sprite_index != spr_faint) {
                sprite_index = spr_faint;
                with (obj_lester_referee) state = 3; 
            }
            break;
    }
}
