if state == UnknownEnum.Value_1 && sprite_index == spr_egghead_charge
	{
		fmod_studio_event_instance_set_paused(chargeSnd, false);
		if !FMODevent_isplaying(chargeSnd)
			fmod_studio_event_instance_start(chargeSnd);
		FMODSet3dPos(chargeSnd, x, y); 
	}
	else{
		fmod_studio_event_instance_stop(chargeSnd, UnknownEnum.Value_1);
	}