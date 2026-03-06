if (sprite_index == spr_pumpkin_collected)
{
    image_alpha -= 0.05;
    if (animation_end() || image_alpha <= 0)
    {
        create_particleStatic(spr_genericpoofeffect, x, y, 1, -60);
        instance_destroy();
    }
}