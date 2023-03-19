if obj_control.in_control == id{
	if key_exit{
		obj_control.in_control = player_use;
		player_use = false;
		screen = Screens.Home;
		active = false;
	}
}