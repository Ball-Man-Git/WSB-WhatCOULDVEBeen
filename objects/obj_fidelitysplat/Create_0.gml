tiles = [];
layers = layer_get_all();

for (var i = 0; i < array_length(layers); i++) {
	var tileId = layer_tilemap_get_id(layers[i]);
	if (tileId != -1) {
		array_push(tiles, tileId);
	}
}
tiles = array_reverse(tiles)
tileSurf = surface_create(sprite_width, sprite_height);
image_speed = 0
image_index = irandom_range(0, image_number);
image_angle = irandom_range(0, 360)
xscale = irandom_range(1, 3)
yscale = irandom_range(1, 3)
depth = 80
blend = #ff8986