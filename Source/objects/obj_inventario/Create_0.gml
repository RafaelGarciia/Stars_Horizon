open  = false;
scale = 2;

// Tamanho da sprite dos slots
slots_size = 16 * scale;

// x e y do primeiro slot
first_slot_x = 15 * scale;
first_slot_y = 24 * scale;

// Quantidade dos slots do inventario
slots_horizontal = 8;
slots_vertical   = 3;

// Total de slots do inventario
total_slots = slots_horizontal * slots_vertical;

// Margem entre os slots em pixeis
pixel_margin = 1 * scale;

// Tamanho da sprite do inventario
inventory_spr_width  = sprite_get_width (spr_inventory) * scale;
inventory_spr_height = sprite_get_height(spr_inventory) * scale;

// Item e posição selecionada pelo mouse
selected_item	  = -1;
selected_position = -1;


// Lista de Armas
enum Weapons{Sword,	Bow, Staff,	Height}

// Lista de items dos inimigos
enum Enemy_items{Slime_Parts, Orc_helmet, Ork_tooth, Height}

// Tipos de informações dos items
enum Infos{Item, Quantity, Sprite, Height}

// Criando o grid_database do inventario
inventory_grid = ds_grid_create(Infos.Height, total_slots);
// Seta que todos os valores do grid seja -1;
ds_grid_set_region(inventory_grid, 0, 0, Infos.Height-1, total_slots-1, -1);


function inventory_add_item_(){
	///@description Função para adicionar items ao inventario
	///@arg Item
	///@arg Quantidade
	///@arg Sprite
	
	var _grid  = obj_inventory.inventory_grid;
	var _check = 0;
	
	// Verifica qual slot esta vazio
	while _grid[# Infos.Item, _check] != -1{
		_check++;
	}
	
	// Adiciona as informações do item
	_grid[# 0, _check] = argument[0];
	_grid[# 1, _check] = argument[1];
	_grid[# 2, _check] = argument[2];
}

// Adiciona items para testes
inventory_add_item(Weapons.Bow, 2, spr_items);
inventory_add_item(Weapons.Bow, 4, spr_items);
inventory_add_item(Enemy_items.Ork_tooth , 3, spr_enemy_items);
inventory_add_item(Enemy_items.Orc_helmet, 3, spr_enemy_items);