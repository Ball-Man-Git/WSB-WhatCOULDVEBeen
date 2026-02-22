if (show == false)
    textY = approach(textY, -64, 2);
else
    textY = approach(textY, 27, 10);

visible = text != "";

switch (room)
{
    default:
        text = "";
        break;
    
    case hotel_receptionentrance:
    case hotel_1:
	case hotel_2:
	case hotel_3:
	case hotel_basement:
        text = lang_get_phrase(string("roomname_{0}", room_get_name(room)));
        break;
}
