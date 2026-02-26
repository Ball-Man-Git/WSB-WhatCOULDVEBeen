global.combo.timer = 60;
obj_player.super = true;
obj_player.flash = true;
global.collect += 1000
instance_create(x, y, obj_whiteflash);
instance_destroy();
