extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const MAP_DIMENSION = 16

var map_array = []
# Called when the node enters the scene tree for the first time.
func _ready():
	
	#var rng = RandomNumberGenerator.new()
	randomize()
	for x in range(MAP_DIMENSION):
		map_array.append([])
		for y in range(MAP_DIMENSION):
			#map_array[x].append(0)
			var rand = randi() % 2
			map_array[x].append(rand)
	#print(map_array)
	generate_map()
	pass # Replace with function body.

func generate_map():
	for x in range(MAP_DIMENSION):
		for y in range(MAP_DIMENSION):
			set_cell(x, y, map_array[x][y])
			


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
