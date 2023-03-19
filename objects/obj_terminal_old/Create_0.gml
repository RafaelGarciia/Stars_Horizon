sprite_scale = 1;
player_in = false;

depth = -y;

escala_x = 0;
escala_y = 0;
active = false;

text = false;
tela = 0;

enum Tela{
	Home,
	Select,
	Spaw_ship,
	Dock_full
}

function button (_sprite, _x, _y, _mx, _my){
	var _sprw = sprite_get_width(_sprite)/2,
		_sprh = sprite_get_height(_sprite)/2;
	
	draw_sprite(_sprite, 0, _x, _y);
	if point_in_rectangle(_mx, _my, _x-_sprw, _y-_sprh, _x+_sprw, _y+_sprh){
		if mouse_check_button_pressed(mb_left){
			return true;
		}
	}
}


function spawn_ship (model_ship){
	for (var i = 0; i < instance_number(obj_dock_bay); ++i;){
		var _inst = instance_find(obj_dock_bay,i);
		if distance_to_object(_inst) <= 2000{
			if _inst.ship_in_bay == false {
				instance_create_layer(_inst.x, _inst.y, "Instances", obj_ship,{ship_model : model_ship});
				return true;
			}
		}
	}
}