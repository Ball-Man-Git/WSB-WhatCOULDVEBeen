depth = 20;
palettes = [];
selected = 0;
textAlpha = 0;
indicatorAlpha = 0;
indicator = false;

addPalette = function(arg0, arg1, arg2, arg3 = true, arg4 = global.PlayerCharacters[obj_player.character].patternSpr)
{
    var q = 
    {
        pName: arg0,
        desc: arg1,
        index: arg2,
        sprite: arg4
    };
    
    if (arg3)
    {
        array_push(palettes, q);
        return q;
    }
};

ini_open(global.saveFile);
if obj_player.isErnie == false
{
addPalette("Retail Wears", "Unlocked by being Tu", 1, true, global.PlayerCharacters[obj_player.character].patternSpr);
addPalette("Mint Wears", "A Housewarming Gift", 10, true, global.PlayerCharacters[obj_player.character].patternSpr);
addPalette("Red Wears", "Unlocked by ???", 2, true, global.PlayerCharacters[obj_player.character].patternSpr);
addPalette("Orange Wears", "Unlocked by ???", 3, true, global.PlayerCharacters[obj_player.character].patternSpr);
addPalette("Blue Wears", "Unlocked by ???", 4, true, global.PlayerCharacters[obj_player.character].patternSpr);
addPalette("Yellow Wears", "Unlocked by ???", 5, true, global.PlayerCharacters[obj_player.character].patternSpr);
addPalette("Teal Wears", "Unlocked by ???", 6, true, global.PlayerCharacters[obj_player.character].patternSpr);
addPalette("Purple Wears", "Unlocked by ???", 7, true, global.PlayerCharacters[obj_player.character].patternSpr);
addPalette("Pristine Wears", "Unlocked by ???", 8, true, global.PlayerCharacters[obj_player.character].patternSpr);
addPalette("Darker Wears", "Unlocked by ???", 9, true, global.PlayerCharacters[obj_player.character].patternSpr);
addPalette("Dangerous Wears", "Unlocked by ???", 11, true, global.PlayerCharacters[obj_player.character].patternSpr);
}
else
{
addPalette("Retail Wears", "Unlocked by being Tu", 1, true, global.PlayerCharacters[obj_player.character].patternSpr);
addPalette("Real Wears", "Unlocked by ???", 2, true, global.PlayerCharacters[obj_player.character].patternSpr);
addPalette("Trans Wears", "Ernie looks transgender tbh - SuperDevon85", 4, true, spr_pattern_trans);
addPalette("Crappy Wears", "Unlocked by ???", 10, true, global.PlayerCharacters[obj_player.character].patternSpr);
addPalette("Loino", "Unlocked by begging Ball Man to add a Loino palette", 3, true, global.PlayerCharacters[obj_player.character].patternSpr);
addPalette("Goonerslop Wears", "Unlocked by ???", 11, true, global.PlayerCharacters[obj_player.character].patternSpr);
}
ini_close();

for (var i = 0; i < array_length(palettes); i++)
{
    var q = palettes[i].index;
    var p = palettes[i].sprite;
    
    if (q == obj_player.palIndex && p == global.patternSpr)
    {
        selected = i;
        break;
    }
}
