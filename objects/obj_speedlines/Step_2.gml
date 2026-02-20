depth = target.depth - 2;

if (target.movespeed > 13)
{
    x = target.isErnie ? target.x - (17.5 * image_xscale) : target.x;
    y = target.y;
    image_angle = 0;
    image_xscale = target.xscale;
}
else
{
    instance_destroy();
}
