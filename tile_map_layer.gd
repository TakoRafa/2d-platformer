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
		for cell in get_used_cells_by_id(0, Vector2i(1, 0)):
			set_cell(cell, 0, Vector2i(2, 0))
		for cell in get_used_cells_by_id(0, Vector2i(1, 1)):
			set_cell(cell, 0, Vector2i(0, 1))
		for cell in get_used_cells_by_id(0, Vector2i(0, 2)):
			set_cell(cell, 0, Vector2i(1, 2))
		for cell in get_used_cells_by_id(0, Vector2i(0, 3)):
			set_cell(cell, 0, Vector2i(2, 2))
	else:
		#Finds a tile and replaces it
		for cell in get_used_cells_by_id(0, Vector2i(2, 0)):
			set_cell(cell, 0, Vector2i(1, 0))
		for cell in get_used_cells_by_id(0, Vector2i(0, 1)):
			set_cell(cell, 0, Vector2i(1, 1))
		for cell in get_used_cells_by_id(0, Vector2i(1, 2)):
			set_cell(cell, 0, Vector2i(0, 2))
		for cell in get_used_cells_by_id(0, Vector2i(2, 2)):
			set_cell(cell, 0, Vector2i(0, 3))
