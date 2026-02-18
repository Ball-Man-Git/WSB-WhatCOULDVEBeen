global.RandomSeed = random_get_seed();

function ss_instance_create(arg0, arg1, arg2, arg3 = {})
{
    return instance_create_depth(arg0, arg1, 0, arg2, arg3);
}


function layer_type_get_id(arg0, arg1)
{
    if (layer_exists(arg0))
    {
        var layer_elements = layer_get_all_elements(arg0);
        
        for (var i = 0; i < array_length(layer_elements); i++)
        {
            if (layer_get_element_type(layer_elements[i]) == arg1)
                return layer_elements[i];
        }
    }
    
    return -1;
}

function layer_tilemap_get_id_fixed(arg0)
{
    return layer_type_get_id(arg0, 5);
}

function layer_background_get_id_fixed(arg0)
{
    return layer_type_get_id(arg0, 1);
}

function layer_asset_get_id(arg0)
{
    return layer_type_get_id(arg0, 4);
}

function layer_get_all_sprites(arg0)
{
    var temp_array = [];
    
    if (layer_exists(arg0))
    {
        var a = layer_get_all_elements(arg0);
        
        for (var i = 0; i < array_length(a); i++)
        {
            if (layer_get_element_type(a[i]) == 4)
                array_push(temp_array, a[i]);
        }
    }
    
    return temp_array;
}

function layer_get_all_instances(arg0)
{
    var temp_array = [];
    
    if (layer_exists(arg0))
    {
        var a = layer_get_all_elements(arg0);
        
        for (var i = 0; i < array_length(a); i++)
        {
            if (layer_get_element_type(a[i]) == 2)
                array_push(temp_array, a[i]);
        }
    }
    
    return temp_array;
}

function layer_change_background(arg0, arg1)
{
    if (arg0 != arg1)
    {
        var a = layer_get_all();
        
        for (var i = 0; i < array_length(a); i++)
        {
            var back_id = layer_background_get_id_fixed(a[i]);
            
            if (layer_background_get_sprite(back_id) == arg0)
                layer_background_sprite(back_id, arg1);
        }
    }
}

function layer_change_tileset(arg0, arg1)
{
    if (arg0 != arg1)
    {
        var a = layer_get_all();
        
        for (var i = 0; i < array_length(a); i++)
        {
            var tile_id = layer_tilemap_get_id_fixed(a[i]);
            
            if (tilemap_get_tileset(tile_id) == arg0)
                tilemap_tileset(tile_id, arg1);
        }
    }
}

function sprite_animation_end(arg0 = sprite_index, arg1 = image_index, arg2 = sprite_get_number(arg0), arg3 = image_speed)
{
    return (arg1 + ((arg3 * sprite_get_speed(arg0)) / ((sprite_get_speed_type(arg0) == 1) ? 1 : game_get_speed(gamespeed_fps)))) >= arg2;
}


global.particleSystem = part_system_create();
global.particlesMap = ds_map_create();
global.particles = part_emitter_create(global.particleSystem);
global.particleList = ds_list_create();
global.collectParticleList = ds_list_create();
particle_init(spr_paintSplash, 0.35, 0);
function particle_init(arg0, arg1, arg2)
{
    ds_map_set(global.particlesMap, arg0, 
    {
        image_speed: arg1,
        depth: arg2
    });
}

function create_particle(arg0, arg1, arg2, arg3 = 0, arg4 = 1, arg5 = 1, arg6 = {})
{
    var particle_id = ss_instance_create(arg0 + irandom_range(-arg3, arg3), arg1 + irandom_range(-arg3, arg3), obj_fade_particle, arg6);
    particle_id.sprite_index = arg2;
    particle_id.particle_scale(arg4, arg5);
    var _Map = ds_map_find_value(global.particlesMap, arg2);
    
    if (!is_undefined(_Map))
    {
        particle_id.particle_depth(_Map.depth);
        particle_id.particle_imgspd(_Map.image_speed);
    }
    
    return particle_id;
}