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
if obj_player.isMildred == true and obj_player.isErnie == false and obj_player.isMilton == false
{
addPalette("Retail Wears", "Unlocked by being Tu", 1, true);
addPalette("Mint Wears", "A Housewarming Gift", 10, true);
addPalette("Red Wears", "Unlocked by ???", 2, true);
addPalette("Orange Wears", "Unlocked by ???", 3, true);
addPalette("Blue Wears", "Unlocked by ???", 4, true);
addPalette("Yellow Wears", "Unlocked by ???", 5, true);
addPalette("Teal Wears", "Unlocked by ???", 6, true);
addPalette("Purple Wears", "Unlocked by ???", 7, true);
addPalette("Pristine Wears", "Unlocked by ???", 8, true);
addPalette("Darker Wears", "Unlocked by ???", 9, true);
addPalette("Dangerous Wears", "Unlocked by ???", 11, true);
addPalette("Racing Wears", "Unlocked by ???", 0, true);
addPalette("New-ish Wears", "Unlocked by being undead", 12, true);
}
if obj_player.isMilton == true and obj_player.isErnie == false and obj_player.isMildred == false
{
addPalette("Retail Wears", "Unlocked by being a Cool guy", 1, true);
addPalette("Calm Wears", "Unlocked by being cool", 2, true);
addPalette("Chainsaw Wears", "Unlocked by being some green dude", 3, true);
addPalette("Spraypainted Wears", "Unlocked by spraypainting all of the areas in Shell City", 4, true);
}
if obj_player.isErnie == true and obj_player.isMilton == false and obj_player.isMildred == false
{
addPalette("Retail Wears", "Unlocked by being a dude named Ernie", 1, true);
addPalette("Real Wears", "Unlocked by ???", 2, true);
addPalette("Crappy Wears", "Unlocked by ???", 10, true);
addPalette("Loino", "Unlocked by begging Ball Man to add a Loino palette", 3, true);
addPalette("Goonerslop Wears", "Unlocked by ???", 11, true);
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
