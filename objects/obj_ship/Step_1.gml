#region Controls:
if obj_control.in_control == id {

	key_speed_up		= keyboard_check(ord("W"));
	key_speed_down		= keyboard_check(ord("S"));
	key_spin_left		= keyboard_check(ord("A"));
	key_spin_right		= keyboard_check(ord("D"));

	key_exit			= keyboard_check_released(ord("F"));
	key_power_on		= keyboard_check_released(ord("P"));
	key_shild_on		= keyboard_check_released(ord("O"));
	key_jump			= keyboard_check_released(ord("J"));

	key_move_forward	= keyboard_check(vk_up);
	key_move_reverse	= keyboard_check(vk_down);
	key_move_left		= keyboard_check(vk_left);
	key_move_right		= keyboard_check(vk_right);
	
}
#endregion