// ... [Existing surface and black rectangle code] ...
gpu_set_blendmode(bm_subtract);

if (instance_exists(obj_player))
{
    var _vx = camera_get_view_x(view_camera[0]);
    var _vy = camera_get_view_y(view_camera[0]);
    
    // 1. PLAYER GLOW
    var _px = clamp(obj_player.x - _vx, 32, obj_screensizer.displayWidth - 32);
    var _py = obj_player.y - _vy;
    if (circleSize > 0)
    {
        draw_set_alpha(1);
        draw_circle(_px + irandom_range(2, -2), _py + irandom_range(2, -2), circleSize, false);
        draw_set_alpha(0.5);
        draw_circle(_px + irandom_range(2, -2), _py + irandom_range(2, -2), circleSize + 12, false);
    }


    var _p_alpha = clamp(circleSize / 128, 0, 1); 
    
    with (obj_pumpkin) {
        var _cx = x - _vx; var _cy = y - _vy;
        draw_set_alpha(_p_alpha);
        draw_circle(_cx, _cy, 64, false); 
        draw_set_alpha(_p_alpha * 0.5);
        draw_circle(_cx, _cy, 76, false); 
    }
    
    with (obj_pumpkinfollow) {
        var _cx = x - _vx; var _cy = y - _vy;
        draw_set_alpha(_p_alpha);
        draw_circle(_cx, _cy, 64, false); 
        draw_set_alpha(_p_alpha * 0.5);
        draw_circle(_cx, _cy, 76, false); 
    }
    draw_set_alpha(1);
}

gpu_set_blendmode(bm_normal);
surface_reset_target();

