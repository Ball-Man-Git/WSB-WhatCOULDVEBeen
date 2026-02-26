getMenu_input();

if (fadeout == false)
    blackAlpha = approach(blackAlpha, 0, 0.01);
else if (fadeout == true)
    blackAlpha = approach(blackAlpha, 1, 0.01);

switch (scene)
{
    case 0:
        if (blackAlpha == 0 && alarm[0] <= 0 && alarm[1] <= 0 && !fadeout)
            alarm[0] = 60;
        
        if ((fadeout && blackAlpha == 1) || key_jump2)
        {
            showFmod = true;
            showHeart = false;
			showTu = false
            scene = 1;
            fadeout = false;
        }
        
        break;
    
    case 1:
        if (blackAlpha == 0 && alarm[1] <= 0 && !fadeout)
            alarm[1] = 120;
        
        if ((fadeout && blackAlpha == 1) || key_jump2)
		{
            instance_create(x, y, obj_video)
			instance_destroy()
		}
        
        break;
}
