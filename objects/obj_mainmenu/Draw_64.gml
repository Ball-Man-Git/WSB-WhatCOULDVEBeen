pal_swap_set(pal_mainmenu_room, roomPaletteIndex, false);
draw_sprite_ext(spr_mainmenu_tvBackground, bg_frame, 0, 0, menuscale + 1, menuscale + 1, 0, c_white, 1);
draw_sprite_ext(TVsprite, TVindex, 768, 288, menuscale + 1, menuscale + 1, 0, c_white, 1);


if (!dark)
    draw_sprite_ext(spr_mainmenu_shelf, 0, 0, -170, menuscale + 1, menuscale + 1, 0, c_white, 1);

shader_reset();

for (var i = 0; i < array_length(saveFiles); i++)
{
    var q = saveFiles[i];
    draw_set_alpha(q.movie.alpha);
    pal_swap_set(pal_mainmenu_room, roomPaletteIndex, false);
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
        draw_sprite(spr_mainmenu_tomatoface, q.faceIndex, 100, 440);
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
var _xx = obj_screensizer.displayWidth - 32;
var _yy = obj_screensizer.displayHeight - 32;
draw_set_alpha(1);

if (dark)
{
    draw_sprite(spr_mainmenu_dark, dark_frame, 0, 0);
   
    draw_sprite_ext(spr_mainmenu_shelfdark, 0, 0, -170, menuscale + 1, menuscale + 1, 0, c_white, 1);
}

var base_x = 60;
var base_y = 40;

if (scene >= 0)
{
    draw_set_alpha(title_alpha);
    draw_sprite(spr_whatcouldvebeen, 0, title_x - 50 + sin(title_timer)*2.0, (title_y - 10) + cos(title_timer)*1.5);
    draw_sprite(spr_bacon, 0, title_x - 50 + sin(title_timer*0.9)*2.0, (title_y - 10) + cos(title_timer*1.1)*1.5);
    draw_sprite(spr_whatsshakin, 0, title_x - 50 + sin(title_timer*1.1)*2.0, (title_y - 10) + cos(title_timer*0.9)*1.5);

    draw_set_alpha(corner_alpha);
    draw_sprite_ext(spr_saves,   0, corner_x + sin(title_timer*0.8)*1.5 - 240, corner_y + cos(title_timer*0.9)*0.8 - 20, 1,1,0,c_white,corner_alpha);
    draw_sprite_ext(spr_curly,   0, corner_x + sin(title_timer*1.0)*1.2 - 240, corner_y + cos(title_timer*0.7)*0.6 - 20, 1,1,0,c_white,corner_alpha);
    draw_sprite_ext(spr_options, 0, corner_x + sin(title_timer*0.9)*1.0 - 240, corner_y + cos(title_timer*1.1)*0.5 - 20, 1,1,0,c_white,corner_alpha);
    draw_set_alpha(1);
}
