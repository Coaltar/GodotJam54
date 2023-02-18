extends Node
const MatrixFunctions = preload("MatrixFunctions.gd")



var matrix
var start_point
var dimension
	
func _init(dimension):
	dimension = dimension
	matrix = MatrixFunctions.create_zero_matrix(dimension)
	start_point = Vector2(randi() % int(dimension.x), randi() % int(dimension.y))
	print(start_point)
	randomize()

func generate():
	
	var stack = [start_point]
	var focus = stack[0]
	while(len(stack) > 0):
		matrix[focus.x][focus.y] = 1
		var neighbors = get_neighbors(matrix, focus)
		var unvisited = []
		for n in neighbors:
			if(not is_wall(matrix, n)):
				unvisited.append(n)
		if len(unvisited) > 0:
			focus = unvisited[randi() % len(unvisited)]
			stack.append(focus)
		else:
			focus = stack.pop_back()
	return matrix
	
	
static func get_neighbors(matrix, pos):
	var x_bound = len(matrix)
	var y_bound = len(matrix[0])
	var neighbors = []
	if(pos.x -1 >= 0):
		neighbors.append(Vector2(pos.x-1,pos.y))
	if(pos.x +1 < x_bound):
		neighbors.append(Vector2(pos.x+1,pos.y))
	if(pos.y -1 >= 0):
		neighbors.append(Vector2(pos.x,pos.y-1))
	if(pos.y + 1 < y_bound):
		neighbors.append(Vector2(pos.x,pos.y+1))
	return neighbors
	
static func is_wall(matrix, pos):
	var neighbors = get_neighbors(matrix,pos)
	var paths = 0
	for pos in neighbors:
		if(matrix[pos.x][pos.y] == 1):
			paths += 1
	if paths <= 1:
		return false
	else:
		return true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
