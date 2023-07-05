/// @desc Lista de items


function Item () constructor{
	/// @func Item()
	/// @desc Item base para a construção dos outros items.
	
	sprite = {image : 0, index : 0};
	item_id = 0;
	name = 0;
	quantity = 5;
}


function Sword () : Item () constructor{
	/// @func Sword()
	/// @desc Constroi um item Espada.
	
	sprite.image = spr_item_sword;
	item_id = 1;
	name = "Espada";
}


function Bow () : Item () constructor{
	/// @func Bow()
	/// @desc Constroi um item Arco.
	
	sprite.image = spr_item_bow;
	item_id = 2;
	name = "Arco";
}