var _grid = ds_depthgrid;
var _inst_num = 0;


_inst_num += instance_number(obj_dock_bay);
//_inst_num += instance_number(obj_door);
_inst_num += instance_number(obj_elevator_door);
_inst_num += instance_number(obj_elevator_frame);
_inst_num += instance_number(obj_npc);
_inst_num += instance_number(obj_player);
_inst_num += instance_number(obj_simple_door);
_inst_num += instance_number(obj_ship);
_inst_num += instance_number(obj_terminal);

ds_grid_resize(_grid, 2, _inst_num);

var yy = 0;
if instance_exists(obj_dock_bay){
	with(obj_dock_bay){
		_grid[# 0, yy] = id;
		_grid[# 1, yy] = y;
		yy++;
	}
}
//if instance_exists(obj_door){
//	with(obj_door){
//		_grid[# 0, yy] = id;
//		_grid[# 1, yy] = y;
//		yy++;
//	}
//}
if instance_exists(obj_elevator_door){
	with(obj_elevator_door){
		_grid[# 0, yy] = id;
		_grid[# 1, yy] = y;
		yy++;
	}
}
if instance_exists(obj_elevator_frame){
	with(obj_elevator_frame){
		_grid[# 0, yy] = id;
		_grid[# 1, yy] = y;
		yy++;
	}
}
if instance_exists(obj_npc){
	with(obj_npc){
		_grid[# 0, yy] = id;
		_grid[# 1, yy] = y;
		yy++;
	}
}
if instance_exists(obj_player){
	with(obj_player){
		_grid[# 0, yy] = id;
		_grid[# 1, yy] = y;
		yy++;
	}
}
if instance_exists(obj_simple_door){
	with(obj_simple_door){
		_grid[# 0, yy] = id;
		_grid[# 1, yy] = y;
		yy++;
	}
}
if instance_exists(obj_ship){
	with(obj_ship){
		_grid[# 0, yy] = id;
		_grid[# 1, yy] = y;
		yy++;
	}
}
if instance_exists(obj_terminal){
	with(obj_terminal){
		_grid[# 0, yy] = id;
		_grid[# 1, yy] = y;
		yy++;
	}
}

ds_grid_sort(_grid, 1, true);

yy = 0;
var _inst;
repeat(_inst_num){
	_inst = _grid[# 0, yy];
	with(_inst){ event_perform(ev_draw, 0) }
	yy++;
}

