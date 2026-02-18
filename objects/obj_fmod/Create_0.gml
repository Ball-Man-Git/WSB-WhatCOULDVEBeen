var _max_channels = 1024;
var _flags_core = UnknownEnum.Value_0;
var _flags_studio = UnknownEnum.Value_1;
fmod_studio_system_create();
show_debug_message("fmod_studio_system_create: " + string(fmod_last_result()));
fmod_studio_system_init(_max_channels, _flags_studio, _flags_core);
show_debug_message("fmod_studio_system_init: " + string(fmod_last_result()));
fmod_main_system = fmod_studio_system_get_core_system();
loadedBanks = [];
var banks = ["sound/Desktop/Master.bank", "sound/Desktop/Master.strings.bank", "sound/Desktop/Music.bank", "sound/Desktop/Sfx.bank", "sound/Desktop/Ambience.bank"];

for (var i = 0; i < array_length(banks); i++)
{
    var b = working_directory + banks[i];
    array_push(loadedBanks, fmod_studio_system_load_bank_file(b, UnknownEnum.Value_0));
    show_debug_message(string("Loaded {0}!", b));
}
