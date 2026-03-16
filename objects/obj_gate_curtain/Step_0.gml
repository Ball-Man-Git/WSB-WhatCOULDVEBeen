
if (global.level_gate_unlocked) 
{

    if (state == 0) 
    {
        state = 1; 
        sprite_index = spr_open;
        image_index = 0;
        image_speed = 0.35;
        
      
        if (instance_exists(obj_camera)) {
            with(obj_camera) { shake_mag = 3; shake_mag_acc = 3 / 10; }
        }
    }
    
 
    if (state == 1 && animation_end()) 
    {
        
        ini_open(filename);
        ini_write_real("Markers", "w1lester", 1);
        ini_close();
        
       
        instance_destroy();
    }
}
