saveiconAlpha = 0;
saveiconIndex = 0;
saveiconTimer = 0;
clothesUnlockAlpha = 0;
clothesUnlockTimer = 0;
depth = obj_screensizer.depth + 150;
global.secret_layers = [];

if (!variable_global_exists("confirmed_ids")) 
{
    global.confirmed_ids = ds_list_create();
    global.unconfirmed_ids = ds_list_create();
    global.potables_total = 0;
}

global.miltonMode = false; 
