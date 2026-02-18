if (obj_pause.active)
    exit;

if global.PlayerCharacters[obj_player.character].usesPlaceholderMusic == false
fmod_studio_system_set_parameter_by_name("character", obj_player.character, true);
else
fmod_studio_system_set_parameter_by_name("character", 1, true);
