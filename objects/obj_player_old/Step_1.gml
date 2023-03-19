


switch state {
	case States.Idle:
		player_sprite = spr_player_idle_down;
		break;
	
	case States.Walk:
		player_sprite = spr_player_idle_down;
		break;
	
	default:
		state = States.Idle;
		break;
}



/// @description Controls
if obj_control.in_control == id{

key_up		= keyboard_check(ord("W"));
key_left	= keyboard_check(ord("A"));
key_down	= keyboard_check(ord("S"));
key_right	= keyboard_check(ord("D"));
key_run		= keyboard_check(vk_shift);

key_entry	= keyboard_check_released(ord("F"));
key_utility = keyboard_check_released(ord("E"));

}