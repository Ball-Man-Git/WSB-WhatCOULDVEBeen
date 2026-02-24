x += hsp;
y += vsp;
vsp += 0.5;
image_angle += spinSpd;

if (abs(spinSpd) > 40)
    size += sizeSpd;

size = clamp(size, 0, 5);


if (!in_camera())
    instance_destroy();
