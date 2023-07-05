var _spd		= 0,
	  _spd_hor = 0,
	  _spd_ver	= 0;

#region Entrada de Comandos
_spd_hor = key_move_right - key_move_left;
_spd_ver = key_move_down - key_move_up;
#endregion

#region Comparação
//if _spd_hor == 0 and _spd_ver == 0 {stopped = true} else {stopped = false;}
if key_run {_spd = spd_run} else {_spd = spd_walk}

var _dir = point_direction(x, y, x+_spd_hor, y+_spd_ver);

#endregion

switch state{
	case "IDLE": {
		sprite_index = spr_hero_down;
		image_index = 0;
		
		
		if _spd_hor != 0 or _spd_ver != 0{state = "WALK"}	
	}break;
	case "WALK":{
		view_dir = floor(_dir)/90;
		switch view_dir{
			case   0: sprite_index = spr_hero_right;	  break;
			case 0.5: sprite_index = spr_hero_up_right;   break;
			case   1: sprite_index = spr_hero_up;		  break;
			case 1.5: sprite_index = spr_hero_up_left;	  break;
			case   2: sprite_index = spr_hero_left;		  break;
			case 2.5: sprite_index = spr_hero_down_left;  break;
			case   3: sprite_index = spr_hero_down;		  break;
			case 3.5: sprite_index = spr_hero_down_right; break;
		}
		
		show_debug_message(view_dir)
		
		if _spd_hor == 0 and _spd_ver == 0{state = "IDLE"}
		
		_spd_hor = lengthdir_x(_spd, _dir);
		_spd_ver = lengthdir_y(_spd, _dir);
		
		x += _spd_hor;
		y += _spd_ver;
	}break;
}





//if instance_exists(obj_inventory){
//	#region Inventario
//	if instance_exists(obj_item) and obj_inventory.open == false{
//		var _inst = instance_nearest(x, y, obj_item);
//		if distance_to_point(_inst.x, _inst.y) <= 20{
//			if keyboard_check_pressed(ord("F")){
//				obj_inventory.inventory_add_item(_inst.image_index, _inst.quantity, _inst.sprite_index);
//				instance_destroy(_inst);
//			}
//		}
//	}
//	#endregion
//}