obj_player.state = -4;
worldNames = ["Lunch Hour", "Happy Holidays", "Privacy", "Dusty Attic"];
levels = [];
var _world1 = [[tutorial_1, "tutorial", "A", "Tutorial"], [mangrove_1, "forest", "A", "Waybackyard"], [shell_1, "shell", "A", "Shell City"], [beach_1, "beach", "A", "Fruitcup Coast"]];
var _world2 = [[milkshek_1, "milkshek", "A", "Milkshake Peaks"], [kingdom_1, "kingdom", "A", "Snowcone Kingdom"]];
var _world3 = [[castle_1, "castle", "A", "Castle Pumpkinstein"]];
var _world0 = [[crashout_1, "crashout", "A", "Crashout City"], [cafe_1, "cafe", "A", "Cup Cafe"], [radiation_1, "radiation", "A", "The Prone Zone"]]
array_push(levels, _world1);
array_push(levels, _world2);
array_push(levels, _world3);
array_push(levels, _world0);
selectedWorld = 0;
selectedLevel = 0;
potableIndex = 0;
