        instance_destroy();
        surface_free(surf);
        
        with (instance_create(x, y, obj_baddiedead))
        {
            image_speed = 0;
            sprite_index = spr_flodead;
        }
		
		        if (!FMODevent_isplaying(snd_voice))
            fmod_studio_event_instance_start(snd_voice);
        
        FMODSet3dPos(snd_voice, x, y);