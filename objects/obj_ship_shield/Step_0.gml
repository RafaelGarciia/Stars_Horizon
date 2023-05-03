x = instance_ship.x;
y = instance_ship.y - 20;

image_xscale = instance_ship.sprite_scale+0.5;
image_yscale = instance_ship.sprite_scale+0.5;

if shield_power <= 0 {
	instance_destroy();
}

if image_alpha > 0.05{
	image_alpha -= 0.003;
}