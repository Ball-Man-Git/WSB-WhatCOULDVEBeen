

onIce = false;
onSnow = false;

if (FMODevent_isplaying(soundsOk))
    FMODSet3dPos(soundsOk, x, y);

if (FMODevent_isplaying(soundsLaugh))
    FMODSet3dPos(soundsLaugh, x, y);

var _insta = sprite_index == spr_milton_dive || state == UnknownEnum.Value_48 || state == UnknownEnum.Value_4 || state == UnknownEnum.Value_42 || state == UnknownEnum.Value_46 || state == UnknownEnum.Value_45 || state == UnknownEnum.Value_43 || state == UnknownEnum.Value_36 || (state == UnknownEnum.Value_6 && sprite_index == sprites.mach3turn) || state == UnknownEnum.Value_13 || state == UnknownEnum.Value_26 || state == UnknownEnum.Value_19 || state == UnknownEnum.Value_18 || state == UnknownEnum.Value_29 || state == UnknownEnum.Value_38 || state == UnknownEnum.Value_39 || state == UnknownEnum.Value_40;
instakill = _insta;

if (hitstun.is == false)
{
    if (!instance_exists(obj_technicaldifficulty) && obj_player.state != UnknownEnum.Value_20 && obj_player.state != UnknownEnum.Value_41 && obj_player.state != UnknownEnum.Value_21 && !instance_exists(obj_fadeout) && obj_player.state != -4)
        global.combo.timer = approach(global.combo.timer, 0, 0.15);
    
    if (global.combo.previouscombo != global.combo.amt)
    {
        global.combo.previouscombo = global.combo.amt;
        
        if (global.combo.amt > 0 && (global.combo.amt % 5) == 0)
        {
            instance_destroy(obj_comboTitle);
            
            with (instance_create(811, 350, obj_comboTitle))
            {
                combo = floor(global.combo.amt / 5);
                
                if (floor(global.combo.amt / 5) > 15)
                    very = true;
                
                combo = wrap(combo, 0, 14);
                image_index = self.getProper(combo);
            }
            
            FMODevent_oneshot("event:/Sfx/UI/Combo/comboup");
        }
    }
    
    if (global.combo.timer == 0 && global.combo.amt > 0)
    {
        global.combo.savecombo = global.combo.amt;
        
        if (global.combo.savecombo > global.combo.highest)
            global.combo.highest = global.combo.savecombo;
        
        global.combo.amt = 0;
        
        if (!instance_exists(obj_rank))
        {
            if (!global.combo.dropped)
                FMODevent_oneshot("event:/Sfx/UI/Combo/prankfail");
            
            global.combo.dropped = true;
            FMODevent_oneshot("event:/Sfx/UI/Combo/comboend");
            instance_destroy(obj_comboTitle);
            
            with (instance_create(811, 350, obj_comboTitle))
            {
                combo = floor(global.combo.savecombo / 5);
                
                if (floor(global.combo.savecombo / 5) > 15)
                    very = true;
                
                lostcombo = true;
                combo = wrap(combo, 0, 14);
                image_index = self.getProper(combo);
                points = 10 * global.combo.savecombo;
                global.collect += points;
            }
        }
    }
    
    scr_collision();
    scr_collide_destructibles();
    
    if (grounded)
        coyote_time = 10;
    else if (vsp < 0)
        coyote_time = 0;
    
    coyote_time--;
    
    if (state != UnknownEnum.Value_27)
        i_frame = approach(i_frame, 0, 1);
    
    if (i_frame > 0 && state != UnknownEnum.Value_27)
        image_alpha = round(wave(0, 1, 0.1, 0));
    else
        image_alpha = 1;
    
    if (state == UnknownEnum.Value_21)
        image_blend = make_colour_hsv(0, 0, (image_index / image_number) * 255);
    else
        image_blend = make_colour_hsv(0, 0, 255);
    
    if (flash == true && alarm[0] <= 0)
        alarm[0] = 5;
    
    if (y < -500 || (y > (room_height + 500) && state != -4 && !instance_exists(obj_fadeout)))
    {
        if (!instance_exists(obj_technicaldifficulty))
        {
            instance_create(x, y, obj_technicaldifficulty);
            shake_camera(25);
            FMODevent_oneshot("event:/Sfx/Player/slam", x, y);
        }
    }
    
    switch (state)
    {
        case UnknownEnum.Value_0:
            scr_player_normal();
            break;
        
        case UnknownEnum.Value_2:
            scr_player_jump();
            break;
        
        case UnknownEnum.Value_1:
            scr_player_crouch();
            break;
        
        case UnknownEnum.Value_3:
            scr_player_mach2();
            break;
        
        case UnknownEnum.Value_5:
            scr_player_machslide();
            break;
        
        case UnknownEnum.Value_4:
            scr_player_mach3();
            break;
        
        case UnknownEnum.Value_6:
            scr_player_machturn();
            break;
        
        case UnknownEnum.Value_7:
            scr_player_hitwall();
            break;
        
        case UnknownEnum.Value_12:
            scr_player_superjumpprep();
            break;
        
        case UnknownEnum.Value_13:
            scr_player_superjump();
            break;
        
        case UnknownEnum.Value_14:
            scr_player_freefallland();
            break;
        
        case UnknownEnum.Value_15:
            scr_player_taunt();
            break;
        
        case UnknownEnum.Value_16:
            scr_player_tumble();
            break;
        
        case UnknownEnum.Value_17:
            scr_player_climbwall();
            break;
        
        case UnknownEnum.Value_19:
            scr_player_groundpound();
            break;
        
        case UnknownEnum.Value_18:
            scr_player_groundpoundstart();
            break;
        
        case UnknownEnum.Value_20:
            scr_player_enterdoor();
            break;
        
        case UnknownEnum.Value_22:
            scr_player_grab();
            break;
        
        case UnknownEnum.Value_23:
            scr_player_hauling();
            break;
        
        case UnknownEnum.Value_24:
            scr_player_finishingblow();
            break;
        
        case UnknownEnum.Value_26:
            scr_player_uppercut();
            break;
        
        case UnknownEnum.Value_27:
            scr_player_hurt();
            break;
        
        case UnknownEnum.Value_28:
            scr_player_ladder();
            break;
        
        case UnknownEnum.Value_29:
            scr_player_buzzsaw();
            break;
        
        case UnknownEnum.Value_21:
            scr_player_walkfront();
            break;
        
        case UnknownEnum.Value_30:
            scr_player_parry();
            break;
        
        case UnknownEnum.Value_31:
            scr_player_surfing();
            break;
        
        case UnknownEnum.Value_32:
            scr_player_diveboard();
            break;
        
        case UnknownEnum.Value_33:
            scr_player_ski();
            break;
        
        case UnknownEnum.Value_34:
            scr_player_skibounce();
            break;
        
        case UnknownEnum.Value_35:
            scr_player_skirow();
            break;
        
        case UnknownEnum.Value_36:
            scr_player_hammerattack();
            break;
        
        case UnknownEnum.Value_37:
            scr_player_hammertwirl();
            break;
        
        case UnknownEnum.Value_38:
            scr_player_snowball();
            break;
        
        case UnknownEnum.Value_39:
            scr_player_snowball_jump();
            break;
        
        case UnknownEnum.Value_40:
            scr_player_snowball_wall();
            break;
        
        case UnknownEnum.Value_42:
            scr_player_skateboard();
            break;
        
        case UnknownEnum.Value_41:
            scr_player_skateboardIntro();
            break;
        
        case UnknownEnum.Value_43:
            scr_player_skateboardmove();
            break;
        
        case UnknownEnum.Value_44:
            scr_player_skateboardhitwall();
            break;
        
        case UnknownEnum.Value_45:
            scr_player_skateboardramp();
            break;
        
        case UnknownEnum.Value_46:
            scr_player_skateboardwall();
            break;
        
        case UnknownEnum.Value_47:
            scr_player_skateboardAim();
            break;
        
        case UnknownEnum.Value_48:
            scr_player_slip();
            break;
        
        case UnknownEnum.Value_51:
            scr_player_coconut_intro();
            break;
        
        case UnknownEnum.Value_50:
            scr_player_coconut_gun();
            break;
        
        case UnknownEnum.Value_52:
            scr_player_coconut_shoot();
            break;
			
	    case UnknownEnum.Value_53:
            scr_player_hammerdive();
            break;

        
        case UnknownEnum.Value_54:
            get_input();
            var spd = key_attack ? 20 : 10;
            var move = key_right + key_left;
            var move2 = key_down - key_up;
            y += (move2 * spd);
            x += (move * spd);
            hsp = 0;
            vsp = 0;
            
            if (key_jump2)
                state = UnknownEnum.Value_0;
            
            break;
			
		case UnknownEnum.Value_55:
		scr_naomi_normal()
		break;
		
    }
    
    if (state == UnknownEnum.Value_1 || state == UnknownEnum.Value_16 || state == UnknownEnum.Value_12)
        mask_index = spr_crouchmask;
    else
        mask_index = spr_player_mask;
}
else
{
    get_input();
    
    if (hitstun.time > 0)
    {
        image_speed = 0;
        x = hitstun.x + irandom_range(-5, 5);
        y = hitstun.y + irandom_range(-5, 5);
        hitstun.time--;
        
        if (instance_exists(obj_fadeout))
        {
            hitstun.time = 0;
            x = hitstun.x;
            y = hitstun.y;
            hitstun.is = false;
        }
    }
    else
    {
        x = hitstun.x;
        y = hitstun.y;
        hitstun.is = false;
    }
}

