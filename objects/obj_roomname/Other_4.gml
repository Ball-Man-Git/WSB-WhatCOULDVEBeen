switch (room)
{
    default:
        text = "";
        break;
    
    case hotel_receptionentrance:
	case hotel_hallway:
    case hotel_1:
	case hotel_2:
	case hotel_3:
	case hotel_basement:
	case mangrove_1:
	case mangrove_2:
	case mangrove_3:
	case mangrove_4:
	case mangrove_5:
	case mangrove_6:
	case mangrove_7:
	case mangrove_8:
	case mangrove_9:
	case mangrove_10:
	case mangrove_11:
	case mangrove_12:
	case mangrove_13:
	case mangrove_secret1:
	case mangrove_secret2:
	case mangrove_secret3:
	case mangrove_lap:
        text = lang_get_phrase(string("roomname_{0}", room_get_name(room)));
        break;
}

show = true;
alarm[0] = 180;
