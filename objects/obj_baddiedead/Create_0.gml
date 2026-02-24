hsp = random_range(10, 12) * sign(x - obj_player.x);
vsp = random_range(-10, -14);
alarm[0] = 5;
usePalette = false;
spr_palette = spr_playerPal;
paletteIndex = 0;
spr_pattern = global.patternSpr;
if global.redempEnemyDeath
{
spinSpd = random_range(-25, 25);
sizeSpd = random_range(-0.05, 0.05);
}
else
{
	spinSpd = 0
sizeSpd = 0
}
size = 1;
patColors = spr_playerPatColors;
