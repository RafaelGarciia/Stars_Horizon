if open{
	if move_left{
		if x > xstart-32{
			x -= 1;
		}
	}else{
		if x < xstart+32{
			x += 1;
		}
	}
	if alarm[0] <= 0{
		alarm[0] = 240;
	}
}else{
	if move_left{
		if x < xstart{
			x += 1;
		}
	}else{
		if x > xstart{
			x -= 1;
		}
	}
}
