player_use = false;

escala_x = 0;
escala_y = 0;
active = false;
screen = 0;
spaw_bay = false;

enum Screens{
	Home,
	Select_ship,
	Spaw_ship,
	Dock_full
}


function button(_sprite, _x, _y, _mouse_x, _mouse_y){
	var _spr_w = sprite_get_width (_sprite)/2,
		_spr_h = sprite_get_height(_sprite)/2;
	
	draw_sprite(_sprite, 0, _x, _y);
	if point_in_rectangle(_mouse_x, _mouse_y, (_x - _spr_w), (_y - _spr_h), (_x + _spr_w), (_y + _spr_h)){
		if mouse_check_button_released(mb_left){
			return mb_left;
		}
	}
}

function spawn_ship (_model_ship){
	for (var i=0; i < instance_number(obj_dock_bay); ++i){
		var _inst = instance_find(obj_dock_bay, i);
		if distance_to_object(_inst) <= 2000{
			if _inst.ship_in_bay == false {
				instance_create_layer(_inst.x, _inst.y, "Objects", obj_ship, {ship_model : _model_ship});
				spaw_bay = _inst.bay_id;
				return true;
			}
		}else{
			return false;
		}
	}
}