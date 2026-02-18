if (!ds_list_empty(afterimages))
{
    for (var i = 0; i < ds_list_size(afterimages); i++)
    {
        var q = ds_list_find_value(afterimages, i);
        
        with (q)
        {
            switch (type)
            {
                case UnknownEnum.Value_7:
                case UnknownEnum.Value_4:
                case UnknownEnum.Value_5:
                case UnknownEnum.Value_0:
                    for (var r = 0; r < array_length(alarm); r++)
                    {
                        if (alarm[r] >= 0)
                            alarm[r]--;
                    }
                    
                    visible = other.blink;
                    
                    if (alarm[0] == 0)
                        fadeout = true;
                    
                    alpha = clamp(alpha, 0, 0.65);
                    
                    if (fadeout == true)
                    {
                        fadeoutAlpha = approach(fadeoutAlpha, 0, 0.15);
                        
                        if (fadeoutAlpha == 0)
                        {
                            with (other)
                            {
                                q = undefined;
                                ds_list_delete(afterimages, i);
                                i--;
                            }
                        }
                    }
                    
                    break;
                
                case UnknownEnum.Value_1:
                    image_alpha -= 0.15;
                    
                    if (image_alpha <= 0)
                    {
                        with (other)
                        {
                            q = undefined;
                            ds_list_delete(afterimages, i);
                            i--;
                        }
                    }
                    
                    break;
                
                case UnknownEnum.Value_3:
                case UnknownEnum.Value_2:
                case UnknownEnum.Value_6:
                    image_alpha -= 0.05;
                    
                    if (image_alpha <= 0)
                    {
                        with (other)
                        {
                            q = undefined;
                            ds_list_delete(afterimages, i);
                            i--;
                        }
                    }
                    
                    break;
            }
        }
    }
}
