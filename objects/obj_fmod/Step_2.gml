if (obj_pause.active)
    exit;

var fidelity = (obj_player.isMildred && obj_player.palIndex == 12)
if obj_player.isJuan == true
fmod_studio_system_set_parameter_by_name("character", 3, true);
else if fidelity
fmod_studio_system_set_parameter_by_name("character", 4, true);
else if obj_player.isNaomi == true
fmod_studio_system_set_parameter_by_name("character", 5, true);
else if global.PlayerCharacters[obj_player.character].usesPlaceholderMusic == false
fmod_studio_system_set_parameter_by_name("character", obj_player.character, true);
else
fmod_studio_system_set_parameter_by_name("character", 1, true);

fmod_studio_system_set_parameter_by_name("ampedup", global.amped_up, true);