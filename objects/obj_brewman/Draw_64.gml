
if (show_ui) {
    var p_port = spr_onewayman; 
    var b_port = spr_onewayman; 
    
    var _php = 6; 
    
    if (_php <= 0) p_port = spr_bigcollect1;
    else if (_php <= 1) p_port = spr_destroyabledonut;
    else if (_php <= 3) p_port = spr_metalblock;
    else if (_php <= 5) p_port = spr_destroyablecrate;

    if (hp <= 0) b_port = spr_bigcollect1;
    else if (hp <= 2) b_port = spr_destroyabledonut;
    else if (hp <= 5) b_port = spr_metalblock;
    else if (hp <= 8) b_port = spr_destroyablecrate;

    draw_sprite_ext(p_port, 0, 100, 100, 1, 1, 0, c_white, 1);
    draw_sprite_ext(b_port, 0, obj_screensizer.displayWidth - 100, 100, -1, 1, 0, c_white, 1);

    for (var i = 0; i < 6; i++) {
        var _yy = (i < _php) ? 100 : 1000; 
        draw_sprite(spr_collect1, 0, 180 + (i * 40), _yy);
    }
    for (var j = 0; j < 10; j++) {
        var _byy = (j < hp) ? 100 : 1000;
        draw_sprite(spr_collect2, 0, obj_screensizer.displayWidth - 180 - (j * 40), _byy);
    }
}


if (dark_alpha > 0) {
    if (!surface_exists(hitstun_surface)) hitstun_surface = surface_create(obj_screensizer.displayWidth, obj_screensizer.displayHeight);
    surface_set_target(hitstun_surface);
    draw_clear_alpha(c_black, dark_alpha);
    gpu_set_blendmode(bm_subtract);
    draw_circle(x - camera_get_view_x(view_camera), y - camera_get_view_y(view_camera), spotlight_radius, false);
    if (instance_exists(obj_player)) draw_circle(obj_player.x - camera_get_view_x(view_camera), obj_player.y - camera_get_view_y(view_camera), spotlight_radius, false);
    gpu_set_blendmode(bm_normal);
    surface_reset_target();
    draw_surface(hitstun_surface, 0, 0);
}
