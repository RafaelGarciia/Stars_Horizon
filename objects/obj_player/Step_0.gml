var _spd = 0;
var _spd_hor = 0, _spd_ver = 0;

#region If controled:
if state_free{
	var _spd_hor = key_right - key_left,
		_spd_ver = key_down  - key_up;
}
	
if stoped{
	if key_utility{		
		if distance_to_object(obj_terminal) <= dist_interc{
			key_utility = false;
			var _inst = instance_nearest(x, y, obj_terminal);
			obj_control.in_control = _inst;
			_inst.player_use = id;
		}else if distance_to_object(obj_simple_door) <= dist_interc{
			key_utility = false;
			var _inst = instance_nearest(x, y, obj_simple_door);
			_inst.open = true;
			
		}
		
		//if distance_to_object(obj_terminal) <= dist_interc{
		//	key_utility = false;
		//	var _inst = instance_nearest(x, y, obj_terminal);
		//	obj_control.in_control = _inst;
		//	_inst.player_in = self;	
		//}
	}
	
	if key_entry{
		if distance_to_object(obj_ship) <= dist_interc and !in_veiculo{
			key_entry = false;
			var _inst = instance_nearest(x, y, obj_ship);
			if _inst.accent[0] == false{
				obj_control.in_control = _inst;
				_inst.accent[0] = id;
				in_veiculo = _inst;
			}else if _inst.accent[1] == false{
				in_veiculo = _inst;
				_inst.accent[1] = id;
			}
		}else{
			if in_veiculo != false{in_veiculo.accent[1] = false}
			in_veiculo	= false;
			collision	= true;
		}
	}
	
}else{
	if key_run {_spd = spd_run} else {_spd = spd_walk};
}
#endregion

if in_veiculo == false{
	image_alpha = 1;
}else{
	collision = false;
	x = in_veiculo.x;
	y = in_veiculo.y;
	image_alpha = 0;
}

#region Moviment:
if (_spd_hor == 0 and _spd_ver == 0) {stoped = true} else {stoped = false};
var _dir = point_direction(x, y, x + _spd_hor, y + _spd_ver);
if !stoped { view_dir = floor(_dir)/90 };
_spd_hor = lengthdir_x(_spd, _dir);
_spd_ver = lengthdir_y(_spd, _dir);
#endregion

#region Collision:
if collision{
	if place_meeting(x + _spd_hor, y, obj_collision){
		while !place_meeting(x + sign(_spd_hor), y, obj_collision){ x += sign(_spd_hor)	}
		_spd_hor = 0;
	}
	
	if place_meeting(x, y + _spd_ver, obj_collision){
		while !place_meeting(x, y + sign(_spd_ver), obj_collision){ y += sign(_spd_ver)	}
		_spd_ver = 0;
	}
	
	x += _spd_hor;
	y += _spd_ver;
}
#endregion