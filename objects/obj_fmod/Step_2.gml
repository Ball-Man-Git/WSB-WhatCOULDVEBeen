if (obj_pause.active)
    exit;

if obj_player.isJuan == true
fmod_studio_system_set_parameter_by_name("character", 3, true);
else if global.PlayerCharacters[obj_player.character].usesPlaceholderMusic == false
fmod_studio_system_set_parameter_by_name("character", obj_player.character, true);
else
fmod_studio_system_set_parameter_by_name("character", 1, true);

fmod_studio_system_set_parameter_by_name("ampedup", global.amped_up, true);
fmod_studio_system_set_parameter_by_name("isNaomi", obj_player.isNaomi, true);