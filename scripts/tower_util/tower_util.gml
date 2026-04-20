function ledge_bump(arg0, arg1) //gml_Script_ledge_bump
{
    if ((arg1 == undefined))
        arg1 = 4
    var old_x = x
    var old_y = y
    x += (xscale * arg1)
    var ty = try_solid(0, -1, obj_solid, arg0)
    x = old_x
    if ((ty != -1))
    {
        y -= ty
        x += xscale
        if scr_solid(x, y)
        {
            x = old_x
            y = old_y
            return true;
        }
        with (obj_camera)
            yOffset += ty
        return false;
    }
    return true;
}