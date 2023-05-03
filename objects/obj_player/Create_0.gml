mask_index = spr_player_walk_down;

#region var player statistics:
spd_run		= 4;
spd_walk	= 2;
#endregion

#region States:
state_free	= false;
#endregion

#region Var macanics:
stoped		= false;
collision	= true;
view_dir	= false;
in_veiculo	= false;
dist_interc	= 30;
#endregion




function find_obj (_obj){
	if distance_to_object(_obj) <= dist_interc{
		return (instance_nearest(x, y, _obj));
	}else{
		return false;
	}
}
