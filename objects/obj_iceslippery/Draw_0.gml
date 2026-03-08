draw_self();

var _ice = id;
with (all)
{
    var _reflectable = (object_index == obj_player || object_get_parent(object_index) == obj_baddie || object_index == obj_collect);
    
    if (_reflectable && visible)
    {
        if (bbox_right > _ice.bbox_left && bbox_left < _ice.bbox_right && bbox_bottom <= _ice.bbox_top && bbox_bottom > _ice.bbox_top - 200)
        {
            var _dist = _ice.bbox_top - bbox_bottom;
            var _alpha = lerp(0.4, 0, _dist / 150); 
            
            if (_alpha > 0)
            {
                var _drawXscale = (object_index == obj_player) ? (xscale * xscaleMulti) : image_xscale;
                var _drawYscale = (object_index == obj_player) ? (yscaleMulti) : image_yscale;
                
             
                draw_sprite_ext(
                    sprite_index, 
                    image_index, 
                    x, 
                    _ice.bbox_top + _dist + 50, 
                    _drawXscale, 
                    -_drawYscale, 
                    image_angle, 
                    c_white, 
                    _alpha
                );
            }
        }
    }
}
