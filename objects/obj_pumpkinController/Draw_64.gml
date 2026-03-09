if (dark) 
{
    if (!surface_exists(fadeSurface))
        fadeSurface = surface_create(obj_screensizer.displayWidth, obj_screensizer.displayHeight);

    surface_set_target(fadeSurface);
    draw_clear_alpha(c_black, 0);
    draw_set_color(c_black);
    draw_rectangle(0, 0, obj_screensizer.displayWidth, obj_screensizer.displayHeight, false);
    
    draw_set_color(c_white);
    gpu_set_blendmode(bm_subtract);
    
    if (instance_exists(obj_player))
    {
        var _vx = camera_get_view_x(view_camera[0]);
        var _vy = camera_get_view_y(view_camera[0]);
        var _px = clamp(obj_player.x - _vx, 32, obj_screensizer.displayWidth - 32);
        var _py = obj_player.y - _vy;
        

        if (circleSize > 0) {
            draw_set_alpha(1);
            draw_circle(_px + irandom_range(2, -2), _py + irandom_range(2, -2), circleSize, false);
            draw_set_alpha(0.5);
            draw_circle(_px + irandom_range(2, -2), _py + irandom_range(2, -2), circleSize + 12, false);
        }


        var _p_alpha = clamp(circleSize / 128, 0, 1); 
        with (obj_pumpkin) {
            draw_set_alpha(_p_alpha);
            draw_circle(x - _vx, y - _vy, 64, false);
            draw_set_alpha(_p_alpha * 0.5);
            draw_circle(x - _vx, y - _vy, 76, false);
        }
        with (obj_pumpkinfollow) {
            draw_set_alpha(_p_alpha);
            draw_circle(x - _vx, y - _vy, 64, false);
            draw_set_alpha(_p_alpha * 0.5);
            draw_circle(x - _vx, y - _vy, 76, false);
        }
        draw_set_alpha(1);
    }
    
    gpu_set_blendmode(bm_normal);
    surface_reset_target();
    
    draw_set_alpha(0.6);
    draw_surface(fadeSurface, 0, 0);
    draw_set_alpha(1);
}
