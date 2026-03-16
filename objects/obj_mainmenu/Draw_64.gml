
var _drawPal = miltonMode ? (roomPaletteIndex + 4) : roomPaletteIndex;
pal_swap_set(pal_mainmenu_room, _drawPal, false);


draw_sprite_ext(spr_mainmenu_tvBackground, bg_frame, 0, 0, menuscale + 1, menuscale + 1, 0, c_white, 1);
draw_sprite_ext(TVsprite, TVindex, 768, 288, menuscale + 1, menuscale + 1, 0, c_white, 1);

if (!dark)
    draw_sprite_ext(spr_mainmenu_shelf, 0, 0, -170, menuscale + 1, menuscale + 1, 0, c_white, 1);

shader_reset();


var _driveSprite = asset_get_index("spr_egghead_charge");
if (_driveSprite != -1)
{
    var _driveColor = miltonMode ? c_lime : c_white;
    draw_sprite_ext(_driveSprite, 0, driveX, driveY, 1, 1, 0, _driveColor, 1);
}


for (var i = 0; i < array_length(saveFiles); i++)
{
    var q = saveFiles[i];
    draw_set_alpha(q.movie.alpha);
    pal_swap_set(pal_mainmenu_room, _drawPal, false); 
    draw_sprite_ext(spr_mainmenu_movies, q.movie.index, q.movie.x, q.movie.y, q.movie.scale + menuscale, q.movie.scale + menuscale, 0, moviefadeC, q.movie.alpha);
    shader_reset();
    draw_set_alpha(1);
}

for (var i = 0; i < array_length(saveFiles); i++)
{
    if (scene != 2)
    {
        var q = saveFiles[i];
        draw_set_alpha(q.faceAlpha * hudAlpha);
        

        var _drawFaceSpr = miltonMode ? spr_player_idle : spr_mainmenu_tomatoface;
        draw_sprite(_drawFaceSpr, q.faceIndex, 100, 440);
        
        draw_set_alpha(1);
    }
}


draw_set_alpha(hudAlpha);

if (TVsprite != spr_mainmenu_tvStatic)
{
    draw_sprite(spr_tapestatus, 0, 732, 267);
    draw_set_halign(fa_center);
    draw_set_font(global.percentageFont);
    draw_text(732, 267, string("{0}%", round(percentageReal)));
}


draw_set_halign(fa_center);
draw_set_halign(fa_left);
draw_set_font(global.creditsfont);
draw_set_font(global.smallfont);
draw_set_color(c_white);
draw_set_halign(fa_right);
draw_set_alpha(1);

if (dark)
{
    draw_sprite(spr_mainmenu_dark, dark_frame, 0, 0);
    draw_sprite_ext(spr_mainmenu_shelfdark, 0, 0, -170, menuscale + 1, menuscale + 1, 0, c_white, 1);
}


if (scene >= 0)
{
    var _uiColor = c_white;
    if (miltonTransition) _uiColor = c_red; 
    else if (miltonMode) _uiColor = c_lime; 

    draw_set_alpha(title_alpha);
    
    draw_sprite_ext(spr_whatcouldvebeen, 0, title_x - 50 + sin(title_timer)*2.0, (title_y - 10) + cos(title_timer)*1.5, 1, 1, 0, _uiColor, title_alpha);
    draw_sprite_ext(spr_bacon, 0, title_x - 50 + sin(title_timer*0.9)*2.0, (title_y - 10) + cos(title_timer*1.1)*1.5, 1, 1, 0, _uiColor, title_alpha);
    draw_sprite_ext(spr_whatsshakin, 0, title_x - 50 + sin(title_timer*1.1)*2.0, (title_y - 10) + cos(title_timer*0.9)*1.5, 1, 1, 0, _uiColor, title_alpha);

    draw_set_alpha(corner_alpha);
    draw_sprite_ext(spr_saves,   0, corner_x + sin(title_timer*0.8)*1.5 - 240, corner_y + cos(title_timer*0.9)*0.8 - 20, 1, 1, 0, _uiColor, corner_alpha);
    draw_sprite_ext(spr_curly,   0, corner_x + sin(title_timer*1.0)*1.2 - 240, corner_y + cos(title_timer*0.7)*0.6 - 20, 1, 1, 0, _uiColor, corner_alpha);
    draw_sprite_ext(spr_options, 0, corner_x + sin(title_timer*0.9)*1.0 - 240, corner_y + cos(title_timer*1.1)*0.5 - 20, 1, 1, 0, _uiColor, corner_alpha);
    
    draw_set_alpha(1);
}


if (miltonTransition) 
{
    staticIndex += 0.35; 
    var _static = asset_get_index("spr_tvstatic");
    if (_static != -1)
    {
        draw_sprite_tiled_ext(_static, staticIndex, 0, 0, 1, 1, c_white, 1);
    }
}
