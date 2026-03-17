event_inherited();


filename = "save1.ini"; 
if (variable_global_exists("saveFile")) {
    filename = global.saveFile;
} else if (variable_global_exists("current_save")) {
    filename = "save" + string(global.current_save) + ".ini";
}


var _marker = 0;
if (file_exists(filename)) 
{
    ini_open(filename);
    _marker = ini_read_real("Markers", "w1lester", 0);
    ini_close();
}


if (_marker == 1) 
{
    global.level_gate_unlocked = true;
    instance_destroy(); 
    exit; 
}
else 
{

    global.level_gate_unlocked = false; 
}


bump_buffer = 0;
depth = 95; 