if sprite_index == spr_player_coconut_intro
global.combo.timer = 60

if sprite_index == spr_ernie_superjumpstart || sprite_index == spr_ernie_superjump
grav = 0.35
else
grav = 0.5

if isErnie
{
	if hasSpray
	{
		sprites.idle = spr_ernie_idlespray
	sprites.mach3 = spr_ernie_runwithspray
	}
	else
	{
		sprites.idle = spr_ernie_idle
	sprites.mach3 = spr_ernie_run
	}
}

if isMildred
{
	if palIndex == 11
	{
		sprites.idle = spr_juandanger_idle
		sprites.move = spr_juandanger_move
		sprites.mach3 = spr_juandanger_mach3
		sprites.mach3turn = spr_player_mach3turn;
	}
	else if palIndex == 12
		{
		sprites.idle = spr_player_idle
		sprites.move = spr_player_move
		sprites.mach3 = spr_mildrednew_mach3
		sprites.mach3turn = spr_mildrednew_mach3turn;
	}
	else
	{
		sprites.idle = spr_player_idle
		sprites.move = spr_player_move
		sprites.mach3 = spr_player_mach3
		sprites.mach3turn = spr_player_mach3turn;
	}
}


						    if (sprite_index == spr_ernie_divebombprep && animation_end())
			{
        sprite_index = sprites.divebomb
		vsp = 15
		freefallsmash = 15
			}
			
		if ((sprite_index == spr_player_groundpoundland || sprite_index == asset_get_index("spr_ernie_divebombland")) && sprite_index != spr_player_hitceiling)

			{
								if key_jump && isErnie
			{
				            state = UnknownEnum.Value_2;
            vsp = -22;
			freefalling = -25
            image_index = 0;
            sprite_index = spr_ernie_groundpoundjump;
			}
			
			if key_attack && isMilton
			{
				        flash = true;
        state = UnknownEnum.Value_4;
				movespeed = 13
				image_index = 0;
				sprite_index = spr_milton_groundpoundrun
			}
			}
		
