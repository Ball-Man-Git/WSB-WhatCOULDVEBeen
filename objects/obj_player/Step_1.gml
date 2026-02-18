if (key_jump2)
    jumpBuffer = 15;

if (key_slap2)
    slapBuffer = 15;

jumpBuffer = approach(jumpBuffer, 0, 1);
slapBuffer = approach(slapBuffer, 0, 1);
playerSounds();
isMildred = character == UnknownEnum.Value_0;
isMilton = character == UnknownEnum.Value_1;
isErnie = character == UnknownEnum.Value_2;

if (supertaunt >= 10 && !canSupertaunt)
{
    ini_open(global.saveFile);
    
    if (ini_read_real("Game", "supertauntTip", false) != true)
    {
        ini_write_real("Game", "supertauntTip", true);
        scr_transfotip(lang_get_phrase("tip_supertaunt"));
    }
    
    ini_close();
    canSupertaunt = true;
    flash = true;
    FMODevent_oneshot("event:/Sfx/Player/gotsupertaunt", x, y);
}
else if (supertaunt < 10 && canSupertaunt)
{
    canSupertaunt = false;
}

if (sprites != global.PlayerCharacters[character].sprites.player)
{
    sprites = global.PlayerCharacters[character].sprites.player;
    spr_palette = global.PlayerCharacters[character].playerPal;
    global.patternSpr = global.PlayerCharacters[character].patternSpr;
    
    if (character == UnknownEnum.Value_1)
        palIndex = 1;
    
    ini_open(global.saveFile);
    
    if (ini_read_string("Game", "Pattern", "spr_playerPat_threads") != -1 && character == UnknownEnum.Value_0)
    {
        global.patternSpr = asset_get_index(ini_read_string("Game", "Pattern", "spr_playerPat_threads"));
        aalIndex = ini_read_real("Game", "Palette", 1);
    }
    
    ini_close();
}
