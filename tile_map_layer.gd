extends TileMapLayer

var prev_gravity = Player.gravitydir


func _ready() -> void:
	pass 


func _process(_delta: float) -> void:
	if Player.gravitydir != prev_gravity:
		prev_gravity = Player.gravitydir
		change_tile()

func change_tile() -> void:
	if Player.gravitydir == 1:
		#Finds a tile and replaces it
		###BLUE###
		for cell in get_used_cells_by_id(0, Vector2i(1, 0)):
			set_cell(cell, 0, Vector2i(2, 0))
		for cell in get_used_cells_by_id(0, Vector2i(0, 2)):
			set_cell(cell, 0, Vector2i(1, 2))
		for cell in get_used_cells_by_id(0, Vector2i(0, 5)):
			set_cell(cell, 0, Vector2i(1, 5))
		for cell in get_used_cells_by_id(0, Vector2i(2, 5)):
			set_cell(cell, 0, Vector2i(0, 6))
		for cell in get_used_cells_by_id(0, Vector2i(1, 6)):
			set_cell(cell, 0, Vector2i(2, 6))
		###BLUE###
		
		###ORANGE###
		for cell in get_used_cells_by_id(0, Vector2i(1, 1)):
			set_cell(cell, 0, Vector2i(0, 1))
		for cell in get_used_cells_by_id(0, Vector2i(0, 3)):
			set_cell(cell, 0, Vector2i(2, 2))
		for cell in get_used_cells_by_id(0, Vector2i(1, 7)):
			set_cell(cell, 0, Vector2i(0, 7))
		for cell in get_used_cells_by_id(0, Vector2i(0, 8)):
			set_cell(cell, 0, Vector2i(2, 7))
		for cell in get_used_cells_by_id(0, Vector2i(2, 8)):
			set_cell(cell, 0, Vector2i(1, 8))
		###ORANGE###
	else:
		#Finds a tile and replaces it
		###BLUE###
		for cell in get_used_cells_by_id(0, Vector2i(2, 0)):
			set_cell(cell, 0, Vector2i(1, 0))
		for cell in get_used_cells_by_id(0, Vector2i(1, 2)):
			set_cell(cell, 0, Vector2i(0, 2))
		for cell in get_used_cells_by_id(0, Vector2i(1, 5)):
			set_cell(cell, 0, Vector2i(0, 5))
		for cell in get_used_cells_by_id(0, Vector2i(0, 6)):
			set_cell(cell, 0, Vector2i(2, 5))
		for cell in get_used_cells_by_id(0, Vector2i(2, 6)):
			set_cell(cell, 0, Vector2i(1, 6))
		###BLUE###
		
		###ORANGE###
		for cell in get_used_cells_by_id(0, Vector2i(0, 1)):
			set_cell(cell, 0, Vector2i(1, 1))
		for cell in get_used_cells_by_id(0, Vector2i(2, 2)):
			set_cell(cell, 0, Vector2i(0, 3))
		for cell in get_used_cells_by_id(0, Vector2i(0, 7)):
			set_cell(cell, 0, Vector2i(1, 7))
		for cell in get_used_cells_by_id(0, Vector2i(2, 7)):
			set_cell(cell, 0, Vector2i(0, 8))
		for cell in get_used_cells_by_id(0, Vector2i(1, 8)):
			set_cell(cell, 0, Vector2i(2, 8))
			###ORANGE###
