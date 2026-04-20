//There's nothing here. Go home.
function scr_naomi_normal(){
{
    get_input();
    hsp = approach(hsp, movespeed * xscale, 0.35);
    var move = key_right + key_left;
    
    if (jumpstop == false && !key_jump && vsp < grav)
    {
        jumpstop = true;
        vsp /= 20;
    }
    
    if (move != 0)
    {
        image_speed = movespeed / 15;
        xscale = move;
        movespeed = 11;
        
        if (grounded)
            sprite_index = spr_naomi_move;
    }
    else
    {
        image_speed = 0.35;
        movespeed = 0;
        
        if (grounded)
            sprite_index = spr_naomi_idle;
    }
    
    if (animation_end() && sprite_index == spr_player_jump)
        sprite_index = spr_player_fall;
    
    if (jumpBuffer && coyote_time && grounded)
    {
        jumpBuffer = false;
        create_particleStatic(spr_jumpeffect, x, y, 1, 1);
        image_index = 0;
        sprite_index = spr_player_jump;
        vsp = -12;
        jumpstop = false;
        FMODevent_oneshot("event:/Sfx/Player/jump", x, y);
    }
}

function scr_naomi_crouch(){

}

function scr_naomi_attack(){

}

function scr_naomi_flying(){

}