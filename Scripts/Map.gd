extends Node
const MatrixFunctions = preload("MatrixFunctions.gd")
const ProceduralMapA = preload("ProceduralMapA.gd")
var ProceduralMaze = preload("ProceduralMaze.gd")


const MAP_DIMENSION = 100

const dimension = Vector2(MAP_DIMENSION, MAP_DIMENSION)
var map_array = MatrixFunctions.create_zero_matrix(dimension)
# Called when the node enters the scene tree for the first time.


	
func _ready():
	load_random_maze()

func load_random_maze():
	var MazeGen = ProceduralMaze.new(dimension)
	var maze_matrix = MazeGen.generate()
	load_map(maze_matrix, dimension)
	
	var t_size_x = $TileMap.cell_size.x
	var t_size_y = $TileMap.cell_size.x
	
	var start_pos = Vector2(MazeGen.start_point.x * t_size_x, MazeGen.start_point.y* t_size_y)
	$Player.position = start_pos
	

func load_map(matrix, dimension):
	for x in range(dimension.x):
		for y in range(dimension.y):
			$TileMap.set_cell(x, y, matrix[x][y] + 1)
