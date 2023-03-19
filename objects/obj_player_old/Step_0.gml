





var _spd_hor = key_right - key_left,
	_spd_ver = key_down  - key_up,
	_spd = 0;

// Walk or Run:
if (_spd_hor != 0 or _spd_ver != 0) {if key_run{_spd = spd_run}else{_spd = spd_walk}
}

// Stoped:
else{
	if key_entry{	
		var _ship = instance_nearest(x, y, obj_ship);
		if distance_to_object(_ship) <= 20{
			key_entry = false;
			obj_control.in_control = _ship;
			_ship.player_in = self;
			in_veiculo = true;
		}
	}
	if key_utility and distance_to_object(obj_terminal) <= 20{
		var _inst = instance_nearest(x, y, obj_terminal);
		key_utility = false;
		obj_control.in_control = _inst;
		_inst.player_in = self;
	}
	if key_utility and distance_to_object(obj_door) <=30{
		var _inst = instance_nearest(x, y, obj_door);
		key_utility = false;
		_inst.open = !_inst.open;
	}
}



if in_veiculo{
	x = obj_control.x;
	y = obj_control.y;
	image_alpha = 0;
}else{
	image_alpha = 1;
}





#region Collision / Moviment mechanics
//1-^

#region Moviment Calc
//0-^
var _dir = point_direction(0, 0, _spd_hor, _spd_ver),
	_spd_hor = lengthdir_x(_spd, _dir),
	_spd_ver = lengthdir_y(_spd, _dir);

#endregion Moviment Calc

#region Collision
//0-^
	#region Collision X / Hor
//------^
		if place_meeting(x + _spd_hor, y, obj_collision){
			while !place_meeting(x + sign(_spd_hor), y, obj_collision){
				x += sign(_spd_hor);
			}
			_spd_hor = 0;
		}
	#endregion Collision X / Hor

	#region Collision Y / Ver
//------^
		if place_meeting(x, y + _spd_ver, obj_collision){
			while !place_meeting(x, y + sign(_spd_ver), obj_collision){
				y += sign(_spd_ver);
			}
			_spd_ver = 0;
		}
	#endregion Collision Y / Ver

#endregion Collision

x += _spd_hor;
y += _spd_ver;

#endregion Collision / Moviment mechanics