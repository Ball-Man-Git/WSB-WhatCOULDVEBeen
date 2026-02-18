if ((ds_map_find_value(async_load, "type") == "fmod_studio_event_description_set_callback"))
{
    global.CurrentBeat = ds_map_find_value(async_load, "beat")
	with obj_camera
	event_user(0)
}