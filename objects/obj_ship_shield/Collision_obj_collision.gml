dir = point_direction(other.x, other.y, x, y);
with instance_ship{
	motion_set(other.dir, speed);
}

shild_power -= 1;

image_alpha = 1;