if (onSnow && abs(hsp) > 1 && place_meeting(x, y + 1, obj_iceslippery))
{
    if (random(1) < 0.3)
    {
        effect_create_above(ef_snow, x + random_range(-4,4), y, 1, c_white);
    }
}



var on_ice = place_meeting(x, y + 1, obj_iceslippery); 

var on_ice = place_meeting(x, y + 1, obj_iceslippery);

if (on_ice && grounded)
{
    if (place_meeting(x + sign(hsp), y, obj_solid) && abs(hsp) > 0)
    {
    
        if (state == UnknownEnum.Value_38 || state == UnknownEnum.Value_39 || state == UnknownEnum.Value_40)
        {
            FMODevent_oneshot("event:/Sfx/Player/bump", x, y);
            shake_camera(3, 5);
            vsp = -5;
            movespeed = approach(movespeed, 0, 4); 
            xscale *= -1; 
            sprite_index = spr_player_snowball_fall;
            image_index = 0;
            repeat(3) create_particleStatic(spr_snowparticle, x + (xscale * 20), y, 1, 1);
        }

        else if (state != UnknownEnum.Value_48)
        {
            state = UnknownEnum.Value_48; 
            sprite_index = spr_player_slipsyrup;
            image_index = 0;
            vsp = -12; 
            movespeed = -5; 
            xscale = -sign(hsp); 
            FMODevent_oneshot("event:/Sfx/Player/bump", x, y);
            create_particleStatic(spr_hurteffect, x, y, 1, 1);
        }
    }
}

