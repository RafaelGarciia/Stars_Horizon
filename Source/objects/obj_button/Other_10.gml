switch string_lower(text) {
	case "none":	show_message("Botão sem função definida!"); break;
	case "options": room_goto(stat);	break;
	case "play":	room_goto(station_skylab);	break;
}