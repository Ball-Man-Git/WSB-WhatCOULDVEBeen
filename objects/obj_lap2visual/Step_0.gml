if (down)
{
    y = approach(y, 96, 2);
    
    if (y == 96 && alarm[0] <= 0)
        alarm[0] = 100;
}
else
{
    y = approach(y, -80, 2);
    
    if (y == -80)
        instance_destroy();
}

x = obj_screensizer.displayWidth / 2;
