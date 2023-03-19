object_name = obj_player;
in_veiculo = false;

#region Status
spd_walk = 2;
spd_run  = 4;
#endregion

key_down	= false;
key_up		= false;
key_left	= false;
key_right	= false;
key_run		= false;
key_entry	= false;




enum States{
	Idle,
	Walk,
	Height
}

// ------------------
state = false;
view_dir = false;
player_sprite = false;
