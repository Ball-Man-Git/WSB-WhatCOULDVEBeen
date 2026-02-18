room_goto(obj_player.targetRoom);
instance_destroy();
instance_create(x, y, obj_titlecardRating);
if obj_player.key_taunt
global.hardMode = true
else
global.hardMode = false
