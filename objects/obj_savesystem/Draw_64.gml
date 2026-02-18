if (saveiconAlpha > 0)
{
    draw_set_alpha(saveiconAlpha);
    draw_sprite(spr_littlesaltdance, saveiconIndex, obj_screensizer.displayWidth - 74, obj_screensizer.displayHeight - 74);
    draw_set_alpha(1);
}

if (clothesUnlockAlpha > 0)
{
    draw_set_alpha(clothesUnlockAlpha);
    draw_sprite(spr_newwears, obj_player.character, obj_screensizer.displayWidth - 200, obj_screensizer.displayHeight - 200);
    draw_set_alpha(1);
}