extends TileMap
const MatrixFunctions = preload("MatrixFunctions.gd")
const ProceduralMapA = preload("ProceduralMapA.gd")
var ProceduralMaze = preload("ProceduralMaze.gd")


const MAP_DIMENSION = 16

const dimension = Vector2(MAP_DIMENSION, MAP_DIMENSION)
var map_array = MatrixFunctions.create_zero_matrix(dimension)
# Called when the node enters the scene tree for the first time.


func totally_random_map(size):
	var map = MatrixFunctions.create_zero_matrix(size)
	randomize()
	for x in range(4):
		for y in range(4):
			var rand = randi() % 2
			map[x][y] = rand
	return map
	
func _ready():
	
	#var rand_map = totally_random_map(MAP_DIMENSION)
	#var testA = ProceduralMapA.get_test_map(1,7)
	var MazeGen = ProceduralMaze.new(dimension)
	var maze_matrix = MazeGen.generate()
	
	
	load_map(maze_matrix, dimension)
	pass # Replace with function body.


func load_map(matrix, dimension):
	for x in range(dimension.x):
		for y in range(dimension.y):
			set_cell(x, y, matrix[x][y] + 1)
	
	
	
	
	
