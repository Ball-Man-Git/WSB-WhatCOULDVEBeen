x = obj_player.x;
y = obj_player.y;
var _skateboard = [UnknownEnum.Value_42, UnknownEnum.Value_44, UnknownEnum.Value_41, UnknownEnum.Value_43, UnknownEnum.Value_45, UnknownEnum.Value_46, UnknownEnum.Value_47];

if (!array_contains(_skateboard, obj_player.state))
    instance_destroy();
