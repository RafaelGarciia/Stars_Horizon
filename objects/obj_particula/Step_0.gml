x -= spd;
if spd >= 19{depth = -500}else{depth = 1}

image_alpha  = spd/2;
image_xscale = spd/5;
image_yscale = (spd/20)-0.2;

if x <= 0{
	spd = random(20);
	x = room_width;
	y = random(room_height);
}